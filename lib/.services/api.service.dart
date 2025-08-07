import 'package:dio/dio.dart';

class APIService {
  final baseURL = "http://10.0.2.2:8000/api"; // Ganti ini jika pakai emulator
  final dio = Dio();

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
