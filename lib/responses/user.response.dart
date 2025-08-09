class UserResponse {
  final int? id;
  final String? username;
  final String? role;
  final String? createdAt;

  UserResponse({this.username, this.id, this.role, this.createdAt});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'] ?? 0,
      username: json['username'] ?? '-',
      role: json['role'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
