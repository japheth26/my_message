import 'package:equatable/equatable.dart';
import 'package:my_message/core/result.dart';
import 'package:my_message/services/dto/recent_chat_dto.dart';
import 'package:my_message/ui/common/guard_validator/guard.dart';

class RecentChatEntity extends Equatable {
  final String docId;
  final String roomId;
  final String message;
  final Map<String, bool> members;
  final Map<String, bool> unread;
  final String addedBy;
  final DateTime addedAt;
  final List<String> userIds;

  const RecentChatEntity({
    required this.docId,
    required this.roomId,
    required this.message,
    required this.members,
    required this.unread,
    required this.addedBy,
    required this.addedAt,
    required this.userIds,
  });

  @override
  List<Object?> get props =>
      [docId, roomId, message, members, addedBy, addedAt];

  static Result<RecentChatEntity> create(RecentChatDto dto) {
    final guardResult = Guard.combine([
      Guard.againstEmptyString('Doc ID', dto.docId),
      Guard.againstEmptyString('Room ID', dto.roomId),
      Guard.againstEmptyArray('Members', dto.members?.keys.toList()),
      Guard.againstEmptyArray('Unread Object', dto.unread?.keys.toList()),
      Guard.againstEmptyString('Added By', dto.addedBy),
      Guard.againstInvalidDate('Added At', dto.addedAt),
      Guard.againstEmptyArray('UserIds', dto.userIds),
    ]);

    if (guardResult != null) {
      return Result.error(Exception(guardResult));
    }

    final data = RecentChatEntity(
      docId: dto.docId!,
      roomId: dto.roomId!,
      message: dto.message ?? '',
      members: dto.members!,
      unread: dto.unread!,
      addedBy: dto.addedBy!,
      addedAt: DateTime.parse(dto.addedAt!),
      userIds: dto.userIds!,
    );

    return Result.ok(data);
  }
}
