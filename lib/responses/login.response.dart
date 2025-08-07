class LoginResponse {
  final String? token;
  final String? message;
  final bool? success;
  final bool? error;

  LoginResponse({required this.token, this.message, this.error, this.success});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    token: json['token'],
    message: json['message'],
    success: json['success'],
    error: json['error'],
  );
}

class LoginErrorResponse {
  final String message;

  LoginErrorResponse(this.message);

  // Factory constructor untuk parsing JSON
  factory LoginErrorResponse.fromJson(Map<String, dynamic> json) {
    return LoginErrorResponse(json['errors']?['message'] ?? 'Unknown error');
  }

  @override
  String toString() => message;
}
