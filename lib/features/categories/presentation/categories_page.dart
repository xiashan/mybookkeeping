import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/category.dart';
import '../providers/category_controller.dart';

/// 分类管理页面
class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key});

  static Future<void> presentCreateDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    await showDialog<void>(
      context: context,
      builder: (_) => _CategoryDialog(ref: ref),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryListProvider);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '分类（共 ${categories.length} 项）',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: categories.isEmpty
                ? const _EmptyPlaceholder()
                : ListView.separated(
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return _CategoryTile(category: category);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _CategoryTile extends ConsumerWidget {
  const _CategoryTile({required this.category});

  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(category.id),
      direction:
          category.builtIn ? DismissDirection.none : DismissDirection.endToStart,
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Icon(
          category.builtIn ? Icons.lock_outline : Icons.delete_outline,
          color: Colors.redAccent,
        ),
      ),
      confirmDismiss: (_) async {
        if (category.builtIn) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('内置分类不可删除')),
          );
          return false;
        }
        return true;
      },
      onDismissed: (_) {
        try {
          ref
              .read(categoryControllerProvider.notifier)
              .removeCategory(category.id);
        } on StateError catch (error) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(error.message)));
        }
      },
      child: Card(
        child: ListTile(
          leading: Text(
            category.icon.isEmpty ? '📁' : category.icon,
            style: const TextStyle(fontSize: 24),
          ),
          title: Text(category.name),
          subtitle: Text(
            category.builtIn
                ? '内置分类'
                : category.type == CategoryType.expense
                    ? '支出'
                    : '收入',
          ),
        ),
      ),
    );
  }
}

class _CategoryDialog extends ConsumerStatefulWidget {
  const _CategoryDialog({required this.ref});

  final WidgetRef ref;

  @override
  ConsumerState<_CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends ConsumerState<_CategoryDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _iconController;
  CategoryType _selectedType = CategoryType.expense;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _iconController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('新增分类'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: '分类名称'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '请输入名称';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _iconController,
              decoration: const InputDecoration(
                labelText: '图标（可选，建议输入 Emoji）',
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
              ],
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<CategoryType>(
              value: _selectedType,
              decoration: const InputDecoration(labelText: '分类类型'),
              items: const [
                DropdownMenuItem(
                  value: CategoryType.expense,
                  child: Text('支出'),
                ),
                DropdownMenuItem(
                  value: CategoryType.income,
                  child: Text('收入'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedType = value;
                  });
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed: () {
            if (_formKey.currentState?.validate() != true) {
              return;
            }
            widget.ref.read(categoryControllerProvider.notifier).createCategory(
                  name: _nameController.text.trim(),
                  icon: _iconController.text.trim(),
                  type: _selectedType,
                );
            Navigator.of(context).pop();
          },
          child: const Text('保存'),
        ),
      ],
    );
  }
}

class _EmptyPlaceholder extends StatelessWidget {
  const _EmptyPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.category_outlined, size: 56),
          const SizedBox(height: 12),
          Text(
            '暂无分类，点击右下角按钮新增',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
