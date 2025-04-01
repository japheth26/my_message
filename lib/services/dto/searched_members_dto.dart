import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_message/services/dto/member_dto.dart';

class SearchedMembersDto {
  final String? q;
  final List<MemberDto>? members;
  final QueryDocumentSnapshot<Map<String, dynamic>>? lastVisible;

  SearchedMembersDto({this.q, this.members, this.lastVisible});
}
