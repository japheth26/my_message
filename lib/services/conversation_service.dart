import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:my_message/domain/vo/get_conversation_vo.dart';
import 'package:my_message/domain/vo/send_message_vo.dart';
import 'package:my_message/services/dto/message_dto.dart';
import 'package:my_message/services/dto/retrieved_messages_dto.dart';

import '../app/app.locator.dart';
import 'firebase_service.dart';

class ConversationService {
  late FirebaseService _firebaseService;
  late FirebaseFirestore _firebaseFirestore;
  late CollectionReference<Map<String, dynamic>> _collection;

  ConversationService() {
    _firebaseService = locator<FirebaseService>();
    _firebaseFirestore = _firebaseService.firebaseFirestore;
    _collection = _firebaseFirestore.collection('conversation');
  }

  Future<String> getRoomId(String userId1, String userId2) async {
    try {
      final snapshot = await _collection
          .where('members.$userId1', isEqualTo: true)
          .where('members.$userId2', isEqualTo: true)
          .limit(100)
          .get();

      final doc = snapshot.docs.firstWhereOrNull((doc) {
        final Map<String, dynamic> members = doc['members'];
        return members.length == 2;
      });

      return doc?['roomId'] ??
          '${userId1}_${userId2}_${DateTime.now().toIso8601String()}';
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<RetrievedMessagesDto> getConversation(GetConversationVo vo) async {
    try {
      final List<MessageDto> messages = [];

      late Query<Map<String, dynamic>> query;

      if (vo.lastVisible != null) {
        query = _collection
            .orderBy('timestamp')
            .startAfterDocument(vo.lastVisible!);
      } else {
        query = _collection.orderBy('timestamp');
      }

      final snapshot =
          await query.where('roomId', isEqualTo: vo.roomId).limit(10).get();

      for (final doc in snapshot.docs) {
        messages.add(MessageDto.fromJson({
          'docId': doc.id,
          ...doc.data(),
        }));
      }

      return RetrievedMessagesDto(
          messages: messages,
          lastVisible: snapshot.docs.isNotEmpty
              ? snapshot.docs[snapshot.size - 1]
              : null);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Unit> sendMessage(SendMessageVo vo) async {
    try {
      await _collection.add({
        'roomId': vo.roomId,
        'message': vo.message,
        'members': vo.members,
        'addedBy': vo.addedBy,
        'addedAt': vo.addedAt,
        'timestamp': vo.addedAt,
      });

      return unit;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Stream<List<MessageDto>> connectConversationStream(String roomId) {
    return _collection
        .orderBy('timestamp')
        .where('roomId', isEqualTo: roomId)
        .snapshots()
        .map((e) {
      return e.docs
          .map((doc) => MessageDto.fromJson({'docId': doc.id, ...doc.data()}))
          .toList();
    });
  }
}
