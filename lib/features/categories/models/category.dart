import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

/// 分类类型，区分收支
@JsonEnum()
enum CategoryType {
  expense,
  income,
}

/// 分类实体，支持软删除与排序
@freezed
class Category with _$Category {
  const factory Category({
    required String id,
    required String name,
    @Default('') String icon,
    @Default('') String color,
    @Default(CategoryType.expense) CategoryType type,
    @Default(false) bool builtIn,
    @Default(false) bool deleted,
    @Default(0) int order,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Category;

  const Category._();

  /// 提供常见分类标签供 UI 使用
  bool get isSystem => builtIn;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
