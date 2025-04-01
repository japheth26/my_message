import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_message/core/state_status.dart';
import 'package:my_message/domain/entities/recent_chat_entity.dart';
import 'package:my_message/domain/vo/get_recent_chat_vo.dart';
import 'package:my_message/domain/vo/retrieved_recent_chats_vo.dart';
import 'package:my_message/repositories/recent_chats_repository.dart';
import 'package:my_message/services/dto/get_recent_chat_dto.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../core/result.dart';
import '../../../domain/entities/member_entity.dart';
import '../../../repositories/auth_repository.dart';
import '../../../repositories/user_repository.dart';
import '../../../services/dto/update_recent_chat_dto.dart';

class ChatViewModel extends BaseViewModel {
  final _userRepository = locator<UserRepository>();
  final _authRepository = locator<AuthRepository>();
  final _dialogService = locator<DialogService>();
  final _recentChatsRepository = locator<RecentChatsRepository>();
  final _navigationService = locator<NavigationService>();
  final _scrollController = ScrollController();

  User? _authUser;
  RetrievedRecentChatsVo? _retrievedRecentChatsVo;
  List<RecentChatEntity> _recentChats = [];
  String get authUserId => _authUser?.uid ?? '';
  final List<MemberEntity> _members = [];
  StateStatus _stateStatus = StateStatus.initial;

  ScrollController get scrollController => _scrollController;
  List<RecentChatEntity> get recentChats => _recentChats;
  List<MemberEntity> get members => _members;
  NavigationService get navigationService => _navigationService;
  StateStatus get stateStatus => _stateStatus;

  Future<void> getAuthUser() async {
    final result = await _authRepository.getLoggedInUser();

    if (result is Ok<User?> && result.value != null) {
      _authUser = result.value;
    }
  }

  Future<void> getMembers(String authUserId, List<RecentChatEntity> recentChats,
      {bool? rebuildAfter}) async {
    final userIds = recentChats
        .map((e) => e.members.keys.firstWhere((e) => e != authUserId))
        .toList();

    final newUserIds = userIds
        .where((x) => !_members.map((e) => e.userId).contains(x))
        .toList();

    if (newUserIds.isEmpty) {
      return;
    }

    final result = await _userRepository.getMembers(newUserIds);

    if (result is Error<List<MemberEntity>>) {
      return;
    }

    final list = (result as Ok<List<MemberEntity>>).value;

    _members.addAll(list);

    if (rebuildAfter ?? false) {
      rebuildUi();
    }
  }

  Future<void> getRecentChats(String authUserId) async {
    final dto = GetRecentChatsDto(
        authUserId: authUserId,
        lastVisible: _retrievedRecentChatsVo?.lastVisible);

    final voOrError = GetRecentChatsVo.create(dto);

    if (voOrError is Error<GetRecentChatsVo>) {
      _dialogService.showDialog(
          title: 'Failed To Create Value Object',
          description: voOrError.error.toString());

      return;
    }

    final vo = (voOrError as Ok<GetRecentChatsVo>).value;

    final result = await _recentChatsRepository.getRecentChats(vo);

    if (result is Error<RetrievedRecentChatsVo>) {
      _dialogService.showDialog(
          title: 'Failed To Get Recent Chats',
          description: result.error.toString());

      return;
    }

    _retrievedRecentChatsVo = (result as Ok<RetrievedRecentChatsVo>).value;

    await getMembers(authUserId,
        _retrievedRecentChatsVo?.recentChats ?? <RecentChatEntity>[]);

    for (final recentChat
        in _retrievedRecentChatsVo?.recentChats ?? <RecentChatEntity>[]) {
      final index = _recentChats.indexWhere((e) => e.docId == recentChat.docId);

      if (index > -1) {
        _recentChats.replaceRange(index, index + 1, [recentChat]);
      } else {
        _recentChats.add(recentChat);
      }
    }

    _recentChats.sort((a, b) => b.addedAt.compareTo(a.addedAt));

    rebuildUi();
  }

  Future<void> readRecentChat(String roomId, String authUserId) async {
    await _recentChatsRepository.readRecentChat(roomId, authUserId);
  }

  void connectToStream(String authUserId) {
    final stream = _recentChatsRepository.connectRecentChatsStream(authUserId);

    stream.forEach((list) {
      final List<RecentChatEntity> updatedList = [];

      for (final item in list) {
        if (item is Error<RecentChatEntity>) {
          continue;
        }

        final recentChat = (item as Ok<RecentChatEntity>).value;

        updatedList.add(recentChat);
      }

      updatedList.sort((a, b) => b.addedAt.compareTo(a.addedAt));
      _recentChats = updatedList;

      rebuildUi();
    });
  }

  void timer() {
    Timer.periodic(const Duration(minutes: 1), (timer) {
      rebuildUi();
    });
  }

  void changeStateStatus(StateStatus stateStatus) {
    _stateStatus = stateStatus;
    rebuildUi();
  }
}
