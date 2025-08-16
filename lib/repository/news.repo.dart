import 'dart:convert';

import 'package:flutter_application_1/responses/news.response.dart';
import 'package:flutter_application_1/responses/pagination.response.dart';
import 'package:flutter_application_1/services/api.service.dart';

class NewsRepo {
  final api = APIService();

  Future<PaginationResponse<NewsResponse>> getNews({int page = 1}) async {
    return api.getPaginatedList<NewsResponse>(
      'news?page=$page',
      fromJson: (Map<String, dynamic> json) => NewsResponse.fromJson(json),
    );
  }

  Future<NewsDetailResponse> getDetailNews({required id}) async {
    return api.get(
      'news/$id',
      fromJson: (json) => NewsDetailResponse.fromJson(json),
    );
  }
}
