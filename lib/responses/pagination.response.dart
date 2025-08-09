
class PaginationResponse<T> {
  final List<T> data;
  final bool success;
  final String message;
  final bool error;
  final int? currentPage;
  final int? lastPage;
  final int? perPage;
  final int? totalPage;

  PaginationResponse({
    required this.data,
    required this.success,
    required this.message,
    required this.error,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.totalPage,
  });

  factory PaginationResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return PaginationResponse<T>(
      data: (json['data'] as List)
          .map((item) => fromJson(item as Map<String, dynamic>))
          .toList(),
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      error: json['error'] ?? false,
      currentPage: json['page']?['current_page'] ?? 1,
      lastPage: json['page']?['last_page'] ?? 1,
      perPage: json['page']?['per_page'] ?? 0,
      totalPage: json['page']?['total_page'] ?? 0,
    );
  }
}
