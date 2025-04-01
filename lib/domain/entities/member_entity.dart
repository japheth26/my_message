import 'package:equatable/equatable.dart';
import 'package:my_message/core/result.dart';
import 'package:my_message/services/dto/member_dto.dart';
import 'package:my_message/ui/common/guard_validator/guard.dart';

class MemberEntity extends Equatable {
  final String userId;
  final String fullName;
  final String email;
  final int? colorValue;

  const MemberEntity({
    required this.userId,
    required this.fullName,
    required this.email,
    this.colorValue,
  });

  @override
  List<Object?> get props => [userId, fullName, email, colorValue];

  static Result<MemberEntity> create(MemberDto dto) {
    final guardResult = Guard.combine([
      Guard.againstEmptyString('User ID', dto.userId),
      Guard.againstEmptyString('Full Name', dto.fullName),
      Guard.againstInvalidEmail('Email', dto.email),
    ]);

    if (guardResult != null) {
      return Result.error(Exception(guardResult));
    }

    final data = MemberEntity(
      userId: dto.userId!,
      fullName: dto.fullName!,
      email: dto.email!,
      colorValue: dto.colorValue,
    );

    return Result.ok(data);
  }
}
