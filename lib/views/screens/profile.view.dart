import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/auth.repo.dart';
import 'package:flutter_application_1/responses/profile.response.dart';
import 'package:flutter_application_1/utils/global.session.dart';
import 'package:flutter_application_1/views/screens/main.view.dart';
import 'package:flutter_application_1/views/widgets/login-btn.global.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final token = GlobalSession().getAccessToken();
  final authRepo = AuthRepo();

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // hapus token/login data

    // replace halaman agar tidak bisa back
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainView()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ProfileResponse>(
        future: authRepo.getProfile(
          token.toString(),
        ), // pakai token dari GlobalSession
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            debugPrint('ProfileView Error: ${snapshot.error}');
            return const Center(
              child: Text('Terjadi kesalahan saat memuat profile'),
            );

            //  return const Padding(
            //   padding: EdgeInsetsGeometry.all(20),
            //   child: LoginButtonGlobal(),
            // );
          }

          final data = snapshot.data;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: token == null || token == '' || token == false
                ? const LoginButtonGlobal()
                : Column(
                    children: [
                      Row(
                        spacing: 20,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                              boxShadow: [BoxShadow(color: Colors.grey)],
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data?.data?.username.toString() ?? '',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text('Kelas 12 RPL 1'),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () => _logout(context),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text("Logout"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
