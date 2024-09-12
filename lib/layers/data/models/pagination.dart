import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/pagination.freezed.dart';
part 'generated/pagination.g.dart';

@Freezed(toJson: false)
class Pagination with _$Pagination {
  const factory Pagination({
    String? next,
  }) = _Pagination;

  const Pagination._();

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
