import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/layers/domain/entities/tale_entity.dart';

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
    @JsonKey(name: "longitude") double? longitude,
    double? distance,
  }) = _TaleResponse;

  const TaleResponse._();

  factory TaleResponse.fromJson(Map<String, dynamic> json) => _$TaleResponseFromJson(json);

  TaleEntity toEntity() => TaleEntity(
      id: id,
      title: title,
      description: description,
      categoryName: categoryName,
      thumbnail: thumbnail,
      latitude: latitude,
      longitude: longitude,
      distance: distance);
}
