import 'package:cloud_firestore/cloud_firestore.dart';

class GetRecentChatsDto {
  final String? authUserId;
  final QueryDocumentSnapshot<Map<String, dynamic>>? lastVisible;

  GetRecentChatsDto({this.authUserId, this.lastVisible});
}
