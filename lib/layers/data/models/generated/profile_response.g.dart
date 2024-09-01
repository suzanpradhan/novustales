// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileResponseImpl _$$ProfileResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileResponseImpl(
      id: json['id'] as int,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      nickName: json['nick_name'] as String,
      avatar: json['avatar'] as String,
      bio: json['bio'] as String?,
      numberOfStories: json['number_of_stories'] as int? ?? 0,
      numberOfViews: json['number_of_views'] as int? ?? 0,
      stories: (json['stories'] as List<dynamic>)
          .map((e) => UserStory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

_$UserStoryImpl _$$UserStoryImplFromJson(Map<String, dynamic> json) =>
    _$UserStoryImpl(
      id: json['id'] as int,
      userDetails: StoryUserDetail.fromJson(
          json['user_details'] as Map<String, dynamic>),
      mediaUrl: json['media_url'] as String,
      category: json['category'] as String,
      views: json['views'] as int,
      title: json['title'] as String,
      media: json['media'] as String?,
      mediaUrls: json['media_urls'] as String,
      blobRef: json['blob_ref'] as String?,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      name: json['name'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      county: json['county'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
