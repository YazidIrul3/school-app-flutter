import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/login/login.bloc.dart';
import 'package:flutter_application_1/views/screens/main.view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => LoginBloc())],
      child: MaterialApp(
        title: 'FLutter',
        debugShowCheckedModeBanner: false,
        home: MainView(),
      ),
    );
  }
}
