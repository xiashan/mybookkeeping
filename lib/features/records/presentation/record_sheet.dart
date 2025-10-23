import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/color_utils.dart';
import '../../accounts/models/account.dart';
import '../../accounts/providers/account_controller.dart';
import '../../categories/models/category.dart';
import '../../categories/presentation/category_manage_sheet.dart';
import '../../categories/providers/category_controller.dart';
import '../../transactions/models/transaction_entry.dart';
import '../../transactions/providers/transaction_controller.dart';

class RecordSheet extends ConsumerStatefulWidget {
  const RecordSheet({
    super.key,
    this.initialType = TransactionType.expense,
  });

  final TransactionType initialType;

  static Future<void> show(BuildContext context, WidgetRef ref) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const RecordSheet(),
      ),
    );
  }

  @override
  ConsumerState<RecordSheet> createState() => _RecordSheetState();
}

class _RecordSheetState extends ConsumerState<RecordSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _amountController;
  late final TextEditingController _noteController;
  late TransactionType _type;
  String? _selectedAccountId;
  String? _selectedCategoryId;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _noteController = TextEditingController();
    _type = widget.initialType;

    final accounts = ref.read(accountListProvider);
    final categories = ref.read(categoryListProvider)
        .where((category) => category.id != 'cat-income')
        .toList();
    if (accounts.isNotEmpty) {
      _selectedAccountId = accounts.first.id;
    }
    if (categories.isNotEmpty) {
      _selectedCategoryId = categories.first.id;
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Account> accounts = ref.watch(accountListProvider);
    final categories = ref
        .watch(categoryListProvider)
        .where(
          (category) => _type == TransactionType.income
              ? category.type == CategoryType.income
              : category.type == CategoryType.expense,
        )
        .toList();

    _selectedAccountId ??= accounts.isNotEmpty ? accounts.first.id : null;
    _selectedCategoryId ??= categories.isNotEmpty ? categories.first.id : null;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(0, 24, 0, 32),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, left: 24, right: 24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: _submit,
                      child: const Text('保存'),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '添加账单',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '日期：${_dateLabel(_selectedDate)}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _amountController,
                  autofocus: true,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(
                    fontSize: 20, 
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: const InputDecoration(
                    prefixText: '¥ ',
                    border: InputBorder.none,
                    hintText: '0.00',
                  ),
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(RegExp(r'^\\d*\\.?\\d{0,2}')),
                  // ],
                  validator: (value) {
                    final amount = double.tryParse(value ?? '');
                    if (amount == null || amount <= 0) {
                      return '请输入金额';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    ChoiceChip(
                      label: const Text('支出'),
                      selected: _type == TransactionType.expense,
                      onSelected: (value) {
                        if (value) {
                          setState(() {
                            _type = TransactionType.expense;
                          });
                        }
                      },
                    ),
                    const SizedBox(width: 8),
                    ChoiceChip(
                      label: const Text('收入'),
                      selected: _type == TransactionType.income,
                      onSelected: (value) {
                        if (value) {
                          setState(() {
                            _type = TransactionType.income;
                          });
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _noteController,
                  decoration: const InputDecoration(
                    labelText: '备注（可选）',
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 12),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('账户'),
                  subtitle: Text(accounts.isEmpty
                      ? '请先添加账户'
                      : accounts
                          .firstWhere(
                            (item) => item.id == _selectedAccountId,
                            orElse: () => accounts.first,
                          )
                          .name),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    final id = await _pickAccount(context, accounts);
                    if (id != null) {
                      setState(() => _selectedAccountId = id);
                    }
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('日期'),
                  subtitle: Text(_dateLabel(_selectedDate)),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () async {
                    final result = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (result != null) {
                      setState(() => _selectedDate = result);
                    }
                  },
                ),
                const SizedBox(height: 12),
                Text(
                  '分类',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                if (categories.isEmpty)
                  Column(
                    children: [
                      Text(
                        '暂无分类，请前往分类管理添加',
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 12),
                      TextButton.icon(
                        onPressed: _openCategoryManager,
                        icon: const Icon(Icons.tune),
                        label: const Text('管理分类'),
                      ),
                    ],
                  )
                else
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      for (final category in categories)
                        ChoiceChip(
                          label: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(category.icon.isEmpty ? '🔖' : category.icon),
                                const SizedBox(width: 6),
                                Text(category.name),
                              ],
                            ),
                          ),
                          selected: _selectedCategoryId == category.id,
                          selectedColor: hexToColor(
                            category.color.isEmpty
                                ? (_type == TransactionType.income
                                    ? '#E5ECFF'
                                    : '#EEE5FF')
                                : category.color,
                          ),
                          onSelected: (value) {
                            if (value) {
                              setState(() => _selectedCategoryId = category.id);
                            }
                          },
                        ),
                      ActionChip(
                        label: const Text('管理分类'),
                        avatar: const Icon(Icons.tune, size: 18),
                        onPressed: _openCategoryManager,
                      ),
                    ],
                  ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _submit,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        '确认',
                        style: const TextStyle(fontSize: 16),
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openCategoryManager() async {
    await CategoryManageSheet.show(
      context,
      ref,
      initialTab: _type == TransactionType.income
          ? CategoryType.income
          : CategoryType.expense,
    );
    final updated = ref
        .read(categoryListProvider)
        .where(
          (category) => _type == TransactionType.income
              ? category.type == CategoryType.income
              : category.type == CategoryType.expense,
        )
        .toList();
    setState(() {
      if (updated.isEmpty) {
        _selectedCategoryId = null;
      } else if (_selectedCategoryId == null ||
          !updated.any((item) => item.id == _selectedCategoryId)) {
        _selectedCategoryId = updated.first.id;
      }
    });
  }

  String _dateLabel(DateTime date) {
    return '${date.year}年${date.month.toString().padLeft(2, '0')}月${date.day.toString().padLeft(2, '0')}日';
  }

  Future<String?> _pickAccount(
      BuildContext context, List<Account> accounts) async {
    if (accounts.isEmpty) return null;
    return showModalBottomSheet<String>(
      context: context,
      builder: (_) {
        return ListView(
          shrinkWrap: true,
          children: [
            for (final account in accounts)
              ListTile(
                title: Text(account.name),
                onTap: () => Navigator.of(context).pop(account.id),
              ),
          ],
        );
      },
    );
  }

  void _submit() {
    if (_formKey.currentState?.validate() != true) {
      return;
    }
    if (_selectedAccountId == null || _selectedCategoryId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('请先选择账户和分类')),
      );
      return;
    }
    final amount = double.parse(_amountController.text);
    ref.read(transactionControllerProvider.notifier).createTransaction(
          type: _type,
          amount: amount,
          accountId: _selectedAccountId!,
          categoryId: _selectedCategoryId!,
          note: _noteController.text.trim(),
          occurredAt: _selectedDate,
        );
    Navigator.of(context).pop();
  }
}
