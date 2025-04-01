import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:my_message/core/result.dart';
import 'package:my_message/services/dto/get_conversation_dto.dart';
import 'package:my_message/ui/common/guard_validator/guard.dart';

class GetConversationVo extends Equatable {
  final String roomId;
  final QueryDocumentSnapshot<Map<String, dynamic>>? lastVisible;

  const GetConversationVo({required this.roomId, required this.lastVisible});

  @override
  List<Object?> get props => [roomId, lastVisible];

  static Result<GetConversationVo> create(GetConversationDto dto) {
    final guardResult = Guard.combine([
      Guard.againstEmptyString('Room ID', dto.roomId),
    ]);

    if (guardResult != null) {
      return Result.error(Exception(guardResult));
    }

    final data =
        GetConversationVo(roomId: dto.roomId!, lastVisible: dto.lastVisible);

    return Result.ok(data);
  }
}
