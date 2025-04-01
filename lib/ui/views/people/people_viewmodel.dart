import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:my_message/app/app.locator.dart';
import 'package:my_message/core/result.dart';
import 'package:my_message/core/state_status.dart';
import 'package:my_message/domain/entities/member_entity.dart';
import 'package:my_message/domain/vo/search_member_vo.dart';
import 'package:my_message/domain/vo/searched_members_vo.dart';
import 'package:my_message/repositories/auth_repository.dart';
import 'package:my_message/repositories/user_repository.dart';
import 'package:my_message/services/dto/search_member.dto.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'people_view.form.dart';

class PeopleViewModel extends FormViewModel {
  final _userRepository = locator<UserRepository>();
  final _authRepository = locator<AuthRepository>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _scrollController = ScrollController();

  StateStatus _stateStatus = StateStatus.initial;
  StateStatus _paginationStatus = StateStatus.initial;

  User? _authUser;
  SearchedMembersVo? _searchedMembersVo;
  List<MemberEntity> _searchedMembers = [];

  List<MemberEntity> get searchedMembers => _searchedMembers;
  StateStatus get stateStatus => _stateStatus;
  StateStatus get paginationStatus => _paginationStatus;
  NavigationService get navigationService => _navigationService;
  ScrollController get scrollController => _scrollController;

  Future<void> getAuthUser() async {
    final result = await _authRepository.getLoggedInUser();

    if (result is Ok<User?> && result.value != null) {
      _authUser = result.value;
    }
  }

  void scrollListener() async {
    final max = _scrollController.position.maxScrollExtent;
    final offset = _scrollController.offset;
    const loadingOffset = 20;

    if (max - offset < loadingOffset &&
        _paginationStatus != StateStatus.loading &&
        _searchedMembers.length >= 20) {
      await searchMembers(paginationStatus: StateStatus.loading);
    }
  }

  Future<void> searchMembers(
      {StateStatus? stateStatus,
      StateStatus? paginationStatus,
      bool? newList}) async {
    final dto = SearchMemberDto(
      authUserId: _authUser?.uid,
      q: searchInputValue ?? '',
      lastVisible: newList ?? false ? null : _searchedMembersVo?.lastVisible,
    );

    final voOrError = SearchMemberVo.create(dto);

    if (voOrError is Error<SearchMemberVo>) {
      _dialogService.showDialog(
        title: 'Failed To Create Value Object',
        description: voOrError.error.toString(),
      );
      return;
    }

    final vo = (voOrError as Ok<SearchMemberVo>).value;

    _stateStatus = stateStatus ?? StateStatus.loaded;
    _paginationStatus = paginationStatus ?? StateStatus.loaded;
    rebuildUi();

    final result = await _userRepository.searchMembers(vo);

    _stateStatus = StateStatus.loaded;
    _paginationStatus = StateStatus.loaded;
    rebuildUi();

    if (result is Error<SearchedMembersVo>) {
      _dialogService.showDialog(
          title: 'Failed To Get Members', description: result.error.toString());
      return;
    }
    _searchedMembersVo = (result as Ok<SearchedMembersVo>).value;
    if (newList ?? false) {
      _searchedMembers = _searchedMembersVo?.members ?? [];
    } else {
      final newMembers = _searchedMembersVo?.members
              .where((x) =>
                  !_searchedMembers.map((e) => e.userId).contains(x.userId))
              .toList() ??
          [];
      _searchedMembers.addAll(newMembers);
    }

    rebuildUi();
  }
}
