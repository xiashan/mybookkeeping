import 'package:flutter/material.dart';

/// 显示年月选择对话框，仅返回年/月，日固定为 1 日
Future<DateTime?> showMonthPickerDialog({
  required BuildContext context,
  required DateTime initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
  String title = '选择年月',
}) {
  final now = DateTime.now();
  final minDate = firstDate ?? DateTime(2000);
  final maxDate = lastDate ?? DateTime(now.year + 20);
  DateTime selectedDate = DateTime(initialDate.year, initialDate.month);

  return showDialog<DateTime>(
    context: context,
    builder: (context) {
      int tempYear = selectedDate.year;
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text(title),
            content: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 200,
                    child: YearPicker(
                      firstDate: minDate,
                      lastDate: maxDate,
                      selectedDate: DateTime(tempYear),
                      currentDate: DateTime(now.year),
                      onChanged: (date) {
                        setState(() {
                          tempYear = date.year;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: List.generate(12, (index) {
                      final month = index + 1;
                      final candidate = DateTime(tempYear, month);
                      final isDisabled =
                          candidate.isBefore(DateTime(minDate.year, minDate.month)) ||
                              candidate.isAfter(DateTime(maxDate.year, maxDate.month));
                      final isSelected = candidate.year == selectedDate.year &&
                          candidate.month == selectedDate.month;
                      return ChoiceChip(
                        label: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text('$month月'),
                        ),
                        selected: isSelected,
                        onSelected: isDisabled
                            ? null
                            : (_) {
                                selectedDate = candidate;
                                Navigator.of(context).pop(selectedDate);
                              },
                      );
                    }),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('取消'),
              ),
            ],
          );
        },
      );
    },
  );
}
