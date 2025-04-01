import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:my_message/domain/entities/recent_chat_entity.dart';
import 'package:my_message/services/dto/retrieved_recent_chats_dto.dart';

import '../../core/result.dart';

class RetrievedRecentChatsVo extends Equatable {
  final List<RecentChatEntity> recentChats;
  final QueryDocumentSnapshot<Map<String, dynamic>>? lastVisible;

  const RetrievedRecentChatsVo(
      {required this.recentChats, required this.lastVisible});

  @override
  List<Object?> get props => [recentChats, lastVisible];

  static Result<RetrievedRecentChatsVo> create(RetrievedRecentChatsDto dto) {
    final List<RecentChatEntity> recentChats = [];

    for (final recentChatDto in dto.recentChats ?? []) {
      final entityOrError = RecentChatEntity.create(recentChatDto);
      if (entityOrError is Ok<RecentChatEntity>) {
        recentChats.add(entityOrError.value);
      }
    }

    final data = RetrievedRecentChatsVo(
        recentChats: recentChats, lastVisible: dto.lastVisible);

    return Result.ok(data);
  }
}
