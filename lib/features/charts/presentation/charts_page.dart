import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/color_utils.dart';
import '../../../core/widgets/month_picker_dialog.dart';
import '../../transactions/providers/transaction_summary_provider.dart';

class ChartsPage extends ConsumerStatefulWidget {
  const ChartsPage({super.key});

  @override
  ConsumerState<ChartsPage> createState() => _ChartsPageState();
}

class _ChartsPageState extends ConsumerState<ChartsPage> {
  bool showExpense = true;

  @override
  Widget build(BuildContext context) {
    final summary = ref.watch(transactionSummaryProvider);
    final selectedMonth = ref.watch(selectedMonthProvider);
    final theme = Theme.of(context);
    final data = summary.categorySummaries.where((item) {
      if (showExpense) {
        return item.expense > 0;
      }
      return item.income > 0;
    }).toList();

    final total = showExpense
        ? data.fold<double>(0, (prev, e) => prev + e.expense)
        : data.fold<double>(0, (prev, e) => prev + e.income);

    return Scaffold(
      appBar: AppBar(
        title: const Text('图表'),
        backgroundColor: const Color(0xFF7C4DFF),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          ),
          IconButton(
            onPressed: () async {
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
            },
            icon: const Icon(Icons.calendar_today_outlined),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFF5F6FB),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${selectedMonth.year}年${selectedMonth.month.toString().padLeft(2, '0')}月',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          showExpense ? '支出' : '收入',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SegmentedButton<bool>(
                          style: ButtonStyle(
                            visualDensity: VisualDensity.comfortable,
                          ),
                          segments: const [
                            ButtonSegment(value: true, label: Text('支出')),
                            ButtonSegment(value: false, label: Text('收入')),
                          ],
                          selected: {showExpense},
                          onSelectionChanged: (value) {
                            setState(() {
                              showExpense = value.first;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    if (data.isEmpty)
                      SizedBox(
                        height: 220,
                        child: Center(
                          child: Text(
                            '暂无数据',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      )
                    else
                      SizedBox(
                        height: 220,
                        child: PieChart(
                          PieChartData(
                            sectionsSpace: 6,
                            centerSpaceRadius: 40,
                            sections: data
                                .map(
                                  (item) => PieChartSectionData(
                                    value: showExpense
                                        ? item.expense
                                        : item.income,
                                    title: '',
                                    color: _colorFromHex(item.colorHex),
                                    radius: 80,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    const SizedBox(height: 24),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            showExpense ? '总支出' : '总收入',
                            style: theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '¥${total.toStringAsFixed(2)}',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                showExpense ? '支出分类排行' : '收入分类排行',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ...data.asMap().entries.map(
                (entry) {
                  final index = entry.key + 1;
                  final item = entry.value;
                  final amount = showExpense ? item.expense : item.income;
                  final ratio =
                      total == 0 ? 0 : (amount / total * 100).toStringAsFixed(1);
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor: _colorFromHex(item.colorHex),
                          child: Text(
                            item.icon.isEmpty ? '$index' : item.icon,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.categoryName,
                                style: theme.textTheme.titleMedium,
                              ),
                              Text(
                                '$ratio%',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '¥${amount.toStringAsFixed(2)}',
                          style: theme.textTheme.titleMedium?.copyWith(
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
        ),
      ),
    );
  }

  Color _colorFromHex(String hex) {
    if (hex.isEmpty) return const Color(0xFFE0E0E0);
    return hexToColor(hex);
  }
}
