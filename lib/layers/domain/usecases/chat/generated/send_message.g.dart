// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../send_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendMessageParamsImpl _$$SendMessageParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SendMessageParamsImpl(
      senderId: json['profile_id'] as String,
      roomId: json['room_id'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$$SendMessageParamsImplToJson(
        _$SendMessageParamsImpl instance) =>
    <String, dynamic>{
      'profile_id': instance.senderId,
      'room_id': instance.roomId,
      'content': instance.content,
    };
