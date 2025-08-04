import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widgets/bottom-navigation.global.dart';
import 'package:flutter_application_1/views/widgets/header.global.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: HeaderGlobal(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              spacing: 20,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey)],
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yazid Khairul',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Kelas 12 RPL 1'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationGlobal(),
    );
  }
}
