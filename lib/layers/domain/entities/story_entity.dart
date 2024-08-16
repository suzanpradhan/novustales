import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/story_entity.freezed.dart';

@freezed
class StoryEntity with _$StoryEntity {
  const factory StoryEntity({
    int? id,
    @JsonKey(name: 'user_details') UserDetailsEntity? userDetails,
    @JsonKey(name: 'media_url') String? mediaUrl,
    String? category,
    int? views,
    String? title,
    String? media,
    @JsonKey(name: 'media_urls') String? mediaUrls,
    @JsonKey(name: 'blob_ref') String? blobRef,
    double? latitude,
    double? longitude,
    String? name,
    String? country,
    String? state,
    String? city,
    String? county,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _StoryEntity;
}

@freezed
class UserDetailsEntity with _$UserDetailsEntity {
  const factory UserDetailsEntity({
    @Default(0) int id,
    String? email,
    String? name,
    @JsonKey(name: 'user_details') String? nickName,
    String? avatar,
  }) = _UserDetailsEntity;
}
