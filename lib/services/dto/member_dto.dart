import 'package:freezed_annotation/freezed_annotation.dart';

part 'member_dto.freezed.dart';
part 'member_dto.g.dart';

@freezed
class MemberDto with _$MemberDto {
  factory MemberDto(
      {String? userId,
      String? fullName,
      String? email,
      int? colorValue}) = _MemberDto;

  const MemberDto._();

  factory MemberDto.fromJson(Map<String, dynamic> json) =>
      _$MemberDtoFromJson(json);
}
