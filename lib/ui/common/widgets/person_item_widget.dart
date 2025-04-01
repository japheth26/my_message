import 'package:flutter/material.dart';

class PersonItemWidget extends StatelessWidget {
  const PersonItemWidget({super.key, this.color, this.name, this.onTap});

  final Color? color;
  final String? name;
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
      ),
    );
  }
}
