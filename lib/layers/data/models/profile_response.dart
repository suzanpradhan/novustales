import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/layers/data/models/story_response.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';

import '../../../core/api/api_paths.dart';
import '../../domain/entities/profile_entity.dart';

part 'generated/profile_response.freezed.dart';
part 'generated/profile_response.g.dart';

@Freezed(toJson: false)
class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse(
      {required int id,
      required String email,
      required String uuid,
      @JsonKey(name: 'first_name') required String firstName,
      @JsonKey(name: 'last_name') required String lastName,
      @JsonKey(name: 'nick_name') required String nickName,
      String? avatar,
      String? bio,
      @Default(0) int followers,
      @Default(0) int following,
      @JsonKey(name: 'number_of_stories') @Default(0) int numberOfStories,
      @JsonKey(name: 'number_of_views') @Default(0) int numberOfViews}) = _ProfileResponse;

  const ProfileResponse._();

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);

  ProfileEntity toEntity() => ProfileEntity(
        id: id,
        email: email,
        uuid: uuid,
        bio: bio,
        firstName: firstName,
        lastName: lastName,
        nickName: nickName,
        followers: followers,
        following: following,
        avatar: avatar,
        numberOfStories: numberOfStories,
        numberOfViews: numberOfViews,
      );
}

@Freezed(toJson: false)
class UserStory with _$UserStory {
  const factory UserStory({
    required int id,
    @JsonKey(name: 'user_details') required StoryUserDetail userDetails,
    @JsonKey(name: 'media_url') required String mediaUrl,
    required String category,
    required int views,
    required String title,
    String? media,
    @JsonKey(name: 'media_urls') required String mediaUrls,
    @JsonKey(name: 'blob_ref') String? blobRef,
    required double latitude,
    required double longitude,
    String? name,
    String? country,
    String? state,
    String? city,
    String? county,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _UserStory;

  const UserStory._();

  factory UserStory.fromJson(Map<String, dynamic> json) => _$UserStoryFromJson(json);

  StoryEntity toEntity() => StoryEntity(
        id: id,
        userDetails: userDetails.toEntity(),
        mediaUrl: mediaUrl,
        category: category,
        views: views,
        title: title,
        media: media!.contains(ApiPaths.baseUrl) ? media : ApiPaths.baseUrl + media!,
        mediaUrls: mediaUrls,
        blobRef: blobRef,
        latitude: latitude,
        longitude: longitude,
        name: name,
        country: country,
        state: state,
        city: city,
        county: county,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}
