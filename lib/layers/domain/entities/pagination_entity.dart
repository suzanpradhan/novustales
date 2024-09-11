import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/pagination_entity.freezed.dart';

@freezed
class PaginationEntity<T> with _$PaginationEntity<T> {
  const factory PaginationEntity({
    List<T>? results,
    bool? nextPage,
  }) = _PaginationEntity<T>;
}
