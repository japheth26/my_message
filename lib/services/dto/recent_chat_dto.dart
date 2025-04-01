import 'package:freezed_annotation/freezed_annotation.dart';

part 'recent_chat_dto.freezed.dart';
part 'recent_chat_dto.g.dart';

@freezed
class RecentChatDto with _$RecentChatDto {
  factory RecentChatDto({
    String? docId,
    String? roomId,
    String? message,
    Map<String, bool>? members,
    Map<String, bool>? unread,
    String? addedBy,
    String? addedAt,
    List<String>? userIds,
  }) = _RecentChatDto;

  const RecentChatDto._();

  factory RecentChatDto.fromJson(Map<String, dynamic> json) =>
      _$RecentChatDtoFromJson(json);
}
