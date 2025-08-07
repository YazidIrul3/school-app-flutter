import 'package:flutter_application_1/requests/login.request.dart';

abstract class LoginEvent {}

class LoginSubmitted extends LoginEvent {
  final LoginRequest requestBody;

  LoginSubmitted(this.requestBody);
}
