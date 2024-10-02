import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/category_entity.dart';

part 'generated/category_response.freezed.dart';
part 'generated/category_response.g.dart';

@Freezed(toJson: false)
class CategoryResponse with _$CategoryResponse {
  const factory CategoryResponse({
    int? id,
    String? name,
    String? image,
  }) = _CategoryResponse;

  const CategoryResponse._();

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  CategoryEntity toEntity() => CategoryEntity(
        id: id ?? 0,
        name: name ?? "",
        image: image ?? '',
      );
}
