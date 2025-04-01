import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.enabled,
    this.controller,
    this.labelText,
    this.obscureText,
    this.validator,
  });

  final bool? enabled;
  final TextEditingController? controller;
  final String? labelText;
  final bool? obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        fillColor: Colors.purple[50],
        filled: true,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.purple),
        ),
      ),
    );
  }
}
