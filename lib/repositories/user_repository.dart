import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:logger/logger.dart';
import 'package:my_message/app/app.locator.dart';
import 'package:my_message/core/result.dart';
import 'package:my_message/domain/entities/member_entity.dart';
import 'package:my_message/domain/vo/search_member_vo.dart';
import 'package:my_message/domain/vo/searched_members_vo.dart';
import 'package:my_message/services/dto/member_dto.dart';
import 'package:my_message/services/dto/searched_members_dto.dart';
import 'package:my_message/services/user_service.dart';

import '../app/app.logger.dart';

class UserRepository {
  late UserService _userService;
  late InternetConnection _internetConnection;
  late Logger _logger;

  UserRepository() {
    _userService = locator<UserService>();
    _internetConnection = InternetConnection();
    _logger = getLogger('UserRepository');
  }

  Future<Result<SearchedMembersVo>> searchMembers(SearchMemberVo vo) async {
    try {
      if (!await _internetConnection.hasInternetAccess) {
        return Result.error(Exception('No internet connection'));
      }

      final SearchedMembersDto dto = await _userService.searchMembers(vo);

      return SearchedMembersVo.create(dto);
    } catch (e) {
      _logger.e(e.toString());
      return Result.error(e is Exception ? e : Exception(e));
    }
  }

  Future<Result<List<MemberEntity>>> getMembers(List<String> userIds) async {
    try {
      if (!await _internetConnection.hasInternetAccess) {
        return Result.error(Exception('No internet connection'));
      }

      final List<MemberDto> dtos = await _userService.getMembers(userIds);

      final List<MemberEntity> result = [];

      for (final dto in dtos) {
        final entityOrError = MemberEntity.create(dto);

        if (entityOrError is Error<MemberEntity>) continue;

        final entity = (entityOrError as Ok<MemberEntity>).value;

        result.add(entity);
      }

      return Result.ok(result);
    } catch (e) {
      _logger.e(e.toString());
      return Result.error(e is Exception ? e : Exception(e));
    }
  }
}
