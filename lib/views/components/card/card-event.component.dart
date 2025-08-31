import 'package:flutter/material.dart';

class CardEventComponent extends StatelessWidget {
  const CardEventComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 7,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ), // space inside
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.2), // background color
                  borderRadius: BorderRadius.circular(12), // rounded corners
                ),
                child: Text(
                  'Pentas',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),

              Text(
                'PR Matamatika',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 3),

              Text(
                '22 Januari 2025',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Row(
            spacing: 4,
            children: [
              Icon(Icons.calendar_today, color: Colors.blue, size: 20),
              Text(
                '20:00 - 22:00',
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.6),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Row(
            spacing: 4,
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 20),
              Text(
                'Obade',
                style: TextStyle(
                  color: Colors.black.withValues(alpha: 0.6),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
