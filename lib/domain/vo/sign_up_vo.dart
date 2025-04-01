import 'package:equatable/equatable.dart';
import 'package:my_message/core/result.dart';
import 'package:my_message/services/dto/sign_up_dto.dart';
import 'package:my_message/ui/common/guard_validator/guard.dart';

class SignUpVo extends Equatable {
  final String fullName;
  final String email;
  final String password;
  final int? colorValue;

  const SignUpVo(
      {required this.fullName,
      required this.email,
      required this.password,
      this.colorValue});

  @override
  List<Object?> get props => [fullName, email, password, colorValue];

  static Result<SignUpVo> create(SignUpDto dto) {
    final guardResult = Guard.combine([
      Guard.againstEmptyString('Full Name', dto.fullName),
      Guard.againstInvalidEmail('Email', dto.email),
      Guard.againstInvalidPassword('Password', dto.password),
    ]);

    if (guardResult != null) {
      return Result.error(Exception(guardResult));
    }

    final data = SignUpVo(
        fullName: dto.fullName!,
        email: dto.email!,
        password: dto.password!,
        colorValue: dto.colorValue);

    return Result.ok(data);
  }
}
