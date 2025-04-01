import 'package:cloud_firestore/cloud_firestore.dart';

class SearchMemberDto {
  final String? authUserId;
  final String? q;
  final QueryDocumentSnapshot<Map<String, dynamic>>? lastVisible;

  SearchMemberDto({this.authUserId, this.q, this.lastVisible});
}
