import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:my_message/core/result.dart';
import 'package:my_message/services/dto/search_member.dto.dart';
import 'package:my_message/ui/common/guard_validator/guard.dart';

class SearchMemberVo extends Equatable {
  final String authUserId;
  final String q;
  final QueryDocumentSnapshot<Map<String, dynamic>>? lastVisible;

  const SearchMemberVo(
      {required this.authUserId, required this.q, required this.lastVisible});

  @override
  List<Object?> get props => [authUserId, q, lastVisible];

  static Result<SearchMemberVo> create(SearchMemberDto dto) {
    final guardResult = Guard.combine([
      Guard.againstEmptyString('Auth User ID', dto.authUserId),
    ]);

    if (guardResult != null) {
      return Result.error(Exception(guardResult));
    }

    final data = SearchMemberVo(
        authUserId: dto.authUserId!,
        q: dto.q ?? '',
        lastVisible: dto.lastVisible);

    return Result.ok(data);
  }
}
