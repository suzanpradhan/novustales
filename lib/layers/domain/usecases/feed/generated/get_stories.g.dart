// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../get_stories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchStoryParamsImpl _$$SearchStoryParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchStoryParamsImpl(
      search: json['search'] as String?,
      categoryNameIn: (json['category__name__in'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$SearchStoryParamsImplToJson(
        _$SearchStoryParamsImpl instance) =>
    <String, dynamic>{
      'search': instance.search,
      'category__name__in': instance.categoryNameIn,
    };
