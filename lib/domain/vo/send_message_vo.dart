import 'package:equatable/equatable.dart';
import 'package:my_message/core/result.dart';
import 'package:my_message/services/dto/send_message_dto.dart';
import 'package:my_message/ui/common/guard_validator/guard.dart';

class SendMessageVo extends Equatable {
  final String roomId;
  final String message;
  final Map<String, bool> members;
  final String addedBy;
  final String addedAt;

  const SendMessageVo(
      {required this.roomId,
      required this.message,
      required this.members,
      required this.addedBy,
      required this.addedAt});

  @override
  List<Object?> get props => [roomId, message, members, addedBy, addedAt];

  static Result<SendMessageVo> create(SendMessageDto dto) {
    final guardResult = Guard.combine([
      Guard.againstEmptyString('Room ID', dto.roomId),
      Guard.againstEmptyArray('Members', dto.members?.keys.toList()),
      Guard.againstEmptyString('Added By', dto.addedBy),
      Guard.againstInvalidDate('Added At', dto.addedAt),
    ]);

    if (guardResult != null) {
      return Result.error(Exception(guardResult));
    }

    final data = SendMessageVo(
      roomId: dto.roomId!,
      message: dto.message ?? '',
      members: dto.members!,
      addedBy: dto.addedBy!,
      addedAt: dto.addedAt!.toIso8601String(),
    );

    return Result.ok(data);
  }
}
