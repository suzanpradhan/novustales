import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';

part 'generated/story_response.freezed.dart';
part 'generated/story_response.g.dart';

@Freezed(toJson: false)
class StoryResponse with _$StoryResponse {
  const factory StoryResponse({
    @Default(0) int id,
    required StoryUserDetail userDetails,
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
  }) = _StoryResponse;

  const StoryResponse._();

  factory StoryResponse.fromJson(Map<String, dynamic> json) =>
      _$StoryResponseFromJson(json);

  StoryEntity toEntity() => StoryEntity(
        id: id,
        userDetails: userDetails.toEntity(),
        mediaUrl: mediaUrl,
        category: category,
        views: views,
        title: title,
        mediaUrls: mediaUrls,
        latitude: latitude,
        longitude: longitude,
        name: name,
        country: country,
        state: state,
        city: city,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

@Freezed(toJson: false)
class StoryUserDetail with _$StoryUserDetail {
  const factory StoryUserDetail({
    required int id,
    required String email,
    required String name,
    String? nickName,
    required String avatar,
  }) = _StoryUserDetail;

  const StoryUserDetail._();

  factory StoryUserDetail.fromJson(Map<String, dynamic> json) =>
      _$StoryUserDetailFromJson(json);

  UserDetailsEntity toEntity() => UserDetailsEntity(
        email: email,
        name: name,
        nickName: nickName,
        avatar: avatar,
      );
}
