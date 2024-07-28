// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../post_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterParamsImpl _$$RegisterParamsImplFromJson(Map<String, dynamic> json) =>
    _$RegisterParamsImpl(
      firstName: json['firstName'] as String? ?? "first_name",
      lastName: json['last_name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
    );

Map<String, dynamic> _$$RegisterParamsImplToJson(
        _$RegisterParamsImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'password': instance.password,
    };
