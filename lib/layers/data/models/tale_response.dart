import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/layers/domain/entities/tale_entity.dart';

import 'user_model.dart';

part 'generated/tale_response.freezed.dart';
part 'generated/tale_response.g.dart';

@Freezed(toJson: false)
class TaleResponse with _$TaleResponse {
  const factory TaleResponse({
    int? id,
    String? title,
    String? description,
    @JsonKey(name: "thumbnail_url") String? thumbnail,
    @JsonKey(name: "category_name") String? categoryName,
    @JsonKey(name: "latitude") double? latitude,
    @Default(0) int followers,
    @MapToUserModelConverter()
    @JsonKey(name: "created_by")
    UserModel? createdBy,
    @JsonKey(name: "longitude") double? longitude,
    String? created_at,
    double? distance,
  }) = _TaleResponse;

  const TaleResponse._();

  factory TaleResponse.fromJson(Map<String, dynamic> json) =>
      _$TaleResponseFromJson(json);

  TaleEntity toEntity() => TaleEntity(
      id: id,
      title: title,
      description: description,
      categoryName: categoryName,
      thumbnail: thumbnail,
      followers: followers,
      latitude: latitude,
      createdBy: createdBy?.toEntity(),
      created_at: created_at != null ? DateTime.parse(created_at!) : null,
      longitude: longitude,
      distance: distance);
}

class MapToUserModelConverter
    implements JsonConverter<UserModel, Map<String, dynamic>> {
  const MapToUserModelConverter();

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(UserModel object) {
    throw UnimplementedError();
  }
}
