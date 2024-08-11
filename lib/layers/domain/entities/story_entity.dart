import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/story_entity.freezed.dart';

@freezed
class StoryEntity with _$StoryEntity {
  const factory StoryEntity({
    int? id,
    UserDetailsEntity? user_details,
    String? media_url,
    String? category,
    int? views,
    String? title,
    String? media,
    String? media_urls,
    String? blob_ref,
    double? latitude,
    double? longitude,
    String? name,
    String? country,
    String? state,
    String? city,
    String? county,
    DateTime? created_at,
    DateTime? updated_at,
  }) = _StoryEntity;
}

@freezed
class UserDetailsEntity with _$UserDetailsEntity {
  const factory UserDetailsEntity({
    @Default(0) int id,
    String? email,
    String? name,
    String? nick_name,
    String? avatar,
  }) = _UserDetailsEntity;
}
