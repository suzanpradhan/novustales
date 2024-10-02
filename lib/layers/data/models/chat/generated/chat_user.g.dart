// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../chat_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatUserImpl _$$ChatUserImplFromJson(Map<String, dynamic> json) =>
    _$ChatUserImpl(
      id: json['id'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );
