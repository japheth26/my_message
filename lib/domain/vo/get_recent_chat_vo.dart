import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:my_message/core/result.dart';
import 'package:my_message/services/dto/get_recent_chat_dto.dart';
import 'package:my_message/ui/common/guard_validator/guard.dart';

class GetRecentChatsVo extends Equatable {
  final String authUserId;
  final QueryDocumentSnapshot<Map<String, dynamic>>? lastVisible;

  const GetRecentChatsVo({required this.authUserId, required this.lastVisible});

  @override
  List<Object?> get props => [authUserId, lastVisible];

  static Result<GetRecentChatsVo> create(GetRecentChatsDto dto) {
    final guardResult = Guard.combine([
      Guard.againstEmptyString('Auth User ID', dto.authUserId),
    ]);

    if (guardResult != null) {
      return Result.error(Exception(guardResult));
    }

    final data = GetRecentChatsVo(
        authUserId: dto.authUserId!, lastVisible: dto.lastVisible);

    return Result.ok(data);
  }
}
