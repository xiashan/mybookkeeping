import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/category.dart';

final _uuid = const Uuid();

/// 分类状态 Provider
final categoryControllerProvider =
    StateNotifierProvider<CategoryController, List<Category>>(
  (ref) => CategoryController(),
);

/// 分类列表只读 Provider
final categoryListProvider = Provider<List<Category>>(
  (ref) => ref.watch(categoryControllerProvider),
);

/// 分类管理器
class CategoryController extends StateNotifier<List<Category>> {
  CategoryController() : super(_seedCategories);

  static List<Category> get _seedCategories {
    final now = DateTime.now();
    return [
      Category(
        id: 'cat-food',
        name: '餐饮',
        icon: '🍽️',
        color: '#F5E1FF',
        type: CategoryType.expense,
        builtIn: true,
        createdAt: now,
        updatedAt: now,
      ),
      Category(
        id: 'cat-traffic',
        name: '交通',
        icon: '🚌',
        color: '#D7F5FF',
        type: CategoryType.expense,
        builtIn: true,
        createdAt: now,
        updatedAt: now,
      ),
      Category(
        id: 'cat-shopping',
        name: '购物',
        icon: '🛍️',
        color: '#FFF4D6',
        type: CategoryType.expense,
        builtIn: true,
        createdAt: now,
        updatedAt: now,
      ),
      Category(
        id: 'cat-health',
        name: '健康',
        icon: '🩺',
        color: '#E3FFE2',
        type: CategoryType.expense,
        builtIn: true,
        createdAt: now,
        updatedAt: now,
      ),
      Category(
        id: 'cat-income',
        name: '收入',
        icon: '💰',
        color: '#E5ECFF',
        type: CategoryType.income,
        builtIn: true,
        createdAt: now,
        updatedAt: now,
      ),
    ];
  }

  void createCategory({
    required String name,
    CategoryType type = CategoryType.expense,
    String icon = '',
    String color = '',
  }) {
    final now = DateTime.now();
    state = [
      ...state,
      Category(
        id: _uuid.v4(),
        name: name,
        icon: icon,
        color: color,
        type: type,
        createdAt: now,
        updatedAt: now,
      ),
    ];
  }

  void removeCategory(String id) {
    final target = state.firstWhere((item) => item.id == id);
    if (target.builtIn) {
      throw StateError('内置分类不可删除');
    }
    state = state.where((item) => item.id != id).toList();
  }
}
