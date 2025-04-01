import 'package:flutter/material.dart';

class ChatItemWidget extends StatelessWidget {
  const ChatItemWidget({
    super.key,
    this.name,
    this.message,
    this.time,
    this.color,
    this.unread,
    this.onTap,
  });

  final String? name;
  final String? message;
  final String? time;
  final Color? color;
  final bool? unread;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final nameList = name?.split(' ') ?? [];
    final initial = nameList.isNotEmpty ? nameList[0][0] : '';

    return ListTile(
      onTap: onTap,
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(80),
        ),
        alignment: Alignment.center,
        child: Text(
          initial.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      title: Text(
        name ?? '',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: unread ?? false ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      subtitle: Text(
        message ?? '',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: unread ?? false ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
      trailing: Text(time ?? ''),
    );
  }
}
