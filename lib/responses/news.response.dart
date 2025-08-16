import 'package:flutter_application_1/responses/pagination.response.dart';
import 'package:flutter_application_1/responses/user.response.dart';

class NewsResponse {
  final int? id;
  final String? title;
  final String? image;
  final String? description;
  final String? date_published;
  final UserResponse? author;

  NewsResponse({
    this.title,
    this.id,
    this.image,
    this.description,
    this.date_published,
    this.author,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
      date_published: json['date_published'],
      author: json['author'] != null
          ? UserResponse.fromJson(json['author'])
          : null,
    );
  }
}

class NewsDetailResponse {
  final NewsResponse? data;
  final String? message;
  final bool? success;
  final bool? error;

  NewsDetailResponse({this.data, this.error, this.message, this.success});

  factory NewsDetailResponse.fromJson(Map<String, dynamic> json) {
    return NewsDetailResponse(
      data: json['data'] != null ? NewsResponse.fromJson(json['data']) : null,
      success: json['success'],
      error: json['error'],
      message: json['message'],
    );
  }
}
