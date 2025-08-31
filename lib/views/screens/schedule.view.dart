import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/schedule.repo.dart';
import 'package:flutter_application_1/responses/list.response.dart';
import 'package:flutter_application_1/responses/schedule.response.dart';
import 'package:flutter_application_1/views/components/card/card-school-schedule.component.dart';
import 'package:flutter_application_1/views/components/card/schedule-card.component.dart';
import 'package:get/get_utils/get_utils.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key});

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  final scheduleRepo = ScheduleRepo();
  String day = 'senin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: HeaderGlobal(),
      // bottomNavigationBar: BottomNavigationGlobal(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      day = 'senin';
                    }),
                    child: ScheduleCardComponent(
                      text: 'Senin',
                      day: day.capitalize.toString(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      day = 'selasa';
                    }),
                    child: ScheduleCardComponent(
                      text: 'Selasa',
                      day: day.capitalize.toString(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      day = 'rabu';
                    }),
                    child: ScheduleCardComponent(
                      text: 'Rabu',
                      day: day.capitalize.toString(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      day = 'kamis';
                    }),
                    child: ScheduleCardComponent(
                      text: 'Kamis',
                      day: day.capitalize.toString(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      day = 'jumat';
                    }),
                    child: ScheduleCardComponent(
                      text: 'Jumat',
                      day: day.capitalize.toString(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      day = 'sabtu';
                    }),
                    child: ScheduleCardComponent(
                      text: 'Sabtu',
                      day: day.capitalize.toString(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      day = 'minggu';
                    }),
                    child: ScheduleCardComponent(
                      text: 'Minggu',
                      day: day.capitalize.toString(),
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<ListResponse<ScheduleResponse>>(
              future: scheduleRepo.getShedules(day),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  debugPrint('NewsView Error: ${snapshot.error}');
                  return const Center(
                    child: Text('Terjadi kesalahan saat memuat berita'),
                  );
                }

                final data = snapshot.data;
                final scheduleList = data?.data ?? [];

                if (scheduleList.isEmpty) {
                  return const Center(child: Text('Tidak ada jadwal'));
                }

                return SingleChildScrollView(
                  child: Column(
                    spacing: 10,
                    children: scheduleList.map((item) {
                      return CardSchoolScheduleComponent(
                        day: item.day.toString(),
                        room: 'Ruang 47',
                        startTime: item.start_time,
                        endTime: item.end_time,
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
