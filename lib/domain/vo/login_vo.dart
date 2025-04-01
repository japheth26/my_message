import 'package:equatable/equatable.dart';
import 'package:my_message/core/result.dart';
import 'package:my_message/services/dto/login_dto.dart';
import 'package:my_message/ui/common/guard_validator/guard.dart';

class LoginVo extends Equatable {
  final String email;
  final String password;

  const LoginVo({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];

  static Result<LoginVo> create(LoginDto dto) {
    final guardResult = Guard.combine([
      Guard.againstInvalidEmail('Email', dto.email),
      Guard.againstInvalidPassword('Password', dto.password),
    ]);

    if (guardResult != null) {
      return Result.error(Exception(guardResult));
    }

    final data = LoginVo(email: dto.email!, password: dto.password!);

    return Result.ok(data);
  }
}
