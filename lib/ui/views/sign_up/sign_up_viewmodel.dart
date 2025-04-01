import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_message/app/app.router.dart';
import 'package:my_message/core/state_status.dart';
import 'package:my_message/domain/vo/sign_up_vo.dart';
import 'package:my_message/repositories/auth_repository.dart';
import 'package:my_message/services/dto/sign_up_dto.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../app/app.locator.dart';
import 'sign_up_view.form.dart';
import '../../common/guard_validator/guard.dart';
import 'package:my_message/core/result.dart';

class SignUpViewModel extends FormViewModel {
  final _signUpFormKey = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();
  final _authRepository = locator<AuthRepository>();
  final _dialogService = locator<DialogService>();
  StateStatus _stateStatus = StateStatus.initial;

  GlobalKey<FormState> get signUpFormKey => _signUpFormKey;
  NavigationService get navigationService => _navigationService;
  StateStatus get stateStatus => _stateStatus;

  String? validateFullName(String? value) {
    return Guard.againstStringLength('Full Name', value, 3, 500);
  }

  String? validateEmail(String? value) {
    return Guard.againstInvalidEmail('Email', value);
  }

  String? validatePassword(String? value) {
    return Guard.againstInvalidPassword('Password', value);
  }

  String? validateConfirmPass(String? value) {
    return Guard.againstInvalidConfirmPassword(
        'Confirm Password', value, passwordInputValue, 'Password');
  }

  Future<void> signUp() async {
    if (_signUpFormKey.currentState!.validate()) {
      final colors = [
        Colors.blue.toARGB32(),
        Colors.red.toARGB32(),
        Colors.green.toARGB32(),
        Colors.amber.toARGB32(),
        Colors.brown.toARGB32(),
        Colors.deepOrange.toARGB32()
      ];

      final dto = SignUpDto(
          fullName: fullNameInputValue,
          email: emailInputValue,
          password: passwordInputValue,
          colorValue: colors[Random().nextInt(5)]);

      final voOrError = SignUpVo.create(dto);

      if (voOrError is Error<SignUpVo>) {
        _dialogService.showDialog(
          title: 'Invalid Input Data',
          description: voOrError.error.toString(),
        );
        return;
      }

      final vo = voOrError as Ok<SignUpVo>;

      _stateStatus = StateStatus.loading;
      rebuildUi();

      final result = await _authRepository.signUp(vo.value);

      _stateStatus = StateStatus.loaded;
      rebuildUi();

      if (result is Error<User>) {
        _dialogService.showDialog(
          title: 'Sign Up Failed',
          description: result.error.toString(),
        );
        return;
      }

      _navigationService.replaceWithHomeView();
    }
  }
}
