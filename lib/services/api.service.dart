import 'package:dio/dio.dart';
import 'package:flutter_application_1/responses/list.response.dart';
import 'package:flutter_application_1/responses/pagination.response.dart';

class APIService {
  final baseURL = "http://127.0.0.1:8000/api"; // Ganti ini jika pakai emulator
  final dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 60 * 1000),
      receiveTimeout: Duration(seconds: 60 * 1000),
    ),
  );

  Future<ListResponse<T>> getList<T>(
    String url, {
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await dio.get(
        '$baseURL/$url',
        options: Options(
          headers: {
            'x-api-key':
                r'fdkjafkljdkj\dfw4$fd22!dfadsjkfjdslkj%fdaklfjdjfa!dfasdfjdjs',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final body = response.data as Map<String, dynamic>;
        return ListResponse.fromJson(body, fromJson);
      } else {
        throw Exception(
          'HTTP ${response.statusCode}: ${response.statusMessage}',
        );
      }
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  Future<PaginationResponse<T>> getPaginatedList<T>(
    String url, {
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await dio.get(
        '$baseURL/$url',
        options: Options(
          responseType: ResponseType.json,
          method: "GET",
          headers: {
            'x-api-key':
                r'fdkjafkljdkj\dfw4$fd22!dfadsjkfjdslkj%fdaklfjdjfa!dfasdfjdjs',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final body = response.data as Map<String, dynamic>;
        return PaginationResponse.fromJson(body, fromJson);
      } else {
        throw Exception(
          'HTTP ${response.statusCode}: ${response.statusMessage}',
        );
      }
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  Future<T> post<T>(
    String url, {
    Map<String, dynamic>? data,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await dio.post(
        '$baseURL/$url',
        data: data,
        options: Options(
          headers: {
            'x-api-key':
                r'fdkjafkljdkj\dfw4$fd22!dfadsjkfjdslkj%fdaklfjdjfa!dfasdfjdjs',
            'Accept': 'application/json',
          },
        ),
      );
      return fromJson(response.data);
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  Future<T> get<T>(
    String url, {
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await dio.get(
        '$baseURL/$url',
        options: Options(
          responseType: ResponseType.json,
          method: "GET",
          headers: {
            'x-api-key':
                r'fdkjafkljdkj\dfw4$fd22!dfadsjkfjdslkj%fdaklfjdjfa!dfasdfjdjs',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return fromJson(response.data);
      } else {
        throw Exception(
          'HTTP ${response.statusCode}: ${response.statusMessage}',
        );
      }
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  Future<T> getAuth<T>(
    String url, {
    required T Function(Map<String, dynamic>) fromJson,
    required String token,
  }) async {
    try {
      final response = await dio.get(
        '$baseURL/$url',
        options: Options(
          responseType: ResponseType.json,
          method: "GET",
          headers: {
            'x-api-key':
                r'fdkjafkljdkj\dfw4$fd22!dfadsjkfjdslkj%fdaklfjdjfa!dfasdfjdjs',
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );

      print('response $response');

      if (response.statusCode == 200) {
        return fromJson(response.data);
      } else if (response.statusCode == 401) {
        throw Exception('Unathorization');
      } else {
        throw Exception(
          'HTTP ${response.statusCode}: ${response.statusMessage}',
        );
      }
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }
}
