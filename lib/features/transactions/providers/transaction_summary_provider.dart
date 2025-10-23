import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../categories/models/category.dart';
import '../../categories/providers/category_controller.dart';
import '../models/transaction_entry.dart';
import 'transaction_controller.dart';

part 'transaction_summary_provider.freezed.dart';

/// 全局选中月份 Provider，默认当前月
final selectedMonthProvider = StateProvider<DateTime>((ref) {
  final now = DateTime.now();
  return DateTime(now.year, now.month);
});

@freezed
class MonthlySummary with _$MonthlySummary {
  const factory MonthlySummary({
    @Default(0) double income,
    @Default(0) double expense,
    @Default(0) double balance,
  }) = _MonthlySummary;
}

@freezed
class DailyTransactions with _$DailyTransactions {
  const factory DailyTransactions({
    required DateTime date,
    @Default(<TransactionEntry>[]) List<TransactionEntry> entries,
    @Default(0) double totalExpense,
    @Default(0) double totalIncome,
  }) = _DailyTransactions;
}

@freezed
class CategorySummary with _$CategorySummary {
  const factory CategorySummary({
    required String categoryId,
    required String categoryName,
    @Default('') String icon,
    @Default('') String colorHex,
    @Default(0) double expense,
    @Default(0) double income,
  }) = _CategorySummary;
}

@freezed
class TransactionSummary with _$TransactionSummary {
  const factory TransactionSummary({
    @Default(MonthlySummary()) MonthlySummary monthlySummary,
    @Default(<DailyTransactions>[]) List<DailyTransactions> dailyGroups,
    @Default(<CategorySummary>[]) List<CategorySummary> categorySummaries,
  }) = _TransactionSummary;
}

final transactionSummaryProvider = Provider<TransactionSummary>((ref) {
  final transactions = ref.watch(transactionControllerProvider);
  final categories = ref.watch(categoryListProvider);
  final selectedMonth = ref.watch(selectedMonthProvider);
  final currentMonth = DateTime(selectedMonth.year, selectedMonth.month);

  final currentMonthEntries = transactions.where((entry) {
    return entry.occurredAt.year == currentMonth.year &&
        entry.occurredAt.month == currentMonth.month;
  }).toList();

  double income = 0;
  double expense = 0;
  for (final entry in currentMonthEntries) {
    switch (entry.type) {
      case TransactionType.expense:
        expense += entry.amount;
        break;
      case TransactionType.income:
        income += entry.amount;
        break;
      case TransactionType.transfer:
        break;
    }
  }

  final Map<DateTime, List<TransactionEntry>> grouped = {};
  for (final entry in currentMonthEntries) {
    final date = DateTime(entry.occurredAt.year, entry.occurredAt.month,
        entry.occurredAt.day);
    grouped.putIfAbsent(date, () => []);
    grouped[date]!.add(entry);
  }

  final dailyGroups = grouped.entries.map((entry) {
    final totalIncome = entry.value
        .where((element) => element.type == TransactionType.income)
        .fold<double>(0, (prev, e) => prev + e.amount);
    final totalExpense = entry.value
        .where((element) => element.type == TransactionType.expense)
        .fold<double>(0, (prev, e) => prev + e.amount);
    entry.value.sort((a, b) => b.occurredAt.compareTo(a.occurredAt));
    return DailyTransactions(
      date: entry.key,
      entries: entry.value,
      totalExpense: totalExpense,
      totalIncome: totalIncome,
    );
  }).toList()
    ..sort((a, b) => b.date.compareTo(a.date));

  final Map<String, CategorySummary> categoryMap = {};

  Category _resolveCategory(TransactionEntry entry) {
    return categories.firstWhere(
      (item) => item.id == entry.categoryId,
      orElse: () => Category(
        id: entry.categoryId,
        name: entry.categoryId.isEmpty
            ? '转账'
            : entry.type == TransactionType.income
                ? '收入'
                : '未分类',
        icon: '🔖',
        color: '#ECECEC',
        type: entry.type == TransactionType.income
            ? CategoryType.income
            : CategoryType.expense,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
  }

  for (final entry in currentMonthEntries) {
    final category = _resolveCategory(entry);
    categoryMap.putIfAbsent(
      category.id,
      () => CategorySummary(
        categoryId: category.id,
        categoryName: category.name,
        icon: category.icon,
        colorHex: category.color,
      ),
    );
    final summary = categoryMap[category.id]!;
    if (entry.type == TransactionType.expense) {
      categoryMap[category.id] =
          summary.copyWith(expense: summary.expense + entry.amount);
    } else if (entry.type == TransactionType.income) {
      categoryMap[category.id] =
          summary.copyWith(income: summary.income + entry.amount);
    }
  }

  final categorySummaries = categoryMap.values.toList()
    ..sort((a, b) => b.expense.compareTo(a.expense));

  return TransactionSummary(
    monthlySummary: MonthlySummary(
      income: income,
      expense: expense,
      balance: income - expense,
    ),
    dailyGroups: dailyGroups,
    categorySummaries: categorySummaries,
  );
});
