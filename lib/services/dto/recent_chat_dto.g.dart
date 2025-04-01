// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecentChatDtoImpl _$$RecentChatDtoImplFromJson(Map<String, dynamic> json) =>
    _$RecentChatDtoImpl(
      docId: json['docId'] as String?,
      roomId: json['roomId'] as String?,
      message: json['message'] as String?,
      members: (json['members'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
      unread: (json['unread'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ),
      addedBy: json['addedBy'] as String?,
      addedAt: json['addedAt'] as String?,
      userIds:
          (json['userIds'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$RecentChatDtoImplToJson(_$RecentChatDtoImpl instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'roomId': instance.roomId,
      'message': instance.message,
      'members': instance.members,
      'unread': instance.unread,
      'addedBy': instance.addedBy,
      'addedAt': instance.addedAt,
      'userIds': instance.userIds,
    };
