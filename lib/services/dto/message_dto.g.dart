// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageDtoImpl _$$MessageDtoImplFromJson(Map<String, dynamic> json) =>
    _$MessageDtoImpl(
      docId: json['docId'] as String?,
      roomId: json['roomId'] as String?,
      message: json['message'] as String?,
      members: (json['members'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
      addedBy: json['addedBy'] as String?,
      addedAt: json['addedAt'] as String?,
    );

Map<String, dynamic> _$$MessageDtoImplToJson(_$MessageDtoImpl instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'roomId': instance.roomId,
      'message': instance.message,
      'members': instance.members,
      'addedBy': instance.addedBy,
      'addedAt': instance.addedAt,
    };
