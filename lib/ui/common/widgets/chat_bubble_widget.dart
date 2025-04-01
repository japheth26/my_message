import 'package:flutter/material.dart';

enum ChatStatus {
  sending,
  sent,
  error,
}

class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget({
    super.key,
    required this.id,
    this.isMe,
    this.name,
    this.message,
    this.chatStatus,
  });

  final String id;
  final bool? isMe;
  final String? name;
  final String? message;
  final ChatStatus? chatStatus;

  @override
  Widget build(BuildContext context) {
    if (isMe == true) {
      return _myMessage();
    } else if (isMe == false) {
      return _otherMessage();
    } else {
      return const SizedBox();
    }
  }

  Widget _otherMessage() {
    final nameList = name?.split(' ') ?? [];
    final initial = nameList.isNotEmpty ? nameList[0][0] : '';
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.red,
            child: Text(
              initial.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 250,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                message ?? '',
                style: TextStyle(color: Colors.purple[800]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _myMessage() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Flexible(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 250,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.purple[800],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                message ?? '',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 10),
          _status(),
        ],
      ),
    );
  }

  Widget _status() {
    if (chatStatus == null) {
      return const SizedBox();
    }

    switch (chatStatus!) {
      case ChatStatus.sending:
        return const SizedBox(
          height: 10,
          width: 10,
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        );
      case ChatStatus.sent:
        return const CircleAvatar(
          radius: 8,
          backgroundColor: Colors.green,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 10,
          ),
        );
      case ChatStatus.error:
        return const CircleAvatar(
          radius: 8,
          backgroundColor: Colors.red,
          child: Icon(
            Icons.close,
            color: Colors.white,
            size: 10,
          ),
        );
    }
  }
}
