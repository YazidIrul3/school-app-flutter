import 'package:flutter_application_1/responses/list.response.dart';
import 'package:flutter_application_1/responses/schedule.response.dart';
import 'package:flutter_application_1/services/api.service.dart';

class ScheduleRepo {
  final api = APIService();

  Future<ListResponse<ScheduleResponse>> getShedules(String day) {
    return api.getList(
      'schedule/$day',
      fromJson: (Map<String, dynamic> json) => ScheduleResponse.fromJson(json),
    );
  }
}
