class UserResponse {
  final int? id;
  final String? username;
  final String? role;
  final String? created_at;

  UserResponse({this.username, this.id, this.role, this.created_at});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'] ?? 0,
      username: json['username'] ?? '-',
      role: json['role'] ?? '',
      created_at: json['created_at'] ?? '',
    );
  }
}
