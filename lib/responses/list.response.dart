class ListResponse<T> {
  final List<T>? data;
  final bool? success;
  final String? message;
  final bool? error;

  ListResponse({this.data, this.success, this.message, this.error});

  factory ListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) => ListResponse<T>(
    data: (json['data'] as List)
        .map((item) => fromJson(item as Map<String, dynamic>))
        .toList(),
    success: json['success'],
    message: json['message'],
    error: json['error'],
  );
}
