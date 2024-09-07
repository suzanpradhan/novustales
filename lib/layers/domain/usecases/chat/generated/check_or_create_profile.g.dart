// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../check_or_create_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckOrCreateProfileParamsImpl _$$CheckOrCreateProfileParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckOrCreateProfileParamsImpl(
      uuid: json['uuid'] as String,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$CheckOrCreateProfileParamsImplToJson(
        _$CheckOrCreateProfileParamsImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'avatar': instance.avatar,
      'name': instance.name,
      'email': instance.email,
    };
