import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/story_entity.freezed.dart';

@freezed
class StoryEntity with _$StoryEntity {
  const factory StoryEntity({
    required int id,
    @JsonKey(name: 'user_details') required UserDetailsEntity userDetails,
    @JsonKey(name: 'media_url') required String mediaUrl,
    required String category,
    required int views,
    required String title,
    String? media,
    @JsonKey(name: 'media_urls') required String mediaUrls,
    @JsonKey(name: 'blob_ref') String? blobRef,
    required double latitude,
    required double longitude,
    required String name,
    required String country,
    required String state,
    required String city,
    String? county,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _StoryEntity;
}

@freezed
class UserDetailsEntity with _$UserDetailsEntity {
  const factory UserDetailsEntity({
    required int id,
    required String email,
    required String name,
    @JsonKey(name: 'nick_name') required String nickName,
    required String avatar,
  }) = _UserDetailsEntity;
}
