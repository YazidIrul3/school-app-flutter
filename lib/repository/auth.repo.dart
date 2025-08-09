import 'package:flutter_application_1/.services/api.service.dart';
import 'package:flutter_application_1/requests/login.request.dart';
import 'package:flutter_application_1/responses/login.response.dart';
import 'package:flutter_application_1/responses/profile.response.dart';
import 'package:flutter_application_1/responses/user.response.dart';

class AuthRepo {
  final api = APIService();

  Future<LoginResponse> login(LoginRequest requestBody) {
    return api.post(
      'user/login',
      data: requestBody.toJson(),
      fromJson: (json) => LoginResponse.fromJson(json),
    );
  }

  Future<ProfileResponse> getProfile(String token) {
    return api.getAuth(
      'user/profile',
      fromJson: (json) => ProfileResponse.fromJson(json),
      token: token,
    );
  }
}
