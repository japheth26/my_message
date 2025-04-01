import 'package:equatable/equatable.dart';
import 'package:my_message/core/result.dart';
import 'package:my_message/services/dto/update_recent_chat_dto.dart';
import 'package:my_message/ui/common/guard_validator/guard.dart';

class UpdateRecentChatVo extends Equatable {
  final String roomId;
  final String message;
  final Map<String, bool> members;
  final String addedBy;
  final String addedAt;
  final Map<String, bool> unread;
  final List<String> userIds;

  const UpdateRecentChatVo({
    required this.roomId,
    required this.message,
    required this.members,
    required this.addedBy,
    required this.addedAt,
    required this.unread,
    required this.userIds,
  });

  @override
  List<Object?> get props => [
        roomId,
        message,
        members,
        addedBy,
        addedAt,
        unread,
        userIds,
      ];

  static Result<UpdateRecentChatVo> create(UpdateRecentChatDto dto) {
    final guardResult = Guard.combine([
      Guard.againstEmptyString('Room ID', dto.roomId),
      Guard.againstEmptyArray('Members', dto.members?.keys.toList()),
      Guard.againstEmptyArray('Unread Object', dto.unread?.keys.toList()),
      Guard.againstEmptyString('Added By', dto.addedBy),
      Guard.againstInvalidDate('Added At', dto.addedAt),
      Guard.againstEmptyArray('User IDs', dto.userIds),
    ]);

    if (guardResult != null) {
      return Result.error(Exception(guardResult));
    }

    final data = UpdateRecentChatVo(
      roomId: dto.roomId!,
      message: dto.message ?? '',
      members: dto.members!,
      addedBy: dto.addedBy!,
      addedAt: dto.addedAt!.toIso8601String(),
      unread: dto.unread!,
      userIds: dto.userIds!,
    );

    return Result.ok(data);
  }
}
