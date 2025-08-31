import 'package:flutter/material.dart';

class ScheduleCardComponent extends StatelessWidget {
  final String text;
  final String day;
  const ScheduleCardComponent({
    super.key,
    required this.text,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: day == text ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      decoration: BoxDecoration(
        color: day == text ? Colors.black : Colors.white,
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
    );
  }
}
