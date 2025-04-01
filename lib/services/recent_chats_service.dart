import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:my_message/domain/vo/get_recent_chat_vo.dart';
import 'package:my_message/domain/vo/update_recent_chat_vo.dart';
import 'package:my_message/services/dto/recent_chat_dto.dart';
import 'package:my_message/services/dto/retrieved_recent_chats_dto.dart';

import '../app/app.locator.dart';
import 'firebase_service.dart';

class RecentChatsService {
  late FirebaseService _firebaseService;
  late FirebaseFirestore _firebaseFirestore;
  late CollectionReference<Map<String, dynamic>> _collection;

  RecentChatsService() {
    _firebaseService = locator<FirebaseService>();
    _firebaseFirestore = _firebaseService.firebaseFirestore;
    _collection = _firebaseFirestore.collection('recentChats');
  }

  Future<Unit> updateRecentChat(UpdateRecentChatVo vo) async {
    try {
      final snapshot = await _collection
          .where('roomId', isEqualTo: vo.roomId)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final userDocRef = snapshot.docs.first.reference;
        await userDocRef.update({
          'message': vo.message,
          'unread': vo.unread,
          'addedAt': vo.addedAt,
          'timestamp': vo.addedAt,
        });
      } else {
        await _collection.add({
          'roomId': vo.roomId,
          'message': vo.message,
          'members': vo.members,
          'unread': vo.unread,
          'userIds': vo.userIds,
          'addedBy': vo.addedBy,
          'addedAt': vo.addedAt,
          'timestamp': vo.addedAt,
        });
      }

      return unit;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Unit> readRecentChat(String roomId, String authUserId) async {
    try {
      final snapshot =
          await _collection.where('roomId', isEqualTo: roomId).limit(1).get();

      if (snapshot.docs.isNotEmpty) {
        DocumentReference userDocRef = snapshot.docs.first.reference;

        Map<String, dynamic> unread = snapshot.docs[0].data()['unread'] ?? {};
        unread = <String, dynamic>{
          ...unread,
          authUserId: false,
        };
        await userDocRef.update({
          'unread': unread,
        });
      }

      return unit;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Stream<List<RecentChatDto>> connectRecentChatsStream(String authUserId) {
    return _collection
        .orderBy('timestamp')
        .where('userIds', arrayContainsAny: [authUserId])
        .snapshots()
        .map((e) {
          return e.docs
              .map((doc) =>
                  RecentChatDto.fromJson({'docId': doc.id, ...doc.data()}))
              .toList();
        });
  }

  Future<RetrievedRecentChatsDto> getRecentChats(GetRecentChatsVo vo) async {
    try {
      final List<RecentChatDto> recentChats = [];

      late Query<Map<String, dynamic>> query;

      if (vo.lastVisible != null) {
        query = _collection
            .orderBy('timestamp')
            .startAfterDocument(vo.lastVisible!);
      } else {
        query = _collection.orderBy('timestamp');
      }

      final snapshot = await query
          .where('userIds', arrayContainsAny: [vo.authUserId])
          .limit(25)
          .get();

      for (final doc in snapshot.docs) {
        recentChats.add(RecentChatDto.fromJson({
          'docId': doc.id,
          ...doc.data(),
        }));
      }

      return RetrievedRecentChatsDto(
          recentChats: recentChats,
          lastVisible: snapshot.docs.isNotEmpty
              ? snapshot.docs[snapshot.size - 1]
              : null);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
