import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/category_entity.freezed.dart';

@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required int id,
    required String name,
    required String image,
  }) = _CategoryEntity;
}
