import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/account.dart';

final _uuid = const Uuid();

/// 账户列表只读 Provider
final accountListProvider = Provider<List<Account>>(
  (ref) => ref.watch(accountControllerProvider),
);

/// 账户状态管理器 Provider
final accountControllerProvider =
    StateNotifierProvider<AccountController, List<Account>>(
  (ref) => AccountController(),
);

/// 账户状态管理器，负责增删改以及余额同步
class AccountController extends StateNotifier<List<Account>> {
  AccountController() : super(_seedAccounts);

  static List<Account> get _seedAccounts {
    final now = DateTime.now();
    return [
      Account(
        id: 'acct-cash',
        name: '现金钱包',
        type: AccountType.cash,
        initialBalance: 200.0,
        currentBalance: 170.0,
        createdAt: now,
        updatedAt: now,
      ),
      Account(
        id: 'acct-bank',
        name: '工资卡',
        type: AccountType.bankCard,
        initialBalance: 5200.0,
        currentBalance: 10100.0,
        createdAt: now,
        updatedAt: now,
      ),
    ];
  }

  /// 新增账户
  void createAccount({
    required String name,
    required AccountType type,
    required double initialBalance,
  }) {
    final now = DateTime.now();
    final account = Account(
      id: _uuid.v4(),
      name: name,
      type: type,
      initialBalance: initialBalance,
      currentBalance: initialBalance,
      createdAt: now,
      updatedAt: now,
    );
    state = [...state, account];
  }

  /// 更新账户基本信息
  void updateAccount(Account target) {
    state = [
      for (final account in state)
        if (account.id == target.id)
          target.copyWith(updatedAt: DateTime.now())
        else
          account,
    ];
  }

  /// 删除账户
  void removeAccount(String id) {
    state = state.where((item) => item.id != id).toList();
  }

  /// 根据交易变动余额
  void adjustBalance(String id, double delta) {
    state = [
      for (final account in state)
        if (account.id == id)
          account.copyWith(
            currentBalance: account.currentBalance + delta,
            updatedAt: DateTime.now(),
          )
        else
          account,
    ];
  }
}
