import 'package:flutter/material.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({
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
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.purple[800])),
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
