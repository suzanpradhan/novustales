// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../story_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryResponseImpl _$$StoryResponseImplFromJson(Map<String, dynamic> json) =>
    _$StoryResponseImpl(
      id: json['id'] as int? ?? 0,
      userDetails:
          StoryUserDetail.fromJson(json['userDetails'] as Map<String, dynamic>),
      mediaUrl: json['mediaUrl'] as String,
      category: json['category'] as String,
      views: json['views'] as int,
      title: json['title'] as String,
      media: json['media'] as String?,
      mediaUrls: json['mediaUrls'] as String,
      blobRef: json['blobRef'] as String?,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      name: json['name'] as String,
      country: json['country'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      county: json['county'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

_$StoryUserDetailImpl _$$StoryUserDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$StoryUserDetailImpl(
      id: json['id'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      nickName: json['nickName'] as String?,
      avatar: json['avatar'] as String,
    );
