import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/screens/home.view.dart';
import 'package:flutter_application_1/views/screens/main.view.dart';
import 'package:flutter_application_1/views/screens/profile.view.dart';
import 'package:flutter_application_1/views/screens/schedule.view.dart';
import 'package:flutter_application_1/views/screens/splash.view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FLutter',
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
