import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:logger/logger.dart';
import 'package:my_message/app/app.locator.dart';
import 'package:my_message/app/app.logger.dart';
import 'package:my_message/core/result.dart';
import 'package:my_message/domain/vo/login_vo.dart';
import 'package:my_message/domain/vo/sign_up_vo.dart';
import 'package:my_message/services/auth_service.dart';
import 'package:my_message/services/user_service.dart';

class AuthRepository {
  late AuthService _authService;
  late UserService _userService;
  late InternetConnection _internetConnection;
  late Logger _logger;

  AuthRepository() {
    _authService = locator<AuthService>();
    _userService = locator<UserService>();
    _internetConnection = InternetConnection();
    _logger = getLogger('AuthRepository');
  }

  Future<Result<User>> signUp(SignUpVo vo) async {
    try {
      if (!await _internetConnection.hasInternetAccess) {
        return Result.error(Exception('No internet connection'));
      }

      final user = await _authService.signUp(vo);
      await _userService.saveUser(user.uid, vo);

      return Result.ok(user);
    } catch (e) {
      _logger.e(e.toString());
      return Result.error(e is Exception ? e : Exception(e));
    }
  }

  Future<Result<User>> login(LoginVo vo) async {
    try {
      if (!await _internetConnection.hasInternetAccess) {
        return Result.error(Exception('No internet connection'));
      }

      final userCredential = await _authService.login(vo);
      return Result.ok(userCredential);
    } catch (e) {
      _logger.e(e.toString());
      return Result.error(e is Exception ? e : Exception(e));
    }
  }

  Future<Result<Unit>> logout() async {
    try {
      if (!await _internetConnection.hasInternetAccess) {
        return Result.error(Exception('No internet connection'));
      }

      final result = await _authService.logout();
      return Result.ok(result);
    } catch (e) {
      _logger.e(e.toString());
      return Result.error(e is Exception ? e : Exception(e));
    }
  }

  Future<Result<User?>> getLoggedInUser() async {
    try {
      if (!await _internetConnection.hasInternetAccess) {
        return Result.error(Exception('No internet connection'));
      }

      final user = _authService.getLoggedInUser();
      return Result.ok(user);
    } catch (e) {
      _logger.e(e.toString());
      return Result.error(e is Exception ? e : Exception(e));
    }
  }
}
