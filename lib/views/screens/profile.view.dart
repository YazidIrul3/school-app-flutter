import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/login/login.event.dart';
import 'package:flutter_application_1/utils/global.session.dart';
import 'package:flutter_application_1/views/screens/main.view.dart';
import 'package:flutter_application_1/views/widgets/bottom-navigation.global.dart';
import 'package:flutter_application_1/views/widgets/header.global.dart';
import 'package:flutter_application_1/views/widgets/login-btn.global.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final token = GlobalSession().getAccessToken();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: HeaderGlobal(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: token == null || token == ''
            ? LoginButtonGlobal()
            : Column(
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
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              final globalSession = GlobalSession();
                              globalSession.removeAccessToken();

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainView(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.red,
                            ),

                            child: Text(
                              'Logout',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
