import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_message/services/dto/message_dto.dart';

class RetrievedMessagesDto {
  final List<MessageDto>? messages;
  final QueryDocumentSnapshot<Map<String, dynamic>>? lastVisible;

  RetrievedMessagesDto({this.messages, this.lastVisible});
}
