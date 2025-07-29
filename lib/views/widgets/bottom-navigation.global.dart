import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global.colors.dart';

class BottomNavigationGlobal extends StatelessWidget {
  const BottomNavigationGlobal({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Jadwal'),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box),
          label: 'Profile',
        ),
      ],
      selectedItemColor: GlobalColors.mainColor,
    );
  }
}
