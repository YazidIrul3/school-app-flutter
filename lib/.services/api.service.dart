import 'package:dio/dio.dart';
import 'package:flutter_application_1/responses/pagination.response.dart';

class APIService {
  final baseURL = "http://127.0.0.1:8000/api"; // Ganti ini jika pakai emulator
  final dio = Dio(
    BaseOptions(
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
    ),
  );

  Future<List<T>> getList<T>(
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

      if (response.statusCode == 200) {
        final body = response.data;
        if (body is Map<String, dynamic> && body.containsKey('data')) {
          final List data = body['data'];
          return data.map((item) => fromJson(item)).toList();
        } else if (body is List) {
          // kalau endpoint memang langsung kirim array
          return body.map((item) => fromJson(item)).toList();
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception(
          'HTTP ${response.statusCode}: ${response.statusMessage}',
        );
      }
    } on DioError catch (e) {
      throw Exception('DioError: ${e.message}');
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
    } on DioError catch (e) {
      throw Exception('DioError: ${e.message}');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }

  Future<T> post<T>(
    String url, {
    required Map<String, dynamic> data,
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
    } on DioError catch (e) {
      final message = e.message;
      throw Exception('DioError: $message');
    } catch (e) {
      throw Exception('Unknown error: $e');
    }
  }
}
