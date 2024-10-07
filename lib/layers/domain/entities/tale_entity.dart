import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/layers/domain/entities/user_entity.dart';

part 'generated/tale_entity.freezed.dart';

@freezed
class TaleEntity with _$TaleEntity {
  const factory TaleEntity(
      {int? id,
      String? title,
      String? description,
      String? thumbnail,
      UserEntity? createdBy,
      String? categoryName,
      double? latitude,
      double? longitude,
      required int followers,
      DateTime? created_at,
      double? distance}) = _TaleEntity;
}
