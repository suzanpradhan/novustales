import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/tale_entity.freezed.dart';

@freezed
class TaleEntity with _$TaleEntity {
  const factory TaleEntity(
      {int? id,
      String? title,
      String? description,
      String? thumbnail,
      String? categoryName,
      double? latitude,
      double? longitude,
      double? distance}) = _TaleEntity;
}
