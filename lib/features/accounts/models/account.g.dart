// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$AccountTypeEnumMap, json['type']),
      initialBalance: (json['initialBalance'] as num).toDouble(),
      currentBalance: (json['currentBalance'] as num).toDouble(),
      hidden: json['hidden'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$AccountTypeEnumMap[instance.type]!,
      'initialBalance': instance.initialBalance,
      'currentBalance': instance.currentBalance,
      'hidden': instance.hidden,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$AccountTypeEnumMap = {
  AccountType.cash: 'cash',
  AccountType.bankCard: 'bankCard',
  AccountType.creditCard: 'creditCard',
  AccountType.eWallet: 'eWallet',
  AccountType.custom: 'custom',
};
