// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../get_direction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetDirectionParams {
  LatLng get origin => throw _privateConstructorUsedError;
  LatLng get destination => throw _privateConstructorUsedError;

  /// Create a copy of GetDirectionParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetDirectionParamsCopyWith<GetDirectionParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetDirectionParamsCopyWith<$Res> {
  factory $GetDirectionParamsCopyWith(
          GetDirectionParams value, $Res Function(GetDirectionParams) then) =
      _$GetDirectionParamsCopyWithImpl<$Res, GetDirectionParams>;
  @useResult
  $Res call({LatLng origin, LatLng destination});
}

/// @nodoc
class _$GetDirectionParamsCopyWithImpl<$Res, $Val extends GetDirectionParams>
    implements $GetDirectionParamsCopyWith<$Res> {
  _$GetDirectionParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetDirectionParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? destination = null,
  }) {
    return _then(_value.copyWith(
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as LatLng,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetDirectionParamsImplCopyWith<$Res>
    implements $GetDirectionParamsCopyWith<$Res> {
  factory _$$GetDirectionParamsImplCopyWith(_$GetDirectionParamsImpl value,
          $Res Function(_$GetDirectionParamsImpl) then) =
      __$$GetDirectionParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LatLng origin, LatLng destination});
}

/// @nodoc
class __$$GetDirectionParamsImplCopyWithImpl<$Res>
    extends _$GetDirectionParamsCopyWithImpl<$Res, _$GetDirectionParamsImpl>
    implements _$$GetDirectionParamsImplCopyWith<$Res> {
  __$$GetDirectionParamsImplCopyWithImpl(_$GetDirectionParamsImpl _value,
      $Res Function(_$GetDirectionParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetDirectionParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? destination = null,
  }) {
    return _then(_$GetDirectionParamsImpl(
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as LatLng,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$GetDirectionParamsImpl implements _GetDirectionParams {
  const _$GetDirectionParamsImpl(
      {required this.origin, required this.destination});

  @override
  final LatLng origin;
  @override
  final LatLng destination;

  @override
  String toString() {
    return 'GetDirectionParams(origin: $origin, destination: $destination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDirectionParamsImpl &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination));
  }

  @override
  int get hashCode => Object.hash(runtimeType, origin, destination);

  /// Create a copy of GetDirectionParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDirectionParamsImplCopyWith<_$GetDirectionParamsImpl> get copyWith =>
      __$$GetDirectionParamsImplCopyWithImpl<_$GetDirectionParamsImpl>(
          this, _$identity);
}

abstract class _GetDirectionParams implements GetDirectionParams {
  const factory _GetDirectionParams(
      {required final LatLng origin,
      required final LatLng destination}) = _$GetDirectionParamsImpl;

  @override
  LatLng get origin;
  @override
  LatLng get destination;

  /// Create a copy of GetDirectionParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetDirectionParamsImplCopyWith<_$GetDirectionParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
