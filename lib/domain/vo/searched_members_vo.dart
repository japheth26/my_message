import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:my_message/domain/entities/member_entity.dart';
import 'package:my_message/services/dto/searched_members_dto.dart';

import '../../core/result.dart';

class SearchedMembersVo extends Equatable {
  final String q;
  final List<MemberEntity> members;
  final QueryDocumentSnapshot<Map<String, dynamic>>? lastVisible;

  const SearchedMembersVo(
      {required this.q, required this.members, required this.lastVisible});

  @override
  List<Object?> get props => [q, members, lastVisible];

  static Result<SearchedMembersVo> create(SearchedMembersDto dto) {
    final List<MemberEntity> members = [];

    for (final memberDto in dto.members ?? []) {
      final entityOrError = MemberEntity.create(memberDto);
      if (entityOrError is Ok<MemberEntity>) {
        members.add(entityOrError.value);
      }
    }

    final data = SearchedMembersVo(
        q: dto.q ?? '', members: members, lastVisible: dto.lastVisible);

    return Result.ok(data);
  }
}
