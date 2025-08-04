import 'dart:async';

import 'package:flutter_application_1/views/screens/home.view.dart';
import 'package:flutter_application_1/views/screens/main.view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global.colors.dart';
import 'package:flutter_application_1/views/screens/login.view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      try {
        Get.to(() => MianView()); // bisa diganti LoginView dulu untuk uji coba
      } catch (e) {
        print("ERROR NAVIGASI: $e");
      }
    });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: Center(
        child: Text(
          'Logo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
