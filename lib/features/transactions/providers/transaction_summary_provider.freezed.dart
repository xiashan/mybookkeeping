// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_summary_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MonthlySummary {
  double get income => throw _privateConstructorUsedError;
  double get expense => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;

  /// Create a copy of MonthlySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlySummaryCopyWith<MonthlySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlySummaryCopyWith<$Res> {
  factory $MonthlySummaryCopyWith(
          MonthlySummary value, $Res Function(MonthlySummary) then) =
      _$MonthlySummaryCopyWithImpl<$Res, MonthlySummary>;
  @useResult
  $Res call({double income, double expense, double balance});
}

/// @nodoc
class _$MonthlySummaryCopyWithImpl<$Res, $Val extends MonthlySummary>
    implements $MonthlySummaryCopyWith<$Res> {
  _$MonthlySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? income = null,
    Object? expense = null,
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as double,
      expense: null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as double,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlySummaryImplCopyWith<$Res>
    implements $MonthlySummaryCopyWith<$Res> {
  factory _$$MonthlySummaryImplCopyWith(_$MonthlySummaryImpl value,
          $Res Function(_$MonthlySummaryImpl) then) =
      __$$MonthlySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double income, double expense, double balance});
}

/// @nodoc
class __$$MonthlySummaryImplCopyWithImpl<$Res>
    extends _$MonthlySummaryCopyWithImpl<$Res, _$MonthlySummaryImpl>
    implements _$$MonthlySummaryImplCopyWith<$Res> {
  __$$MonthlySummaryImplCopyWithImpl(
      _$MonthlySummaryImpl _value, $Res Function(_$MonthlySummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? income = null,
    Object? expense = null,
    Object? balance = null,
  }) {
    return _then(_$MonthlySummaryImpl(
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as double,
      expense: null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as double,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$MonthlySummaryImpl implements _MonthlySummary {
  const _$MonthlySummaryImpl(
      {this.income = 0, this.expense = 0, this.balance = 0});

  @override
  @JsonKey()
  final double income;
  @override
  @JsonKey()
  final double expense;
  @override
  @JsonKey()
  final double balance;

  @override
  String toString() {
    return 'MonthlySummary(income: $income, expense: $expense, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlySummaryImpl &&
            (identical(other.income, income) || other.income == income) &&
            (identical(other.expense, expense) || other.expense == expense) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, income, expense, balance);

  /// Create a copy of MonthlySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlySummaryImplCopyWith<_$MonthlySummaryImpl> get copyWith =>
      __$$MonthlySummaryImplCopyWithImpl<_$MonthlySummaryImpl>(
          this, _$identity);
}

abstract class _MonthlySummary implements MonthlySummary {
  const factory _MonthlySummary(
      {final double income,
      final double expense,
      final double balance}) = _$MonthlySummaryImpl;

  @override
  double get income;
  @override
  double get expense;
  @override
  double get balance;

  /// Create a copy of MonthlySummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlySummaryImplCopyWith<_$MonthlySummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DailyTransactions {
  DateTime get date => throw _privateConstructorUsedError;
  List<TransactionEntry> get entries => throw _privateConstructorUsedError;
  double get totalExpense => throw _privateConstructorUsedError;
  double get totalIncome => throw _privateConstructorUsedError;

  /// Create a copy of DailyTransactions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyTransactionsCopyWith<DailyTransactions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyTransactionsCopyWith<$Res> {
  factory $DailyTransactionsCopyWith(
          DailyTransactions value, $Res Function(DailyTransactions) then) =
      _$DailyTransactionsCopyWithImpl<$Res, DailyTransactions>;
  @useResult
  $Res call(
      {DateTime date,
      List<TransactionEntry> entries,
      double totalExpense,
      double totalIncome});
}

/// @nodoc
class _$DailyTransactionsCopyWithImpl<$Res, $Val extends DailyTransactions>
    implements $DailyTransactionsCopyWith<$Res> {
  _$DailyTransactionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyTransactions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? entries = null,
    Object? totalExpense = null,
    Object? totalIncome = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntry>,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyTransactionsImplCopyWith<$Res>
    implements $DailyTransactionsCopyWith<$Res> {
  factory _$$DailyTransactionsImplCopyWith(_$DailyTransactionsImpl value,
          $Res Function(_$DailyTransactionsImpl) then) =
      __$$DailyTransactionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      List<TransactionEntry> entries,
      double totalExpense,
      double totalIncome});
}

/// @nodoc
class __$$DailyTransactionsImplCopyWithImpl<$Res>
    extends _$DailyTransactionsCopyWithImpl<$Res, _$DailyTransactionsImpl>
    implements _$$DailyTransactionsImplCopyWith<$Res> {
  __$$DailyTransactionsImplCopyWithImpl(_$DailyTransactionsImpl _value,
      $Res Function(_$DailyTransactionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyTransactions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? entries = null,
    Object? totalExpense = null,
    Object? totalIncome = null,
  }) {
    return _then(_$DailyTransactionsImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntry>,
      totalExpense: null == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as double,
      totalIncome: null == totalIncome
          ? _value.totalIncome
          : totalIncome // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$DailyTransactionsImpl implements _DailyTransactions {
  const _$DailyTransactionsImpl(
      {required this.date,
      final List<TransactionEntry> entries = const <TransactionEntry>[],
      this.totalExpense = 0,
      this.totalIncome = 0})
      : _entries = entries;

  @override
  final DateTime date;
  final List<TransactionEntry> _entries;
  @override
  @JsonKey()
  List<TransactionEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  @JsonKey()
  final double totalExpense;
  @override
  @JsonKey()
  final double totalIncome;

  @override
  String toString() {
    return 'DailyTransactions(date: $date, entries: $entries, totalExpense: $totalExpense, totalIncome: $totalIncome)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyTransactionsImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.totalIncome, totalIncome) ||
                other.totalIncome == totalIncome));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date,
      const DeepCollectionEquality().hash(_entries), totalExpense, totalIncome);

  /// Create a copy of DailyTransactions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyTransactionsImplCopyWith<_$DailyTransactionsImpl> get copyWith =>
      __$$DailyTransactionsImplCopyWithImpl<_$DailyTransactionsImpl>(
          this, _$identity);
}

abstract class _DailyTransactions implements DailyTransactions {
  const factory _DailyTransactions(
      {required final DateTime date,
      final List<TransactionEntry> entries,
      final double totalExpense,
      final double totalIncome}) = _$DailyTransactionsImpl;

  @override
  DateTime get date;
  @override
  List<TransactionEntry> get entries;
  @override
  double get totalExpense;
  @override
  double get totalIncome;

  /// Create a copy of DailyTransactions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyTransactionsImplCopyWith<_$DailyTransactionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategorySummary {
  String get categoryId => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get colorHex => throw _privateConstructorUsedError;
  double get expense => throw _privateConstructorUsedError;
  double get income => throw _privateConstructorUsedError;

  /// Create a copy of CategorySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategorySummaryCopyWith<CategorySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySummaryCopyWith<$Res> {
  factory $CategorySummaryCopyWith(
          CategorySummary value, $Res Function(CategorySummary) then) =
      _$CategorySummaryCopyWithImpl<$Res, CategorySummary>;
  @useResult
  $Res call(
      {String categoryId,
      String categoryName,
      String icon,
      String colorHex,
      double expense,
      double income});
}

/// @nodoc
class _$CategorySummaryCopyWithImpl<$Res, $Val extends CategorySummary>
    implements $CategorySummaryCopyWith<$Res> {
  _$CategorySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategorySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? icon = null,
    Object? colorHex = null,
    Object? expense = null,
    Object? income = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      colorHex: null == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String,
      expense: null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as double,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategorySummaryImplCopyWith<$Res>
    implements $CategorySummaryCopyWith<$Res> {
  factory _$$CategorySummaryImplCopyWith(_$CategorySummaryImpl value,
          $Res Function(_$CategorySummaryImpl) then) =
      __$$CategorySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String categoryId,
      String categoryName,
      String icon,
      String colorHex,
      double expense,
      double income});
}

/// @nodoc
class __$$CategorySummaryImplCopyWithImpl<$Res>
    extends _$CategorySummaryCopyWithImpl<$Res, _$CategorySummaryImpl>
    implements _$$CategorySummaryImplCopyWith<$Res> {
  __$$CategorySummaryImplCopyWithImpl(
      _$CategorySummaryImpl _value, $Res Function(_$CategorySummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategorySummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? categoryName = null,
    Object? icon = null,
    Object? colorHex = null,
    Object? expense = null,
    Object? income = null,
  }) {
    return _then(_$CategorySummaryImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      colorHex: null == colorHex
          ? _value.colorHex
          : colorHex // ignore: cast_nullable_to_non_nullable
              as String,
      expense: null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as double,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CategorySummaryImpl implements _CategorySummary {
  const _$CategorySummaryImpl(
      {required this.categoryId,
      required this.categoryName,
      this.icon = '',
      this.colorHex = '',
      this.expense = 0,
      this.income = 0});

  @override
  final String categoryId;
  @override
  final String categoryName;
  @override
  @JsonKey()
  final String icon;
  @override
  @JsonKey()
  final String colorHex;
  @override
  @JsonKey()
  final double expense;
  @override
  @JsonKey()
  final double income;

  @override
  String toString() {
    return 'CategorySummary(categoryId: $categoryId, categoryName: $categoryName, icon: $icon, colorHex: $colorHex, expense: $expense, income: $income)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategorySummaryImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex) &&
            (identical(other.expense, expense) || other.expense == expense) &&
            (identical(other.income, income) || other.income == income));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, categoryName, icon, colorHex, expense, income);

  /// Create a copy of CategorySummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategorySummaryImplCopyWith<_$CategorySummaryImpl> get copyWith =>
      __$$CategorySummaryImplCopyWithImpl<_$CategorySummaryImpl>(
          this, _$identity);
}

abstract class _CategorySummary implements CategorySummary {
  const factory _CategorySummary(
      {required final String categoryId,
      required final String categoryName,
      final String icon,
      final String colorHex,
      final double expense,
      final double income}) = _$CategorySummaryImpl;

  @override
  String get categoryId;
  @override
  String get categoryName;
  @override
  String get icon;
  @override
  String get colorHex;
  @override
  double get expense;
  @override
  double get income;

  /// Create a copy of CategorySummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategorySummaryImplCopyWith<_$CategorySummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionSummary {
  MonthlySummary get monthlySummary => throw _privateConstructorUsedError;
  List<DailyTransactions> get dailyGroups => throw _privateConstructorUsedError;
  List<CategorySummary> get categorySummaries =>
      throw _privateConstructorUsedError;

  /// Create a copy of TransactionSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionSummaryCopyWith<TransactionSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSummaryCopyWith<$Res> {
  factory $TransactionSummaryCopyWith(
          TransactionSummary value, $Res Function(TransactionSummary) then) =
      _$TransactionSummaryCopyWithImpl<$Res, TransactionSummary>;
  @useResult
  $Res call(
      {MonthlySummary monthlySummary,
      List<DailyTransactions> dailyGroups,
      List<CategorySummary> categorySummaries});

  $MonthlySummaryCopyWith<$Res> get monthlySummary;
}

/// @nodoc
class _$TransactionSummaryCopyWithImpl<$Res, $Val extends TransactionSummary>
    implements $TransactionSummaryCopyWith<$Res> {
  _$TransactionSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthlySummary = null,
    Object? dailyGroups = null,
    Object? categorySummaries = null,
  }) {
    return _then(_value.copyWith(
      monthlySummary: null == monthlySummary
          ? _value.monthlySummary
          : monthlySummary // ignore: cast_nullable_to_non_nullable
              as MonthlySummary,
      dailyGroups: null == dailyGroups
          ? _value.dailyGroups
          : dailyGroups // ignore: cast_nullable_to_non_nullable
              as List<DailyTransactions>,
      categorySummaries: null == categorySummaries
          ? _value.categorySummaries
          : categorySummaries // ignore: cast_nullable_to_non_nullable
              as List<CategorySummary>,
    ) as $Val);
  }

  /// Create a copy of TransactionSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MonthlySummaryCopyWith<$Res> get monthlySummary {
    return $MonthlySummaryCopyWith<$Res>(_value.monthlySummary, (value) {
      return _then(_value.copyWith(monthlySummary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionSummaryImplCopyWith<$Res>
    implements $TransactionSummaryCopyWith<$Res> {
  factory _$$TransactionSummaryImplCopyWith(_$TransactionSummaryImpl value,
          $Res Function(_$TransactionSummaryImpl) then) =
      __$$TransactionSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MonthlySummary monthlySummary,
      List<DailyTransactions> dailyGroups,
      List<CategorySummary> categorySummaries});

  @override
  $MonthlySummaryCopyWith<$Res> get monthlySummary;
}

/// @nodoc
class __$$TransactionSummaryImplCopyWithImpl<$Res>
    extends _$TransactionSummaryCopyWithImpl<$Res, _$TransactionSummaryImpl>
    implements _$$TransactionSummaryImplCopyWith<$Res> {
  __$$TransactionSummaryImplCopyWithImpl(_$TransactionSummaryImpl _value,
      $Res Function(_$TransactionSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthlySummary = null,
    Object? dailyGroups = null,
    Object? categorySummaries = null,
  }) {
    return _then(_$TransactionSummaryImpl(
      monthlySummary: null == monthlySummary
          ? _value.monthlySummary
          : monthlySummary // ignore: cast_nullable_to_non_nullable
              as MonthlySummary,
      dailyGroups: null == dailyGroups
          ? _value._dailyGroups
          : dailyGroups // ignore: cast_nullable_to_non_nullable
              as List<DailyTransactions>,
      categorySummaries: null == categorySummaries
          ? _value._categorySummaries
          : categorySummaries // ignore: cast_nullable_to_non_nullable
              as List<CategorySummary>,
    ));
  }
}

/// @nodoc

class _$TransactionSummaryImpl implements _TransactionSummary {
  const _$TransactionSummaryImpl(
      {this.monthlySummary = const MonthlySummary(),
      final List<DailyTransactions> dailyGroups = const <DailyTransactions>[],
      final List<CategorySummary> categorySummaries =
          const <CategorySummary>[]})
      : _dailyGroups = dailyGroups,
        _categorySummaries = categorySummaries;

  @override
  @JsonKey()
  final MonthlySummary monthlySummary;
  final List<DailyTransactions> _dailyGroups;
  @override
  @JsonKey()
  List<DailyTransactions> get dailyGroups {
    if (_dailyGroups is EqualUnmodifiableListView) return _dailyGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyGroups);
  }

  final List<CategorySummary> _categorySummaries;
  @override
  @JsonKey()
  List<CategorySummary> get categorySummaries {
    if (_categorySummaries is EqualUnmodifiableListView)
      return _categorySummaries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categorySummaries);
  }

  @override
  String toString() {
    return 'TransactionSummary(monthlySummary: $monthlySummary, dailyGroups: $dailyGroups, categorySummaries: $categorySummaries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionSummaryImpl &&
            (identical(other.monthlySummary, monthlySummary) ||
                other.monthlySummary == monthlySummary) &&
            const DeepCollectionEquality()
                .equals(other._dailyGroups, _dailyGroups) &&
            const DeepCollectionEquality()
                .equals(other._categorySummaries, _categorySummaries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      monthlySummary,
      const DeepCollectionEquality().hash(_dailyGroups),
      const DeepCollectionEquality().hash(_categorySummaries));

  /// Create a copy of TransactionSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionSummaryImplCopyWith<_$TransactionSummaryImpl> get copyWith =>
      __$$TransactionSummaryImplCopyWithImpl<_$TransactionSummaryImpl>(
          this, _$identity);
}

abstract class _TransactionSummary implements TransactionSummary {
  const factory _TransactionSummary(
          {final MonthlySummary monthlySummary,
          final List<DailyTransactions> dailyGroups,
          final List<CategorySummary> categorySummaries}) =
      _$TransactionSummaryImpl;

  @override
  MonthlySummary get monthlySummary;
  @override
  List<DailyTransactions> get dailyGroups;
  @override
  List<CategorySummary> get categorySummaries;

  /// Create a copy of TransactionSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionSummaryImplCopyWith<_$TransactionSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
