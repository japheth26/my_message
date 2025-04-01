import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_message/app/app.locator.dart';
import 'package:my_message/app/app.router.dart';
import 'package:my_message/core/state_status.dart';
import 'package:my_message/domain/vo/login_vo.dart';
import 'package:my_message/services/dto/login_dto.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../repositories/auth_repository.dart';
import '../../common/guard_validator/guard.dart';
import 'login_view.form.dart';
import 'package:my_message/core/result.dart';

class LoginViewModel extends FormViewModel {
  final _loginFormKey = GlobalKey<FormState>();
  final _navigationService = locator<NavigationService>();
  final _authRepository = locator<AuthRepository>();
  final _dialogService = locator<DialogService>();

  StateStatus _stateStatus = StateStatus.initial;

  GlobalKey<FormState> get loginFormKey => _loginFormKey;
  NavigationService get navigationService => _navigationService;
  StateStatus get stateStatus => _stateStatus;

  String? validateEmail(String? value) {
    return Guard.againstInvalidEmail('Email', value);
  }

  String? validatePassword(String? value) {
    return Guard.againstInvalidPassword('Password', value);
  }

  Future<void> submit() async {
    if (_loginFormKey.currentState!.validate()) {
      final dto = LoginDto(
        email: emailInputValue,
        password: passwordInputValue,
      );

      final voOrError = LoginVo.create(dto);

      if (voOrError is Error<LoginVo>) {
        _dialogService.showDialog(
          title: 'Invalid Input Data',
          description: voOrError.error.toString(),
        );
        return;
      }

      final vo = voOrError as Ok<LoginVo>;

      _stateStatus = StateStatus.loading;
      rebuildUi();

      final result = await _authRepository.login(vo.value);

      _stateStatus = StateStatus.loaded;
      rebuildUi();

      if (result is Error<User>) {
        _dialogService.showDialog(
          title: 'Login Failed',
          description: result.error.toString(),
        );
        return;
      }

      _navigationService.replaceWithHomeView();
    }
  }
}
