import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';

part 'generated/profile_entity.freezed.dart';

@freezed
class ProfileEntity with _$ProfileEntity {
  const factory ProfileEntity({
    required int id,
    required String email,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'nick_name') required String nickName,
    required String avatar,
    @JsonKey(name: 'number_of_stories') @Default(0) int numberOfStories,
    @JsonKey(name: 'number_of_views') @Default(0) int numberOfViews,
    required List<StoryEntity> stories,
  }) = _ProfileEntity;
}
