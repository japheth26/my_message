import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dto.freezed.dart';
part 'message_dto.g.dart';

@freezed
class MessageDto with _$MessageDto {
  factory MessageDto({
    String? docId,
    String? roomId,
    String? message,
    Map<String, bool>? members,
    String? addedBy,
    String? addedAt,
  }) = _MessageDto;

  const MessageDto._();

  factory MessageDto.fromJson(Map<String, dynamic> json) =>
      _$MessageDtoFromJson(json);
}
