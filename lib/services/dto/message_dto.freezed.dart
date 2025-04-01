// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageDto _$MessageDtoFromJson(Map<String, dynamic> json) {
  return _MessageDto.fromJson(json);
}

/// @nodoc
mixin _$MessageDto {
  String? get docId => throw _privateConstructorUsedError;
  String? get roomId => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  Map<String, bool>? get members => throw _privateConstructorUsedError;
  String? get addedBy => throw _privateConstructorUsedError;
  String? get addedAt => throw _privateConstructorUsedError;

  /// Serializes this MessageDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageDtoCopyWith<MessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageDtoCopyWith<$Res> {
  factory $MessageDtoCopyWith(
          MessageDto value, $Res Function(MessageDto) then) =
      _$MessageDtoCopyWithImpl<$Res, MessageDto>;
  @useResult
  $Res call(
      {String? docId,
      String? roomId,
      String? message,
      Map<String, bool>? members,
      String? addedBy,
      String? addedAt});
}

/// @nodoc
class _$MessageDtoCopyWithImpl<$Res, $Val extends MessageDto>
    implements $MessageDtoCopyWith<$Res> {
  _$MessageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = freezed,
    Object? roomId = freezed,
    Object? message = freezed,
    Object? members = freezed,
    Object? addedBy = freezed,
    Object? addedAt = freezed,
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
      addedBy: freezed == addedBy
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageDtoImplCopyWith<$Res>
    implements $MessageDtoCopyWith<$Res> {
  factory _$$MessageDtoImplCopyWith(
          _$MessageDtoImpl value, $Res Function(_$MessageDtoImpl) then) =
      __$$MessageDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? docId,
      String? roomId,
      String? message,
      Map<String, bool>? members,
      String? addedBy,
      String? addedAt});
}

/// @nodoc
class __$$MessageDtoImplCopyWithImpl<$Res>
    extends _$MessageDtoCopyWithImpl<$Res, _$MessageDtoImpl>
    implements _$$MessageDtoImplCopyWith<$Res> {
  __$$MessageDtoImplCopyWithImpl(
      _$MessageDtoImpl _value, $Res Function(_$MessageDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docId = freezed,
    Object? roomId = freezed,
    Object? message = freezed,
    Object? members = freezed,
    Object? addedBy = freezed,
    Object? addedAt = freezed,
  }) {
    return _then(_$MessageDtoImpl(
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
      addedBy: freezed == addedBy
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageDtoImpl extends _MessageDto {
  _$MessageDtoImpl(
      {this.docId,
      this.roomId,
      this.message,
      final Map<String, bool>? members,
      this.addedBy,
      this.addedAt})
      : _members = members,
        super._();

  factory _$MessageDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageDtoImplFromJson(json);

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

  @override
  final String? addedBy;
  @override
  final String? addedAt;

  @override
  String toString() {
    return 'MessageDto(docId: $docId, roomId: $roomId, message: $message, members: $members, addedBy: $addedBy, addedAt: $addedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageDtoImpl &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.addedBy, addedBy) || other.addedBy == addedBy) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, docId, roomId, message,
      const DeepCollectionEquality().hash(_members), addedBy, addedAt);

  /// Create a copy of MessageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageDtoImplCopyWith<_$MessageDtoImpl> get copyWith =>
      __$$MessageDtoImplCopyWithImpl<_$MessageDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageDtoImplToJson(
      this,
    );
  }
}

abstract class _MessageDto extends MessageDto {
  factory _MessageDto(
      {final String? docId,
      final String? roomId,
      final String? message,
      final Map<String, bool>? members,
      final String? addedBy,
      final String? addedAt}) = _$MessageDtoImpl;
  _MessageDto._() : super._();

  factory _MessageDto.fromJson(Map<String, dynamic> json) =
      _$MessageDtoImpl.fromJson;

  @override
  String? get docId;
  @override
  String? get roomId;
  @override
  String? get message;
  @override
  Map<String, bool>? get members;
  @override
  String? get addedBy;
  @override
  String? get addedAt;

  /// Create a copy of MessageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageDtoImplCopyWith<_$MessageDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
