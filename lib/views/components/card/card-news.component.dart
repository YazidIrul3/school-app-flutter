import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global.colors.dart';

class CardNewsComponent extends StatelessWidget {
  const CardNewsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
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
            'Telah Bergabung Dokter Sub Spesialis bedah digestif',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,

              fontSize: 17,
            ),
          ),
          Text(
            'Admin',
            style: TextStyle(
              color: GlobalColors.mainColor,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),

          Text(
            '09 Juni 2005',
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
