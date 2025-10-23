import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

/// 账户类型枚举，覆盖常见资产形态
@JsonEnum()
enum AccountType {
  cash,
  bankCard,
  creditCard,
  eWallet,
  custom,
}

extension AccountTypeExtension on AccountType {
  /// 账户类型中文名称，便于界面展示
  String get label {
    switch (this) {
      case AccountType.cash:
        return '现金';
      case AccountType.bankCard:
        return '银行卡';
      case AccountType.creditCard:
        return '信用卡';
      case AccountType.eWallet:
        return '电子钱包';
      case AccountType.custom:
        return '自定义';
    }
  }
}

/// 账户实体定义，遵循领域模型
@freezed
class Account with _$Account {
  const factory Account({
    required String id,
    required String name,
    required AccountType type,
    required double initialBalance,
    required double currentBalance,
    @Default(false) bool hidden,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Account;

  const Account._();

  /// 将账户余额重置为初始金额
  double get delta => currentBalance - initialBalance;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
}
