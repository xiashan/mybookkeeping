import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/color_utils.dart';
import '../models/category.dart';
import '../providers/category_controller.dart';

class CategoryManageSheet extends ConsumerStatefulWidget {
  const CategoryManageSheet({
    super.key,
    this.initialTab = CategoryType.expense,
  });

  final CategoryType initialTab;

  static Future<void> show(
    BuildContext context,
    WidgetRef ref, {
    CategoryType initialTab = CategoryType.expense,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: CategoryManageSheet(initialTab: initialTab),
      ),
    );
  }

  @override
  ConsumerState<CategoryManageSheet> createState() =>
      _CategoryManageSheetState();
}

class _CategoryManageSheetState extends ConsumerState<CategoryManageSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex:
          widget.initialTab == CategoryType.income ? 1 : 0,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoryListProvider);

    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                const Text(
                  '分类管理',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: const Color(0xFF7C4DFF),
            labelColor: const Color(0xFF7C4DFF),
            unselectedLabelColor: Colors.grey[600],
            tabs: const [
              Tab(text: '支出'),
              Tab(text: '收入'),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: TabBarView(
              controller: _tabController,
              children: [
                _CategoryList(
                  type: CategoryType.expense,
                  categories: categories,
                ),
                _CategoryList(
                  type: CategoryType.income,
                  categories: categories,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryList extends ConsumerWidget {
  const _CategoryList({
    required this.type,
    required this.categories,
  });

  final CategoryType type;
  final List<Category> categories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final filtered = categories
        .where((item) => item.type == type && !item.deleted)
        .toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));

    Future<void> addCategory() async {
      final formKey = GlobalKey<FormState>();
      final nameCtrl = TextEditingController();
      final iconCtrl = TextEditingController();
      final colorCtrl = TextEditingController(
        text: type == CategoryType.expense ? '#F5E1FF' : '#E5ECFF',
      );
      final result = await showDialog<bool>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('新增分类'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: '分类名称'),
                  validator: (value) =>
                      value == null || value.trim().isEmpty ? '请输入名称' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: iconCtrl,
                  decoration: const InputDecoration(
                    labelText: '图标（可选，可输入 Emoji）',
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: colorCtrl,
                  decoration: const InputDecoration(
                    labelText: '颜色（可选，支持 #RRGGBB）',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('取消'),
            ),
            FilledButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  Navigator.of(context).pop(true);
                }
              },
              child: const Text('保存'),
            ),
          ],
        ),
      );
      if (result == true) {
        ref.read(categoryControllerProvider.notifier).createCategory(
              name: nameCtrl.text.trim(),
              icon: iconCtrl.text.trim(),
              color: colorCtrl.text.trim(),
              type: type,
            );
      }
    }

    void removeCategory(Category category) {
      try {
        ref
            .read(categoryControllerProvider.notifier)
            .removeCategory(category.id);
      } on StateError catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message)),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        children: [
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Text(
                      '暂无${type == CategoryType.expense ? '支出' : '收入'}分类',
                      style: theme.textTheme.bodyMedium,
                    ),
                  )
                : ListView.separated(
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (_, index) {
                      final category = filtered[index];
                      return ListTile(
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: hexToColor(category.color),
                          child: Text(
                            category.icon.isEmpty
                                ? category.name.characters.first
                                : category.icon,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        title: Text(category.name),
                        trailing: category.builtIn
                            ? const Icon(Icons.lock_outline, size: 18)
                            : IconButton(
                                icon: const Icon(Icons.delete_outline),
                                onPressed: () => removeCategory(category),
                              ),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: addCategory,
              icon: const Icon(Icons.add),
              label: Text('新增${type == CategoryType.expense ? '支出' : '收入'}分类'),
            ),
          ),
        ],
      ),
    );
  }
}
