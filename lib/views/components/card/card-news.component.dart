import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global.colors.dart';

class CardNewsComponent extends StatelessWidget {
  final String title;
  final String author;
  final String date;

  const CardNewsComponent({
    super.key,
    required this.title,
    required this.author,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            spreadRadius: 2,
            offset: Offset(2, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,

              fontSize: 17,
            ),
          ),
          Text(
            author,
            style: TextStyle(
              color: GlobalColors.mainColor,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),

          Text(
            date,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w100,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
