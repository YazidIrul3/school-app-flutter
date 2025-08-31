import 'package:flutter/material.dart';

class CardLessonComponent extends StatelessWidget {
  final String name;

  const CardLessonComponent({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            offset: Offset(1, 1),
            blurRadius: 4,
            spreadRadius: 0.3,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          // fontFamily: fontfami
        ),
      ),
    );
  }
}
