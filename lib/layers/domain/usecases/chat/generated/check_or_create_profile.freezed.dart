// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../check_or_create_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckOrCreateProfileParams _$CheckOrCreateProfileParamsFromJson(
    Map<String, dynamic> json) {
  return _CheckOrCreateProfileParams.fromJson(json);
}

/// @nodoc
mixin _$CheckOrCreateProfileParams {
  String get uuid => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckOrCreateProfileParamsCopyWith<CheckOrCreateProfileParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckOrCreateProfileParamsCopyWith<$Res> {
  factory $CheckOrCreateProfileParamsCopyWith(CheckOrCreateProfileParams value,
          $Res Function(CheckOrCreateProfileParams) then) =
      _$CheckOrCreateProfileParamsCopyWithImpl<$Res,
          CheckOrCreateProfileParams>;
  @useResult
  $Res call({String uuid, String? avatar, String? name, String? email});
}

/// @nodoc
class _$CheckOrCreateProfileParamsCopyWithImpl<$Res,
        $Val extends CheckOrCreateProfileParams>
    implements $CheckOrCreateProfileParamsCopyWith<$Res> {
  _$CheckOrCreateProfileParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? avatar = freezed,
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckOrCreateProfileParamsImplCopyWith<$Res>
    implements $CheckOrCreateProfileParamsCopyWith<$Res> {
  factory _$$CheckOrCreateProfileParamsImplCopyWith(
          _$CheckOrCreateProfileParamsImpl value,
          $Res Function(_$CheckOrCreateProfileParamsImpl) then) =
      __$$CheckOrCreateProfileParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, String? avatar, String? name, String? email});
}

/// @nodoc
class __$$CheckOrCreateProfileParamsImplCopyWithImpl<$Res>
    extends _$CheckOrCreateProfileParamsCopyWithImpl<$Res,
        _$CheckOrCreateProfileParamsImpl>
    implements _$$CheckOrCreateProfileParamsImplCopyWith<$Res> {
  __$$CheckOrCreateProfileParamsImplCopyWithImpl(
      _$CheckOrCreateProfileParamsImpl _value,
      $Res Function(_$CheckOrCreateProfileParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? avatar = freezed,
    Object? name = freezed,
    Object? email = freezed,
  }) {
    return _then(_$CheckOrCreateProfileParamsImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckOrCreateProfileParamsImpl implements _CheckOrCreateProfileParams {
  const _$CheckOrCreateProfileParamsImpl(
      {required this.uuid, this.avatar, this.name, this.email});

  factory _$CheckOrCreateProfileParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CheckOrCreateProfileParamsImplFromJson(json);

  @override
  final String uuid;
  @override
  final String? avatar;
  @override
  final String? name;
  @override
  final String? email;

  @override
  String toString() {
    return 'CheckOrCreateProfileParams(uuid: $uuid, avatar: $avatar, name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckOrCreateProfileParamsImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, avatar, name, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckOrCreateProfileParamsImplCopyWith<_$CheckOrCreateProfileParamsImpl>
      get copyWith => __$$CheckOrCreateProfileParamsImplCopyWithImpl<
          _$CheckOrCreateProfileParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckOrCreateProfileParamsImplToJson(
      this,
    );
  }
}

abstract class _CheckOrCreateProfileParams
    implements CheckOrCreateProfileParams {
  const factory _CheckOrCreateProfileParams(
      {required final String uuid,
      final String? avatar,
      final String? name,
      final String? email}) = _$CheckOrCreateProfileParamsImpl;

  factory _CheckOrCreateProfileParams.fromJson(Map<String, dynamic> json) =
      _$CheckOrCreateProfileParamsImpl.fromJson;

  @override
  String get uuid;
  @override
  String? get avatar;
  @override
  String? get name;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$CheckOrCreateProfileParamsImplCopyWith<_$CheckOrCreateProfileParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
