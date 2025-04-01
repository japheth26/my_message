import 'package:flutter/material.dart';

class BrandWidget extends StatelessWidget {
  const BrandWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Connect',
          style: TextStyle(
              color: Colors.purple[800],
              fontWeight: FontWeight.w600,
              fontSize: 20),
        ),
        const Text(
          '&',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        Text(
          'Chat',
          style: TextStyle(
              color: Colors.purple[800],
              fontWeight: FontWeight.w600,
              fontSize: 20),
        )
      ],
    );
  }
}
