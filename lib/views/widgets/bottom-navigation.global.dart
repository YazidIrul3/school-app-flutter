import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global.colors.dart';
import 'package:flutter_application_1/views/screens/home.view.dart';
import 'package:flutter_application_1/views/screens/news.view.dart';
import 'package:flutter_application_1/views/screens/profile.view.dart';
import 'package:flutter_application_1/views/screens/schedule.view.dart';

class BottomNavigationGlobal extends StatefulWidget {
  final int myIndex;
  const BottomNavigationGlobal({super.key, required this.myIndex});

  @override
  State<BottomNavigationGlobal> createState() => _BottomNavigationGlobalState();
}

class _BottomNavigationGlobalState extends State<BottomNavigationGlobal> {
  late int myIndex = 0;
  void initState() {
    super.initState();
    myIndex = widget.myIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          myIndex = index;
        });
      },
      currentIndex: myIndex,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
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
