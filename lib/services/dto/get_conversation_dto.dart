import 'package:cloud_firestore/cloud_firestore.dart';

class GetConversationDto {
  final String? roomId;
  final QueryDocumentSnapshot<Map<String, dynamic>>? lastVisible;

  GetConversationDto({this.roomId, this.lastVisible});
}
