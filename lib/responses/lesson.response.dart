import 'dart:convert';

class LessonResponse {
  final String? name;

  LessonResponse({this.name});

  factory LessonResponse.fromJson(Map<String, dynamic> json) =>
      LessonResponse(name: json['name']);
}
