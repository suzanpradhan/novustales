// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../tale_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaleResponseImpl _$$TaleResponseImplFromJson(Map<String, dynamic> json) =>
    _$TaleResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      thumbnail: json['thumbnail_url'] as String?,
      categoryName: json['category_name'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      createdBy: _$JsonConverterFromJson<Map<String, dynamic>, UserModel>(
          json['created_by'], const MapToUserModelConverter().fromJson),
      longitude: (json['longitude'] as num?)?.toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
    );

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
