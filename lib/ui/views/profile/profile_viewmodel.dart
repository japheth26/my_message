import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_message/app/app.router.dart';
import 'package:my_message/core/state_status.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../repositories/auth_repository.dart';
import 'package:my_message/core/result.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authRepository = locator<AuthRepository>();
  final _dialogService = locator<DialogService>();
  StateStatus _stateStatus = StateStatus.initial;
  User? _user;
  Color _profileBackgroundColor = Colors.deepOrange;

  StateStatus get stateStatus => _stateStatus;
  User? get user => _user;
  Color get profileBackgroundColor => _profileBackgroundColor;

  Future<void> logout() async {
    _stateStatus = StateStatus.loading;
    rebuildUi();

    final result = await _authRepository.logout();

    _stateStatus = StateStatus.loaded;
    rebuildUi();

    if (result is Error<Unit>) {
      _dialogService.showDialog(
        title: 'Failed To Logout',
        description: result.error.toString(),
      );
      return;
    }

    _navigationService.replaceWithLoginView();
  }

  Future<void> getCurrentUser() async {
    _stateStatus = StateStatus.loading;
    rebuildUi();

    final result = await _authRepository.getLoggedInUser();

    _stateStatus = StateStatus.loaded;
    rebuildUi();

    if (result is Error<User?>) {
      _dialogService
          .showDialog(
        title: 'Failed To Get User',
        description: result.error.toString(),
      )
          .then((_) {
        _navigationService.replaceWithLoginView();
      });
      return;
    }

    _user = (result as Ok<User?>).value;
    _getColor();
    rebuildUi();
  }

  void _getColor() {
    try {
      if (_user?.photoURL != null && _user!.photoURL!.contains('color_')) {
        _profileBackgroundColor =
            Color(int.parse(_user!.photoURL!.split('color_')[1]));
      }
    } catch (e) {
      //
    }
  }
}
