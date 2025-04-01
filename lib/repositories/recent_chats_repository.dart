import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:logger/logger.dart';
import 'package:my_message/app/app.logger.dart';
import 'package:my_message/domain/entities/recent_chat_entity.dart';
import 'package:my_message/domain/vo/get_recent_chat_vo.dart';
import 'package:my_message/domain/vo/retrieved_recent_chats_vo.dart';
import 'package:my_message/domain/vo/update_recent_chat_vo.dart';
import 'package:my_message/services/recent_chats_service.dart';

import '../app/app.locator.dart';
import '../core/result.dart';

class RecentChatsRepository {
  late RecentChatsService _recentChatsService;
  late InternetConnection _internetConnection;
  late Logger _logger;

  RecentChatsRepository() {
    _recentChatsService = locator<RecentChatsService>();
    _internetConnection = InternetConnection();
    _logger = getLogger('RecentChatsRepository');
  }

  Future<Result<Unit>> updateRecentChat(UpdateRecentChatVo vo) async {
    try {
      if (!await _internetConnection.hasInternetAccess) {
        return Result.error(Exception('No internet connection'));
      }

      final result = await _recentChatsService.updateRecentChat(vo);

      return Result.ok(result);
    } catch (e) {
      _logger.e(e.toString());
      return Result.error(e is Exception ? e : Exception(e));
    }
  }

  Future<Result<Unit>> readRecentChat(String roomId, String authUserId) async {
    try {
      if (!await _internetConnection.hasInternetAccess) {
        return Result.error(Exception('No internet connection'));
      }

      final result =
          await _recentChatsService.readRecentChat(roomId, authUserId);

      return Result.ok(result);
    } catch (e) {
      _logger.e(e.toString());
      return Result.error(e is Exception ? e : Exception(e));
    }
  }

  Stream<List<Result<RecentChatEntity>>> connectRecentChatsStream(
      String authUserId) {
    final stream = _recentChatsService.connectRecentChatsStream(authUserId);

    return stream.map((dtoList) {
      return dtoList.map((dto) => RecentChatEntity.create(dto)).toList();
    });
  }

  Future<Result<RetrievedRecentChatsVo>> getRecentChats(
      GetRecentChatsVo vo) async {
    try {
      if (!await _internetConnection.hasInternetAccess) {
        return Result.error(Exception('No internet connection'));
      }

      final retrievedDto = await _recentChatsService.getRecentChats(vo);

      return RetrievedRecentChatsVo.create(retrievedDto);
    } catch (e) {
      _logger.e(e.toString());
      return Result.error(e is Exception ? e : Exception(e));
    }
  }
}
