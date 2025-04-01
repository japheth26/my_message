// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_chat_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecentChatDto _$RecentChatDtoFromJson(Map<String, dynamic> json) {
  return _RecentChatDto.fromJson(json);
}

/// @nodoc
mixin _$RecentChatDto {
  String? get docId => throw _privateConstructorUsedError;
  String? get roomId => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Map<String, bool>? get members => throw _privateConstructorUsedError;
  Map<String, bool>? get unread => throw _privateConstructorUsedError;
  String? get addedBy => throw _privateConstructorUsedError;
  String? get addedAt => throw _privateConstructorUsedError;
  List<String>? get userIds => throw _privateConstructorUsedError;

  /// Serializes this RecentChatDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecentChatDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecentChatDtoCopyWith<RecentChatDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentChatDtoCopyWith<$Res> {
  factory $RecentChatDtoCopyWith(
          RecentChatDto value, $Res Function(RecentChatDto) then) =
      _$RecentChatDtoCopyWithImpl<$Res, RecentChatDto>;
  @useResult
  $Res call(
      {String? docId,
      String? roomId,
      String? message,
      Map<String, bool>? members,
      Map<String, bool>? unread,
      String? addedBy,
      String? addedAt,
      List<String>? userIds});
}

/// @nodoc
class _$RecentChatDtoCopyWithImpl<$Res, $Val extends RecentChatDto>
    implements $RecentChatDtoCopyWith<$Res> {
  _$RecentChatDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecentChatDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = freezed,
    Object? roomId = freezed,
    Object? message = freezed,
    Object? members = freezed,
    Object? unread = freezed,
    Object? addedBy = freezed,
    Object? addedAt = freezed,
    Object? userIds = freezed,
  }) {
    return _then(_value.copyWith(
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: freezed == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      members: freezed == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      unread: freezed == unread
          ? _value.unread
          : unread // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      addedBy: freezed == addedBy
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      userIds: freezed == userIds
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentChatDtoImplCopyWith<$Res>
    implements $RecentChatDtoCopyWith<$Res> {
  factory _$$RecentChatDtoImplCopyWith(
          _$RecentChatDtoImpl value, $Res Function(_$RecentChatDtoImpl) then) =
      __$$RecentChatDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? docId,
      String? roomId,
      String? message,
      Map<String, bool>? members,
      Map<String, bool>? unread,
      String? addedBy,
      String? addedAt,
      List<String>? userIds});
}

/// @nodoc
class __$$RecentChatDtoImplCopyWithImpl<$Res>
    extends _$RecentChatDtoCopyWithImpl<$Res, _$RecentChatDtoImpl>
    implements _$$RecentChatDtoImplCopyWith<$Res> {
  __$$RecentChatDtoImplCopyWithImpl(
      _$RecentChatDtoImpl _value, $Res Function(_$RecentChatDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecentChatDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = freezed,
    Object? roomId = freezed,
    Object? message = freezed,
    Object? members = freezed,
    Object? unread = freezed,
    Object? addedBy = freezed,
    Object? addedAt = freezed,
    Object? userIds = freezed,
  }) {
    return _then(_$RecentChatDtoImpl(
      docId: freezed == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      roomId: freezed == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      members: freezed == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      unread: freezed == unread
          ? _value._unread
          : unread // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      addedBy: freezed == addedBy
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      userIds: freezed == userIds
          ? _value._userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentChatDtoImpl extends _RecentChatDto {
  _$RecentChatDtoImpl(
      {this.docId,
      this.roomId,
      this.message,
      final Map<String, bool>? members,
      final Map<String, bool>? unread,
      this.addedBy,
      this.addedAt,
      final List<String>? userIds})
      : _members = members,
        _unread = unread,
        _userIds = userIds,
        super._();

  factory _$RecentChatDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentChatDtoImplFromJson(json);

  @override
  final String? docId;
  @override
  final String? roomId;
  @override
  final String? message;
  final Map<String, bool>? _members;
  @override
  Map<String, bool>? get members {
    final value = _members;
    if (value == null) return null;
    if (_members is EqualUnmodifiableMapView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, bool>? _unread;
  @override
  Map<String, bool>? get unread {
    final value = _unread;
    if (value == null) return null;
    if (_unread is EqualUnmodifiableMapView) return _unread;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? addedBy;
  @override
  final String? addedAt;
  final List<String>? _userIds;
  @override
  List<String>? get userIds {
    final value = _userIds;
    if (value == null) return null;
    if (_userIds is EqualUnmodifiableListView) return _userIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RecentChatDto(docId: $docId, roomId: $roomId, message: $message, members: $members, unread: $unread, addedBy: $addedBy, addedAt: $addedAt, userIds: $userIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentChatDtoImpl &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other._unread, _unread) &&
            (identical(other.addedBy, addedBy) || other.addedBy == addedBy) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            const DeepCollectionEquality().equals(other._userIds, _userIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      docId,
      roomId,
      message,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_unread),
      addedBy,
      addedAt,
      const DeepCollectionEquality().hash(_userIds));

  /// Create a copy of RecentChatDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentChatDtoImplCopyWith<_$RecentChatDtoImpl> get copyWith =>
      __$$RecentChatDtoImplCopyWithImpl<_$RecentChatDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentChatDtoImplToJson(
      this,
    );
  }
}

abstract class _RecentChatDto extends RecentChatDto {
  factory _RecentChatDto(
      {final String? docId,
      final String? roomId,
      final String? message,
      final Map<String, bool>? members,
      final Map<String, bool>? unread,
      final String? addedBy,
      final String? addedAt,
      final List<String>? userIds}) = _$RecentChatDtoImpl;
  _RecentChatDto._() : super._();

  factory _RecentChatDto.fromJson(Map<String, dynamic> json) =
      _$RecentChatDtoImpl.fromJson;

  @override
  String? get docId;
  @override
  String? get roomId;
  @override
  String? get message;
  @override
  Map<String, bool>? get members;
  @override
  Map<String, bool>? get unread;
  @override
  String? get addedBy;
  @override
  String? get addedAt;
  @override
  List<String>? get userIds;

  /// Create a copy of RecentChatDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentChatDtoImplCopyWith<_$RecentChatDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
