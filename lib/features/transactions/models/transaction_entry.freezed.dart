// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionEntry _$TransactionEntryFromJson(Map<String, dynamic> json) {
  return _TransactionEntry.fromJson(json);
}

/// @nodoc
mixin _$TransactionEntry {
  String get id => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get accountId => throw _privateConstructorUsedError;
  String? get pairedAccountId => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get merchant => throw _privateConstructorUsedError;
  String get project => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  DateTime get occurredAt => throw _privateConstructorUsedError;
  List<String> get attachments => throw _privateConstructorUsedError;
  TransactionSource get source => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TransactionEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionEntryCopyWith<TransactionEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionEntryCopyWith<$Res> {
  factory $TransactionEntryCopyWith(
          TransactionEntry value, $Res Function(TransactionEntry) then) =
      _$TransactionEntryCopyWithImpl<$Res, TransactionEntry>;
  @useResult
  $Res call(
      {String id,
      TransactionType type,
      double amount,
      String accountId,
      String? pairedAccountId,
      String categoryId,
      List<String> tags,
      String merchant,
      String project,
      String note,
      DateTime occurredAt,
      List<String> attachments,
      TransactionSource source,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$TransactionEntryCopyWithImpl<$Res, $Val extends TransactionEntry>
    implements $TransactionEntryCopyWith<$Res> {
  _$TransactionEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? amount = null,
    Object? accountId = null,
    Object? pairedAccountId = freezed,
    Object? categoryId = null,
    Object? tags = null,
    Object? merchant = null,
    Object? project = null,
    Object? note = null,
    Object? occurredAt = null,
    Object? attachments = null,
    Object? source = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      pairedAccountId: freezed == pairedAccountId
          ? _value.pairedAccountId
          : pairedAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      merchant: null == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      occurredAt: null == occurredAt
          ? _value.occurredAt
          : occurredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as TransactionSource,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionEntryImplCopyWith<$Res>
    implements $TransactionEntryCopyWith<$Res> {
  factory _$$TransactionEntryImplCopyWith(_$TransactionEntryImpl value,
          $Res Function(_$TransactionEntryImpl) then) =
      __$$TransactionEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      TransactionType type,
      double amount,
      String accountId,
      String? pairedAccountId,
      String categoryId,
      List<String> tags,
      String merchant,
      String project,
      String note,
      DateTime occurredAt,
      List<String> attachments,
      TransactionSource source,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$TransactionEntryImplCopyWithImpl<$Res>
    extends _$TransactionEntryCopyWithImpl<$Res, _$TransactionEntryImpl>
    implements _$$TransactionEntryImplCopyWith<$Res> {
  __$$TransactionEntryImplCopyWithImpl(_$TransactionEntryImpl _value,
      $Res Function(_$TransactionEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? amount = null,
    Object? accountId = null,
    Object? pairedAccountId = freezed,
    Object? categoryId = null,
    Object? tags = null,
    Object? merchant = null,
    Object? project = null,
    Object? note = null,
    Object? occurredAt = null,
    Object? attachments = null,
    Object? source = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$TransactionEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as String,
      pairedAccountId: freezed == pairedAccountId
          ? _value.pairedAccountId
          : pairedAccountId // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      merchant: null == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      occurredAt: null == occurredAt
          ? _value.occurredAt
          : occurredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as TransactionSource,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionEntryImpl extends _TransactionEntry {
  const _$TransactionEntryImpl(
      {required this.id,
      required this.type,
      required this.amount,
      required this.accountId,
      this.pairedAccountId,
      required this.categoryId,
      final List<String> tags = const <String>[],
      this.merchant = '',
      this.project = '',
      this.note = '',
      required this.occurredAt,
      final List<String> attachments = const <String>[],
      this.source = TransactionSource.manual,
      required this.createdAt,
      required this.updatedAt})
      : _tags = tags,
        _attachments = attachments,
        super._();

  factory _$TransactionEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionEntryImplFromJson(json);

  @override
  final String id;
  @override
  final TransactionType type;
  @override
  final double amount;
  @override
  final String accountId;
  @override
  final String? pairedAccountId;
  @override
  final String categoryId;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final String merchant;
  @override
  @JsonKey()
  final String project;
  @override
  @JsonKey()
  final String note;
  @override
  final DateTime occurredAt;
  final List<String> _attachments;
  @override
  @JsonKey()
  List<String> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  @JsonKey()
  final TransactionSource source;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'TransactionEntry(id: $id, type: $type, amount: $amount, accountId: $accountId, pairedAccountId: $pairedAccountId, categoryId: $categoryId, tags: $tags, merchant: $merchant, project: $project, note: $note, occurredAt: $occurredAt, attachments: $attachments, source: $source, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.pairedAccountId, pairedAccountId) ||
                other.pairedAccountId == pairedAccountId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.project, project) || other.project == project) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.occurredAt, occurredAt) ||
                other.occurredAt == occurredAt) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      amount,
      accountId,
      pairedAccountId,
      categoryId,
      const DeepCollectionEquality().hash(_tags),
      merchant,
      project,
      note,
      occurredAt,
      const DeepCollectionEquality().hash(_attachments),
      source,
      createdAt,
      updatedAt);

  /// Create a copy of TransactionEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionEntryImplCopyWith<_$TransactionEntryImpl> get copyWith =>
      __$$TransactionEntryImplCopyWithImpl<_$TransactionEntryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionEntryImplToJson(
      this,
    );
  }
}

abstract class _TransactionEntry extends TransactionEntry {
  const factory _TransactionEntry(
      {required final String id,
      required final TransactionType type,
      required final double amount,
      required final String accountId,
      final String? pairedAccountId,
      required final String categoryId,
      final List<String> tags,
      final String merchant,
      final String project,
      final String note,
      required final DateTime occurredAt,
      final List<String> attachments,
      final TransactionSource source,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$TransactionEntryImpl;
  const _TransactionEntry._() : super._();

  factory _TransactionEntry.fromJson(Map<String, dynamic> json) =
      _$TransactionEntryImpl.fromJson;

  @override
  String get id;
  @override
  TransactionType get type;
  @override
  double get amount;
  @override
  String get accountId;
  @override
  String? get pairedAccountId;
  @override
  String get categoryId;
  @override
  List<String> get tags;
  @override
  String get merchant;
  @override
  String get project;
  @override
  String get note;
  @override
  DateTime get occurredAt;
  @override
  List<String> get attachments;
  @override
  TransactionSource get source;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of TransactionEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionEntryImplCopyWith<_$TransactionEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
