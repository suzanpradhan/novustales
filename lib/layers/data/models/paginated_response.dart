import 'package:freezed_annotation/freezed_annotation.dart';

import 'pagination.dart';

part 'generated/paginated_response.freezed.dart';

@Freezed(toJson: false)
class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse(
      {Pagination? pagination, required List<T> results}) = _PaginatedResponse;

  const PaginatedResponse._();

  factory PaginatedResponse.fromJson(Map<String, dynamic> json,
      T Function(Map<String, dynamic>) resultsFromJson) {
    return PaginatedResponse(
        pagination: Pagination.fromJson(json["pagination"]),
        results: (json["results"] as List)
            .map((resultJson) => resultsFromJson(resultJson))
            .toList());
  }
}
