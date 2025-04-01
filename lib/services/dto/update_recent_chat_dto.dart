class UpdateRecentChatDto {
  final String? roomId;
  final String? message;
  final Map<String, bool>? members;
  final String? addedBy;
  final DateTime? addedAt;
  final Map<String, bool>? unread;
  final List<String>? userIds;

  UpdateRecentChatDto({
    this.roomId,
    this.message,
    this.members,
    this.addedBy,
    this.addedAt,
    this.unread,
    this.userIds,
  });
}
