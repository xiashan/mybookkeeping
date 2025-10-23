import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_entry.freezed.dart';
part 'transaction_entry.g.dart';

/// 交易类型，覆盖支出、收入与转账
@JsonEnum()
enum TransactionType {
  expense,
  income,
  transfer,
}

/// 记录来源，用于区分录入渠道
@JsonEnum()
enum TransactionSource {
  manual,
  import,
  ocr,
  voice,
}

/// 交易实体
@freezed
class TransactionEntry with _$TransactionEntry {
  const factory TransactionEntry({
    required String id,
    required TransactionType type,
    required double amount,
    required String accountId,
    String? pairedAccountId,
    required String categoryId,
    @Default(<String>[]) List<String> tags,
    @Default('') String merchant,
    @Default('') String project,
    @Default('') String note,
    required DateTime occurredAt,
    @Default(<String>[]) List<String> attachments,
    @Default(TransactionSource.manual) TransactionSource source,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TransactionEntry;

  const TransactionEntry._();

  /// 将支出金额转换为负值，收入保持正值
  double get signedAmount {
    if (type == TransactionType.expense) {
      return -amount.abs();
    }
    return amount;
  }

  factory TransactionEntry.fromJson(Map<String, dynamic> json) =>
      _$TransactionEntryFromJson(json);
}
