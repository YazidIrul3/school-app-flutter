class ScheduleResponse {
  final id;
  final start_time;
  final end_time;
  final String? day;
  final lesson_id;

  ScheduleResponse({
    this.id,
    this.start_time,
    this.end_time,
    this.day,
    this.lesson_id,
  });

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      ScheduleResponse(
        id: json['id'],
        start_time: json['start_time'],
        end_time: json['end_time'],
        day: json['day'],
        lesson_id: json['lesson_id'],
      );
}
