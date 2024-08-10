import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/story_entity.freezed.dart';

@freezed
class StoryEntity with _$StoryEntity {
  const factory StoryEntity({
    @Default(0) int id,
    required UserDetailsEntity userDetails,
    required String mediaUrl,
    required String category,
    required int views,
    required String title,
    String? media,
    required String mediaUrls,
    String? blobRef,
    required double latitude,
    required double longitude,
    required String name,
    required String country,
    required String state,
    required String city,
    String? county,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _StoryEntity;
}

@freezed
class UserDetailsEntity with _$UserDetailsEntity {
  const factory UserDetailsEntity({
    @Default(0) int id,
    required String email,
    required String name,
    String? nickName,
    required String avatar,
  }) = _UserDetailsEntity;
}
