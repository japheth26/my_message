import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:logger/logger.dart';
import 'package:my_message/domain/entities/message_entity.dart';
import 'package:my_message/domain/vo/get_conversation_vo.dart';
import 'package:my_message/domain/vo/retrieved_messages_vo.dart';
import 'package:my_message/services/conversation_service.dart';

import '../app/app.locator.dart';
import '../app/app.logger.dart';
import '../core/result.dart';
import '../domain/vo/send_message_vo.dart';

class ConversationRepository {
  late ConversationService _conversationService;
  late InternetConnection _internetConnection;
  late Logger _logger;

  ConversationRepository() {
    _conversationService = locator<ConversationService>();
    _internetConnection = InternetConnection();
    _logger = getLogger('ConversationRepository');
  }

  Future<Result<String>> getRoomId(String userId1, String userId2) async {
    try {
      if (!await _internetConnection.hasInternetAccess) {
        return Result.error(Exception('No internet connection'));
      }

      final result = await _conversationService.getRoomId(userId1, userId2);

      return Result.ok(result);
    } catch (e) {
      _logger.e(e.toString());
      return Result.error(e is Exception ? e : Exception(e));
    }
  }

  Future<Result<RetrievedMessagesVo>> getConversation(
      GetConversationVo vo) async {
    try {
      if (!await _internetConnection.hasInternetAccess) {
        return Result.error(Exception('No internet connection'));
      }

      final retrievedDto = await _conversationService.getConversation(vo);

      return RetrievedMessagesVo.create(retrievedDto);
    } catch (e) {
      _logger.e(e.toString());
      return Result.error(e is Exception ? e : Exception(e));
    }
  }

  Future<Result<Unit>> sendMessage(SendMessageVo vo) async {
    try {
      if (!await _internetConnection.hasInternetAccess) {
        return Result.error(Exception('No internet connection'));
      }

      final result = await _conversationService.sendMessage(vo);

      return Result.ok(result);
    } catch (e) {
      _logger.e(e.toString());
      return Result.error(e is Exception ? e : Exception(e));
    }
  }

  Stream<List<Result<MessageEntity>>> connectConversationStream(String roomId) {
    final stream = _conversationService.connectConversationStream(roomId);

    return stream.map((dtoList) {
      return dtoList.map((dto) => MessageEntity.create(dto)).toList();
    }).handleError((error) {
      _logger.e(error.toString());
      return [];
    });
  }
}
