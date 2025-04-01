import 'package:equatable/equatable.dart';
import 'package:my_message/core/result.dart';
import 'package:my_message/services/dto/message_dto.dart';
import 'package:my_message/ui/common/guard_validator/guard.dart';

class MessageEntity extends Equatable {
  final String docId;
  final String roomId;
  final String message;
  final Map<String, bool> members;
  final String addedBy;
  final DateTime addedAt;

  const MessageEntity(
      {required this.docId,
      required this.roomId,
      required this.message,
      required this.members,
      required this.addedBy,
      required this.addedAt});

  @override
  List<Object?> get props =>
      [docId, roomId, message, members, addedBy, addedAt];

  static Result<MessageEntity> create(MessageDto dto) {
    final guardResult = Guard.combine([
      Guard.againstEmptyString('Doc ID', dto.docId),
      Guard.againstEmptyString('Room ID', dto.roomId),
      Guard.againstEmptyArray('Members', dto.members?.keys.toList()),
      Guard.againstEmptyString('Added By', dto.addedBy),
      Guard.againstInvalidDate('Added At', dto.addedAt),
    ]);

    if (guardResult != null) {
      return Result.error(Exception(guardResult));
    }

    final data = MessageEntity(
      docId: dto.docId!,
      roomId: dto.roomId!,
      message: dto.message ?? '',
      members: dto.members!,
      addedBy: dto.addedBy!,
      addedAt: DateTime.parse(dto.addedAt!),
    );

    return Result.ok(data);
  }
}
