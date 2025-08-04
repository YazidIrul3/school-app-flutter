import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/components/card/schedule-card.component.dart';
import 'package:flutter_application_1/views/widgets/bottom-navigation.global.dart';
import 'package:flutter_application_1/views/widgets/header.global.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: HeaderGlobal(),
      body: Scrollbar(
        thumbVisibility: true,
        child: Column(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(20),
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: [
                  ScheduleCardComponent(),
                  ScheduleCardComponent(),
                  ScheduleCardComponent(),
                  ScheduleCardComponent(),
                  ScheduleCardComponent(),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationGlobal(),
    );
  }
}
