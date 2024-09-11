import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/paginated_response.freezed.dart';

@Freezed(toJson: false)
class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse(
      {Pagination? pagination, required T results}) = _PaginatedResponse;

  const PaginatedResponse._();

  factory PaginatedResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) resultsFromJson) {
    return PaginatedResponse(
        pagination: Pagination.fromJson(json["pagination"]),
        results: resultsFromJson(json["results"]));
  }
}

@Freezed(toJson: false)
class Pagination with _$Pagination {
  const factory Pagination({
    String? next,
  }) = _Pagination;

  const Pagination._();

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
