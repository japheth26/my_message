import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_message/services/dto/recent_chat_dto.dart';

class RetrievedRecentChatsDto {
  final List<RecentChatDto>? recentChats;
  final QueryDocumentSnapshot<Map<String, dynamic>>? lastVisible;

  RetrievedRecentChatsDto({this.recentChats, this.lastVisible});
}
