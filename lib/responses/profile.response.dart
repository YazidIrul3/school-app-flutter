import 'package:flutter_application_1/responses/user.response.dart';

class ProfileResponse {
  final UserResponse? data;
  final bool? success;
  final bool? error;
  final String? message;

  ProfileResponse({this.data, this.success, this.error, this.message});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      data: json['data'] != null ? UserResponse.fromJson(json['data']) : null,
      success: json['success'],
      message: json['message'],
      error: json['error'],
    );
  }
}
