// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberDtoImpl _$$MemberDtoImplFromJson(Map<String, dynamic> json) =>
    _$MemberDtoImpl(
      userId: json['userId'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      colorValue: (json['colorValue'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MemberDtoImplToJson(_$MemberDtoImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fullName': instance.fullName,
      'email': instance.email,
      'colorValue': instance.colorValue,
    };
