// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../get_near_me_tales.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NearMeTalesParams _$NearMeTalesParamsFromJson(Map<String, dynamic> json) {
  return _NearMeTalesParams.fromJson(json);
}

/// @nodoc
mixin _$NearMeTalesParams {
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String get radius => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NearMeTalesParamsCopyWith<NearMeTalesParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearMeTalesParamsCopyWith<$Res> {
  factory $NearMeTalesParamsCopyWith(
          NearMeTalesParams value, $Res Function(NearMeTalesParams) then) =
      _$NearMeTalesParamsCopyWithImpl<$Res, NearMeTalesParams>;
  @useResult
  $Res call({String latitude, String longitude, String radius});
}

/// @nodoc
class _$NearMeTalesParamsCopyWithImpl<$Res, $Val extends NearMeTalesParams>
    implements $NearMeTalesParamsCopyWith<$Res> {
  _$NearMeTalesParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? radius = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NearMeTalesParamsImplCopyWith<$Res>
    implements $NearMeTalesParamsCopyWith<$Res> {
  factory _$$NearMeTalesParamsImplCopyWith(_$NearMeTalesParamsImpl value,
          $Res Function(_$NearMeTalesParamsImpl) then) =
      __$$NearMeTalesParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String latitude, String longitude, String radius});
}

/// @nodoc
class __$$NearMeTalesParamsImplCopyWithImpl<$Res>
    extends _$NearMeTalesParamsCopyWithImpl<$Res, _$NearMeTalesParamsImpl>
    implements _$$NearMeTalesParamsImplCopyWith<$Res> {
  __$$NearMeTalesParamsImplCopyWithImpl(_$NearMeTalesParamsImpl _value,
      $Res Function(_$NearMeTalesParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? radius = null,
  }) {
    return _then(_$NearMeTalesParamsImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      radius: null == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NearMeTalesParamsImpl implements _NearMeTalesParams {
  const _$NearMeTalesParamsImpl(
      {required this.latitude, required this.longitude, required this.radius});

  factory _$NearMeTalesParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearMeTalesParamsImplFromJson(json);

  @override
  final String latitude;
  @override
  final String longitude;
  @override
  final String radius;

  @override
  String toString() {
    return 'NearMeTalesParams(latitude: $latitude, longitude: $longitude, radius: $radius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearMeTalesParamsImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, radius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NearMeTalesParamsImplCopyWith<_$NearMeTalesParamsImpl> get copyWith =>
      __$$NearMeTalesParamsImplCopyWithImpl<_$NearMeTalesParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearMeTalesParamsImplToJson(
      this,
    );
  }
}

abstract class _NearMeTalesParams implements NearMeTalesParams {
  const factory _NearMeTalesParams(
      {required final String latitude,
      required final String longitude,
      required final String radius}) = _$NearMeTalesParamsImpl;

  factory _NearMeTalesParams.fromJson(Map<String, dynamic> json) =
      _$NearMeTalesParamsImpl.fromJson;

  @override
  String get latitude;
  @override
  String get longitude;
  @override
  String get radius;
  @override
  @JsonKey(ignore: true)
  _$$NearMeTalesParamsImplCopyWith<_$NearMeTalesParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
