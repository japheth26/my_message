import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:my_message/domain/entities/message_entity.dart';
import 'package:my_message/services/dto/retrieved_messages_dto.dart';

import '../../core/result.dart';

class RetrievedMessagesVo extends Equatable {
  final List<MessageEntity> messages;
  final QueryDocumentSnapshot<Map<String, dynamic>>? lastVisible;

  const RetrievedMessagesVo(
      {required this.messages, required this.lastVisible});

  @override
  List<Object?> get props => [messages, lastVisible];

  static Result<RetrievedMessagesVo> create(RetrievedMessagesDto dto) {
    final List<MessageEntity> messages = [];

    for (final messageDto in dto.messages ?? []) {
      final entityOrError = MessageEntity.create(messageDto);
      if (entityOrError is Ok<MessageEntity>) {
        messages.add(entityOrError.value);
      }
    }

    final data =
        RetrievedMessagesVo(messages: messages, lastVisible: dto.lastVisible);

    return Result.ok(data);
  }
}
