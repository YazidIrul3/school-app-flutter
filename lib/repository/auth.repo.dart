import 'package:flutter_application_1/.services/api.service.dart';
import 'package:flutter_application_1/requests/login.request.dart';
import 'package:flutter_application_1/responses/login.response.dart';

class AuthRepo {
  final api = APIService();

  Future<LoginResponse> login(LoginRequest requestBody) {
    return api.post(
      'user/login',
      data: requestBody.toJson(),
      fromJson: (json) => LoginResponse.fromJson(json),
    );
  }
}
