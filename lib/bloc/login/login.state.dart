import 'package:flutter_application_1/responses/login.response.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;

  LoginSuccess(this.loginResponse);
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}
