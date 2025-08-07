import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global.colors.dart';
import 'package:flutter_application_1/views/screens/home.view.dart';
import 'package:flutter_application_1/views/screens/news.view.dart';
import 'package:flutter_application_1/views/screens/profile.view.dart';
import 'package:flutter_application_1/views/screens/schedule.view.dart';
import 'package:flutter_application_1/views/widgets/header.global.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> _pages = [HomeView(), NewsView(), ScheduleView(), ProfileView()];
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderGlobal(),
      body: IndexedStack(
        index: myIndex,
        children: _pages,
        alignment: Alignment.center,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
