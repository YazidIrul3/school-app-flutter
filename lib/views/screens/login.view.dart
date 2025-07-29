import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/global.colors.dart';
import 'package:flutter_application_1/views/screens/home.view.dart';
import 'package:flutter_application_1/views/widgets/button.global.dart';
import 'package:flutter_application_1/views/widgets/text.form.global.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        "Logo",
                        style: TextStyle(
                          color: GlobalColors.mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                SizedBox(
                  child: Text(
                    "Login to Your Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Column(
                  spacing: 15,
                  children: [
                    TextFormGlobal(
                      hintText: 'Username',
                      formType: TextInputType.text,
                    ),
                    TextFormGlobal(
                      hintText: 'Password',
                      formType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 5),
                    ButtonGlobal(
                      text: 'Login',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeView()),
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 4,
                    children: [
                      Text(
                        "Belum Punya Akun ?",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),

                      Text(
                        "Register Sekarang",
                        style: TextStyle(
                          color: GlobalColors.mainColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
