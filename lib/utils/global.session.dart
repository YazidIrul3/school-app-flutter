import 'package:shared_preferences/shared_preferences.dart';

class GlobalSession {
  Future<void> saveSession(String accessToken) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('token', accessToken);
  }

  Future<String> getAccessToken() async {
    final pref = await SharedPreferences.getInstance();
    final accessToken = pref.getString('token');

    print('token $accessToken');

    return accessToken ?? '';
  }

  Future<void> removeAccessToken() async {
    final pref = await SharedPreferences.getInstance();

    await pref.remove('token');
  }
}
