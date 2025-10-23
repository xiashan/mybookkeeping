import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../accounts/providers/account_controller.dart';
import '../models/transaction_entry.dart';

final _uuid = const Uuid();

/// 交易列表 Provider
final transactionControllerProvider =
    StateNotifierProvider<TransactionController, List<TransactionEntry>>(
  TransactionController.new,
);

/// 交易控制器，负责同步账户余额
class TransactionController extends StateNotifier<List<TransactionEntry>> {
  TransactionController(this._ref) : super(_seedTransactions);

  final Ref _ref;

  static List<TransactionEntry> get _seedTransactions {
    final now = DateTime.now();
    DateTime daysAgo(int day) => DateTime(now.year, now.month, now.day - day);

    TransactionEntry build({
      required String id,
      required TransactionType type,
      required double amount,
      required String accountId,
      String? categoryId,
      String note = '',
      int daysBefore = 0,
    }) {
      final occurred = daysAgo(daysBefore);
      return TransactionEntry(
        id: id,
        type: type,
        amount: amount,
        accountId: accountId,
        categoryId: categoryId ?? 'cat-food',
        note: note,
        occurredAt: occurred,
        source: TransactionSource.manual,
        createdAt: occurred,
        updatedAt: occurred,
      );
    }

    return [
      build(
        id: 'txn-lunch',
        type: TransactionType.expense,
        amount: 20,
        accountId: 'acct-cash',
        categoryId: 'cat-food',
        note: '午餐',
        daysBefore: 1,
      ),
      build(
        id: 'txn-vegetable',
        type: TransactionType.expense,
        amount: 10,
        accountId: 'acct-cash',
        categoryId: 'cat-health',
        note: '蔬菜',
        daysBefore: 1,
      ),
      build(
        id: 'txn-traffic',
        type: TransactionType.expense,
        amount: 100,
        accountId: 'acct-bank',
        categoryId: 'cat-traffic',
        note: '交通',
        daysBefore: 2,
      ),
      build(
        id: 'txn-salary',
        type: TransactionType.income,
        amount: 5000,
        accountId: 'acct-bank',
        categoryId: 'cat-income',
        note: '工资',
        daysBefore: 5,
      ),
    ];
  }

  /// 新增交易记录
  void createTransaction({
    required TransactionType type,
    required double amount,
    required String accountId,
    String? pairedAccountId,
    required String categoryId,
    List<String> tags = const [],
    String merchant = '',
    String project = '',
    String note = '',
    DateTime? occurredAt,
    TransactionSource source = TransactionSource.manual,
  }) {
    final now = DateTime.now();
    final entry = TransactionEntry(
      id: _uuid.v4(),
      type: type,
      amount: amount,
      accountId: accountId,
      pairedAccountId: pairedAccountId,
      categoryId: categoryId,
      tags: tags,
      merchant: merchant,
      project: project,
      note: note,
      occurredAt: occurredAt ?? now,
      source: source,
      createdAt: now,
      updatedAt: now,
    );
    state = [...state, entry];
    _syncAccountBalances(entry);
  }

  /// 删除交易并回滚余额
  void removeTransaction(String id) {
    final entry =
        state.firstWhere((item) => item.id == id, orElse: () => throw StateError('未找到对应交易'));
    state = state.where((item) => item.id != id).toList();
    _rollbackAccountBalances(entry);
  }

  void _syncAccountBalances(TransactionEntry entry) {
    final accountController =
        _ref.read(accountControllerProvider.notifier);
    switch (entry.type) {
      case TransactionType.expense:
        accountController.adjustBalance(entry.accountId, -entry.amount);
        break;
      case TransactionType.income:
        accountController.adjustBalance(entry.accountId, entry.amount);
        break;
      case TransactionType.transfer:
        if (entry.pairedAccountId == null) {
          return;
        }
        accountController.adjustBalance(entry.accountId, -entry.amount);
        accountController.adjustBalance(entry.pairedAccountId!, entry.amount);
        break;
    }
  }

  void _rollbackAccountBalances(TransactionEntry entry) {
    final accountController =
        _ref.read(accountControllerProvider.notifier);
    switch (entry.type) {
      case TransactionType.expense:
        accountController.adjustBalance(entry.accountId, entry.amount);
        break;
      case TransactionType.income:
        accountController.adjustBalance(entry.accountId, -entry.amount);
        break;
      case TransactionType.transfer:
        if (entry.pairedAccountId == null) {
          return;
        }
        accountController.adjustBalance(entry.accountId, entry.amount);
        accountController.adjustBalance(entry.pairedAccountId!, -entry.amount);
        break;
    }
  }
}
