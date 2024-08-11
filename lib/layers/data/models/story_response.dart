import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';
import 'package:storyv2/old/screens/premium/constants/api_paths.dart';

part 'generated/story_response.freezed.dart';
part 'generated/story_response.g.dart';

@Freezed(toJson: false)
class StoryResponse with _$StoryResponse {
  const factory StoryResponse({
    int? id,
    StoryUserDetail? user_details,
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
  }) = _StoryResponse;

  const StoryResponse._();

  factory StoryResponse.fromJson(Map<String, dynamic> json) =>
      _$StoryResponseFromJson(json);

  StoryEntity toEntity() => StoryEntity(
        id: id,
        user_details: user_details!.toEntity(),
        media_urls: media_urls,
        category: category,
        views: views,
        title: title,
        media_url: media_url,
        media: media,
        latitude: latitude,
        longitude: longitude,
        name: name,
        country: country,
        state: state,
        city: city,
        created_at: created_at,
        updated_at: updated_at,
      );
}

@Freezed(toJson: false)
class StoryUserDetail with _$StoryUserDetail {
  const factory StoryUserDetail({
    int? id,
    String? email,
    String? name,
    String? nick_name,
    String? avatar,
  }) = _StoryUserDetail;

  const StoryUserDetail._();

  factory StoryUserDetail.fromJson(Map<String, dynamic> json) =>
      _$StoryUserDetailFromJson(json);

  UserDetailsEntity toEntity() => UserDetailsEntity(
        email: email,
        name: name,
        nick_name: nick_name,
        avatar: baseUrl + avatar!,
      );
}
