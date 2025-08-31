import 'package:flutter_application_1/responses/lesson.response.dart';
import 'package:flutter_application_1/responses/list.response.dart';
import 'package:flutter_application_1/services/api.service.dart';

class LessonRepo {
  final api = APIService();

  Future<ListResponse<LessonResponse>> getLessons() {
    return api.getList<LessonResponse>(
      'lesson',
      fromJson: (Map<String, dynamic> json) => LessonResponse.fromJson(json),
    );
  }
}
