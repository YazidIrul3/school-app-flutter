import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/login/login.bloc.dart';
import 'package:flutter_application_1/bloc/login/login.event.dart';
import 'package:flutter_application_1/bloc/login/login.state.dart';
import 'package:flutter_application_1/requests/login.request.dart';
import 'package:flutter_application_1/utils/global.colors.dart';
import 'package:flutter_application_1/views/screens/home.view.dart';
import 'package:flutter_application_1/views/screens/main.view.dart';
import 'package:flutter_application_1/views/widgets/button.global.dart';
import 'package:flutter_application_1/views/widgets/text.form.global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  

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
                      controller: usernameController,
                    ),
                    TextFormGlobal(
                      hintText: 'Password',
                      formType: TextInputType.visiblePassword,
                      controller: passwordController,
                    ),
                    const SizedBox(height: 5),

                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccess) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainView(),
                            ),
                          );
                        } else if (state is LoginFailure) {
                          print(state.message);
                          // show error dialog
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Login Gagal"),
                              content: Text(
                                state.message,
                              ), // error message dari backend
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("OK"),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return CircularProgressIndicator(
                            color: Colors.blueAccent,
                          );
                        }
                        return SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: ButtonGlobal(
                            text: 'Login',
                            onPressed: () {
                              final requestBody = LoginRequest(
                                username: usernameController.text,
                                password: passwordController.text,
                              );

                              context.read<LoginBloc>().add(
                                LoginSubmitted(requestBody),
                              );
                            },
                          ),
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
