import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardSchoolScheduleComponent extends StatelessWidget {
  final String day;
  final String room;
  final startTime;
  final endTime;

  const CardSchoolScheduleComponent({
    super.key,
    required this.day,
    required this.endTime,
    required this.startTime,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      width: double.infinity,
      padding: EdgeInsets.all(20),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  '$startTime AM - $endTime AM',
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ), // space inside
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(
                      alpha: 0.2,
                    ), // background color
                    borderRadius: BorderRadius.circular(12), // rounded corners
                  ),
                  child: Text(
                    room,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Text(
            'Matamatika',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
