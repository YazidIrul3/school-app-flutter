import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global.colors.dart';

class ButtonGlobal extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const ButtonGlobal({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: TextButton.styleFrom(
          backgroundColor: GlobalColors.mainColor,
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
