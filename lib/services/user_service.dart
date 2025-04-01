import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:my_message/app/app.locator.dart';
import 'package:my_message/domain/vo/search_member_vo.dart';
import 'package:my_message/domain/vo/sign_up_vo.dart';
import 'package:my_message/services/dto/member_dto.dart';
import 'package:my_message/services/dto/searched_members_dto.dart';
import 'package:my_message/services/firebase_service.dart';

class UserService {
  late FirebaseService _firebaseService;
  late FirebaseFirestore _firebaseFirestore;
  late CollectionReference<Map<String, dynamic>> _collection;

  UserService() {
    _firebaseService = locator<FirebaseService>();
    _firebaseFirestore = _firebaseService.firebaseFirestore;
    _collection = _firebaseFirestore.collection('users');
  }

  Future<Unit> saveUser(String userId, SignUpVo vo) async {
    try {
      await _collection.add({
        'userId': userId,
        'fullName': vo.fullName,
        'email': vo.email,
        'colorValue': vo.colorValue
      });

      return unit;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<SearchedMembersDto> searchMembers(SearchMemberVo vo) async {
    try {
      final List<MemberDto> members = [];

      late Query<Map<String, dynamic>> query;

      if (vo.lastVisible == null && vo.q.isNotEmpty) {
        query = _collection
            .orderBy('fullName')
            .startAt([vo.q]).endAt(['${vo.q}\uf8ff']);
      } else if (vo.lastVisible != null && vo.q.isNotEmpty) {
        query = _collection.orderBy('fullName').startAt([vo.q]).endAt(
            ['${vo.q}\uf8ff']).startAfterDocument(vo.lastVisible!);
      } else {
        query = _collection.orderBy('fullName');
      }

      final snapshot = await query
          .where('userId', isNotEqualTo: vo.authUserId)
          .limit(25)
          .get();

      for (final doc in snapshot.docs) {
        members.add(MemberDto.fromJson(doc.data()));
      }

      return SearchedMembersDto(
          q: vo.q,
          members: members,
          lastVisible: snapshot.docs.isNotEmpty
              ? snapshot.docs[snapshot.size - 1]
              : null);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<MemberDto>> getMembers(List<String> userIds) async {
    try {
      final snapshot =
          await _collection.where('userId', whereIn: userIds).get();

      final List<MemberDto> members = [];
      for (final doc in snapshot.docs) {
        members.add(MemberDto.fromJson(doc.data()));
      }

      return members;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
