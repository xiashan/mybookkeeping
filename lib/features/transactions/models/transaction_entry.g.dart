// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionEntryImpl _$$TransactionEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionEntryImpl(
      id: json['id'] as String,
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      amount: (json['amount'] as num).toDouble(),
      accountId: json['accountId'] as String,
      pairedAccountId: json['pairedAccountId'] as String?,
      categoryId: json['categoryId'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
      merchant: json['merchant'] as String? ?? '',
      project: json['project'] as String? ?? '',
      note: json['note'] as String? ?? '',
      occurredAt: DateTime.parse(json['occurredAt'] as String),
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      source: $enumDecodeNullable(_$TransactionSourceEnumMap, json['source']) ??
          TransactionSource.manual,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TransactionEntryImplToJson(
        _$TransactionEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'amount': instance.amount,
      'accountId': instance.accountId,
      'pairedAccountId': instance.pairedAccountId,
      'categoryId': instance.categoryId,
      'tags': instance.tags,
      'merchant': instance.merchant,
      'project': instance.project,
      'note': instance.note,
      'occurredAt': instance.occurredAt.toIso8601String(),
      'attachments': instance.attachments,
      'source': _$TransactionSourceEnumMap[instance.source]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$TransactionTypeEnumMap = {
  TransactionType.expense: 'expense',
  TransactionType.income: 'income',
  TransactionType.transfer: 'transfer',
};

const _$TransactionSourceEnumMap = {
  TransactionSource.manual: 'manual',
  TransactionSource.import: 'import',
  TransactionSource.ocr: 'ocr',
  TransactionSource.voice: 'voice',
};
