import 'package:flutter/material.dart';

class TextFormGlobal extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType? formType;

  const TextFormGlobal({
    super.key,
    required this.hintText,
    this.formType,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final isPassword = formType == TextInputType.visiblePassword ? true : false;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 7),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: formType,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
