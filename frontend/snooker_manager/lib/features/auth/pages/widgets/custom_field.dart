import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final bool isPassword;
  const CustomField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      showCursor: true,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,

        hintStyle: const TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}
