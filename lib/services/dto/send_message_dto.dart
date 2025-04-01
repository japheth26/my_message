class SendMessageDto {
  final String? roomId;
  final String? message;
  final Map<String, bool>? members;
  final String? addedBy;
  final DateTime? addedAt;

  SendMessageDto({
    this.roomId,
    this.message,
    this.members,
    this.addedBy,
    this.addedAt,
  });
}
