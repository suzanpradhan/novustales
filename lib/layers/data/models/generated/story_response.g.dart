// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../story_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryResponseImpl _$$StoryResponseImplFromJson(Map<String, dynamic> json) =>
    _$StoryResponseImpl(
      id: json['id'] as int?,
      user_details: json['user_details'] == null
          ? null
          : StoryUserDetail.fromJson(
              json['user_details'] as Map<String, dynamic>),
      media_url: json['media_url'] as String?,
      category: json['category'] as String?,
      views: json['views'] as int?,
      title: json['title'] as String?,
      media: json['media'] as String?,
      media_urls: json['media_urls'] as String?,
      blob_ref: json['blob_ref'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      name: json['name'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      county: json['county'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

_$StoryUserDetailImpl _$$StoryUserDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$StoryUserDetailImpl(
      id: json['id'] as int?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      nick_name: json['nick_name'] as String?,
      avatar: json['avatar'] as String?,
    );
