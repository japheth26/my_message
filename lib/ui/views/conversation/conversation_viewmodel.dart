import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_message/core/result.dart';
import 'package:my_message/core/state_status.dart';
import 'package:my_message/domain/entities/message_entity.dart';
import 'package:my_message/domain/vo/send_message_vo.dart';
import 'package:my_message/domain/vo/update_recent_chat_vo.dart';
import 'package:my_message/repositories/conversation_repository.dart';
import 'package:my_message/repositories/recent_chats_repository.dart';
import 'package:my_message/services/dto/send_message_dto.dart';
import 'package:my_message/services/dto/update_recent_chat_dto.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../repositories/auth_repository.dart';

class ConversationViewModel extends BaseViewModel {
  final _conversationRepository = locator<ConversationRepository>();
  final _recentChatsRepository = locator<RecentChatsRepository>();
  final _authRepository = locator<AuthRepository>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _composerController = TextEditingController();

  User? _authUser;
  String? _roomId;
  List<MessageEntity> _messages = [];
  StateStatus _stateStatus = StateStatus.initial;

  TextEditingController get composerContnroller => _composerController;
  List<MessageEntity> get messages => _messages;
  String get authUserId => _authUser?.uid ?? '';
  StateStatus get stateStatus => _stateStatus;

  void changeStateStatus(StateStatus stateStatus) {
    _stateStatus = stateStatus;
    rebuildUi();
  }

  Future<void> getAuthUser() async {
    final result = await _authRepository.getLoggedInUser();

    if (result is Ok<User?> && result.value != null) {
      _authUser = result.value;
    }
  }

  Future<void> getRoomId(String memberId) async {
    if (_authUser == null) {
      _dialogService.showDialog(
          title: 'Failed To Get Auth User',
          description: 'Auth user entity is undefined');
      _navigationService.back();
      return;
    }

    final result =
        await _conversationRepository.getRoomId(_authUser!.uid, memberId);

    if (result is Ok<String>) {
      _roomId = result.value;
    }
  }

  Future<void> sendMessage(String memberId, String message) async {
    if (message.isEmpty) {
      return;
    }

    final dto = SendMessageDto(
      roomId: _roomId,
      message: message,
      members: {
        _authUser!.uid: true,
        memberId: true,
      },
      addedBy: _authUser!.uid,
      addedAt: DateTime.now(),
    );

    final voOrError = SendMessageVo.create(dto);

    if (voOrError is Error<SendMessageVo>) {
      _dialogService.showDialog(
          title: 'Failed To Create Value Object',
          description: voOrError.error.toString());
      return;
    }

    final vo = (voOrError as Ok<SendMessageVo>).value;

    final result = await _conversationRepository.sendMessage(vo);

    if (result is Error<Unit>) {
      _dialogService.showDialog(
          title: 'Failed To Send Message',
          description: result.error.toString());
      return;
    }

    if (messages.isEmpty) {
      connectToStream();
    }

    _updateRecentChat(vo, authUserId);
  }

  Future<void> _updateRecentChat(SendMessageVo refVo, String authUserId) async {
    final dto = UpdateRecentChatDto(
      roomId: refVo.roomId,
      message: refVo.message,
      members: refVo.members,
      addedBy: refVo.addedBy,
      addedAt: DateTime.parse(refVo.addedAt),
      unread: refVo.members.map((key, value) {
        if (key == authUserId) {
          return MapEntry(key, false);
        } else {
          return MapEntry(key, true);
        }
      }),
      userIds: refVo.members.keys.toList(),
    );

    final voOrError = UpdateRecentChatVo.create(dto);

    if (voOrError is Error<UpdateRecentChatVo>) {
      return;
    }

    final vo = (voOrError as Ok<UpdateRecentChatVo>).value;

    await _recentChatsRepository.updateRecentChat(vo);
  }

  Future<void> readRecentChat(String roomId, String authUserId) async {
    await _recentChatsRepository.readRecentChat(roomId, authUserId);
  }

  void connectToStream() {
    final stream = _conversationRepository.connectConversationStream(_roomId!);

    stream.forEach((list) {
      final List<MessageEntity> updatedMessages = [];

      for (final item in list) {
        if (item is Error<MessageEntity>) {
          continue;
        }

        final message = (item as Ok<MessageEntity>).value;

        updatedMessages.add(message);
      }

      if (_navigationService.currentRoute == '/conversation-view' &&
          _roomId != null) {
        readRecentChat(_roomId!, authUserId);
      }

      updatedMessages.sort((a, b) => b.addedAt.compareTo(a.addedAt));

      _messages = updatedMessages;

      rebuildUi();
    });
  }
}
