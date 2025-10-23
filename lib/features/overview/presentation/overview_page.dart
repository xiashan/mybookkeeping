import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/color_utils.dart';
import '../../../core/widgets/month_picker_dialog.dart';
import '../../accounts/providers/account_controller.dart';
import '../../categories/models/category.dart';
import '../../categories/providers/category_controller.dart';
import '../../transactions/models/transaction_entry.dart';
import '../../transactions/providers/transaction_summary_provider.dart';

class OverviewPage extends ConsumerWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(transactionSummaryProvider);
    final selectedMonth = ref.watch(selectedMonthProvider);
    final accounts = ref.watch(accountListProvider);
    final categories = ref.watch(categoryListProvider);
    final theme = Theme.of(context);

    Future<void> _pickMonth() async {
      final picked = await showMonthPickerDialog(
        context: context,
        initialDate: selectedMonth,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (picked != null) {
        ref.read(selectedMonthProvider.notifier).state =
            DateTime(picked.year, picked.month);
      }
    }

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _OverviewHeader(
              monthlySummary: summary.monthlySummary,
              accountCount: accounts.length,
              selectedMonth: selectedMonth,
              onSelectMonth: _pickMonth,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            sliver: SliverToBoxAdapter(
              child: Transform.translate(
                offset: const Offset(0, 0),
                child: _QuickActionSection(),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
            sliver: SliverToBoxAdapter(
              child: summary.dailyGroups.isEmpty
                  ? const _EmptyLedgerPlaceholder()
                  : Column(
                      children: summary.dailyGroups
                          .map(
                            (group) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: _DailyCard(
                                group: group,
                                categories: categories,
                              ),
                            ),
                          )
                          .toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OverviewHeader extends StatelessWidget {
  const _OverviewHeader({
    required this.monthlySummary,
    required this.accountCount,
    required this.selectedMonth,
    required this.onSelectMonth,
  });

  final MonthlySummary monthlySummary;
  final int accountCount;
  final DateTime selectedMonth;
  final Future<void> Function() onSelectMonth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final yearLabel = '${selectedMonth.year}年';
    final monthLabel = '${selectedMonth.month.toString().padLeft(2, '0')}月';

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF7C4DFF),
            Color(0xFF8E9BFF),
          ],
        ),
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(32),
        //   bottomRight: Radius.circular(32),
        // ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '西瓜记账',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings_outlined, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: onSelectMonth,
                // borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        yearLabel,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(children: [
                        Text(
                          monthLabel,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // const SizedBox(width: 4),
                        const Icon(
                          Icons.expand_more,
                          color: Colors.white,
                          size: 18,
                        ),
                      ])
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: _HeaderMetric(
                  label: '收入',
                  value: monthlySummary.income,
                  stateColor: Colors.white,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _HeaderMetric(
                  label: '支出',
                  value: monthlySummary.expense,
                  stateColor: Colors.white,
                ),
              ),
            ],
          ),
          // const SizedBox(height: 16),
          // Text(
          //   '已关联 $accountCount 个账户',
          //   style: theme.textTheme.bodySmall?.copyWith(
          //     color: Colors.white.withOpacity(0.7),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _HeaderMetric extends StatelessWidget {
  const _HeaderMetric({
    required this.label,
    required this.value,
    required this.stateColor,
  });

  final String label;
  final double value;
  final Color stateColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      // decoration: BoxDecoration(
      //   color: Colors.white.withOpacity(0.15),
      //   borderRadius: BorderRadius.circular(16),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: stateColor.withOpacity(0.8),
                ),
          ),
          const SizedBox(height: 8),
          Text(
            '¥${value.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: stateColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionSection extends StatelessWidget {
  _QuickActionSection();

  final _actions = [
    _QuickActionData(
      icon: Icons.receipt_long_rounded,
      label: '账单',
      background: const Color(0xFFFFF1E6),
      iconColor: const Color(0xFFFF8A3D),
    ),
    _QuickActionData(
      icon: Icons.bar_chart_rounded,
      label: '预算',
      background: const Color(0xFFEAF3FF),
      iconColor: const Color(0xFF5D8CFF),
    ),
    _QuickActionData(
      icon: Icons.security_rounded,
      label: '资产管家',
      background: const Color(0xFFE8F6EF),
      iconColor: const Color(0xFF00A86B),
    ),
    _QuickActionData(
      icon: Icons.shopping_bag_outlined,
      label: '购物返现',
      background: const Color(0xFFFFFBE6),
      iconColor: const Color(0xFFFFC940),
    ),
    _QuickActionData(
      icon: Icons.more_horiz,
      label: '更多',
      background: const Color(0xFFF3F4F6),
      iconColor: const Color(0xFF6B7280),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _actions
            .map(
              (action) => Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: action.background,
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Icon(
                        action.icon,
                        color: action.iconColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      action.label,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _QuickActionData {
  const _QuickActionData({
    required this.icon,
    required this.label,
    required this.background,
    required this.iconColor,
  });

  final IconData icon;
  final String label;
  final Color background;
  final Color iconColor;
}

class _DailyCard extends ConsumerWidget {
  const _DailyCard({
    required this.group,
    required this.categories,
  });

  final DailyTransactions group;
  final List<Category> categories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final date = group.date;
    final weekdayNames = ['一', '二', '三', '四', '五', '六', '日'];
    final title =
        '${date.month.toString().padLeft(2, '0')}月${date.day.toString().padLeft(2, '0')}日 星期${weekdayNames[date.weekday - 1]}';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              if (group.totalExpense > 0)
                Text(
                  '支出：${group.totalExpense.toStringAsFixed(0)}',
                  style: theme.textTheme.bodyMedium,
                ),
            ],
          ),
          const SizedBox(height: 12),
          ...group.entries.map(
            (entry) {
              final category = categories.firstWhere(
                (item) => item.id == entry.categoryId,
                orElse: () => Category(
                  id: entry.categoryId,
                  name: entry.type == TransactionType.income ? '收入' : '未分类',
                  icon: '💡',
                  color: '#ECECEC',
                  createdAt: entry.createdAt,
                  updatedAt: entry.updatedAt,
                ),
              );
              final amountText = entry.type == TransactionType.expense
                  ? '-${entry.amount.toStringAsFixed(0)}'
                  : '+${entry.amount.toStringAsFixed(0)}';
              final amountColor = entry.type == TransactionType.expense
                  ? Colors.redAccent
                  : const Color(0xFF00A86B);
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: hexToColor(category.color),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        category.icon.isEmpty ? '🔖' : category.icon,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entry.note.isNotEmpty
                                ? entry.note
                                : category.name,
                            style: theme.textTheme.titleMedium,
                          ),
                          if (entry.note.isNotEmpty)
                            Text(
                              category.name,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                        ],
                      ),
                    ),
                    Text(
                      amountText,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: amountColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _EmptyLedgerPlaceholder extends StatelessWidget {
  const _EmptyLedgerPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.symmetric(vertical: 48),
      alignment: Alignment.center,
      child: Column(
        children: [
          const Icon(Icons.inbox_outlined, size: 52, color: Colors.grey),
          const SizedBox(height: 12),
          Text(
            '本月还没有任何记账记录',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
