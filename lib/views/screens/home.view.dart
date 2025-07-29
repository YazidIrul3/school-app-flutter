import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global.colors.dart';
import 'package:flutter_application_1/views/components/card-box.component.dart';
import 'package:flutter_application_1/views/widgets/bottom-navigation.global.dart';
import 'package:flutter_application_1/views/widgets/text.form.global.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 40,
                right: 20,
                left: 20,
                bottom: 30,
              ),
              decoration: BoxDecoration(
                color: GlobalColors.mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                spacing: 20,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Hello",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),

                          Text(
                            "Alex Cane",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextFormGlobal(hintText: 'search'),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Column(
                spacing: 15,
                children: [
                  Row(
                    children: [
                      Text(
                        "Features",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  GridView.count(
                    crossAxisCount: 2, // jumlah kolom
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    shrinkWrap: true,
                    physics:
                        NeverScrollableScrollPhysics(), // biar tidak scroll sendiri dalam scrollview
                    children: [
                      CardBoxComponent(
                        text: 'Tugas',
                        asset: 'schedule-icon.png',
                      ),
                      CardBoxComponent(
                        text: 'Jadwal',
                        asset: 'schedule-icon.png',
                      ),
                      CardBoxComponent(
                        text: 'Tugas',
                        asset: 'schedule-icon.png',
                      ),
                      CardBoxComponent(
                        text: 'Jadwal',
                        asset: 'schedule-icon.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationGlobal()
    );
  }
}
