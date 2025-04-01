import 'package:flutter/material.dart';

class LogoutButtonWidget extends StatelessWidget {
  const LogoutButtonWidget({
    super.key,
    this.loading,
    this.label,
    this.onPressed,
  });

  final bool? loading;
  final String? label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: loading ?? false ? null : onPressed,
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.red)),
        child: loading ?? false
            ? const CircularProgressIndicator()
            : Text(
                label ?? '',
                style: const TextStyle(color: Colors.white),
              ),
      ),
    );
  }
}
