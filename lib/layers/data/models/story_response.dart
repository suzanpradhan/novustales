import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';

import '../../../core/api/api_paths.dart';

part 'generated/story_response.freezed.dart';
part 'generated/story_response.g.dart';

@Freezed(toJson: false)
class StoryResponse with _$StoryResponse {
  const factory StoryResponse({
    int? id,
    @JsonKey(name: 'user_details') StoryUserDetail? userDetails,
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
  }) = _StoryResponse;

  const StoryResponse._();

  factory StoryResponse.fromJson(Map<String, dynamic> json) => _$StoryResponseFromJson(json);

  StoryEntity toEntity() => StoryEntity(
        id: id,
        userDetails: userDetails!.toEntity(),
        mediaUrls: mediaUrls,
        category: category,
        views: views,
        title: title,
        mediaUrl: mediaUrl,
        media: media,
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
    int? id,
    String? email,
    String? name,
    @JsonKey(name: 'nick_name') String? nickName,
    String? avatar,
  }) = _StoryUserDetail;

  const StoryUserDetail._();

  factory StoryUserDetail.fromJson(Map<String, dynamic> json) => _$StoryUserDetailFromJson(json);

  UserDetailsEntity toEntity() => UserDetailsEntity(
        email: email,
        name: name,
        nickName: nickName,
        avatar: ApiPaths.baseUrl + avatar!,
      );
}
