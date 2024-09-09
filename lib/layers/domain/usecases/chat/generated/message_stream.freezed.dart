// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../message_stream.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetStreamParams {
  String get roomId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetStreamParamsCopyWith<GetStreamParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetStreamParamsCopyWith<$Res> {
  factory $GetStreamParamsCopyWith(
          GetStreamParams value, $Res Function(GetStreamParams) then) =
      _$GetStreamParamsCopyWithImpl<$Res, GetStreamParams>;
  @useResult
  $Res call({String roomId});
}

/// @nodoc
class _$GetStreamParamsCopyWithImpl<$Res, $Val extends GetStreamParams>
    implements $GetStreamParamsCopyWith<$Res> {
  _$GetStreamParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
  }) {
    return _then(_value.copyWith(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetStreamParamsImplCopyWith<$Res>
    implements $GetStreamParamsCopyWith<$Res> {
  factory _$$GetStreamParamsImplCopyWith(_$GetStreamParamsImpl value,
          $Res Function(_$GetStreamParamsImpl) then) =
      __$$GetStreamParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String roomId});
}

/// @nodoc
class __$$GetStreamParamsImplCopyWithImpl<$Res>
    extends _$GetStreamParamsCopyWithImpl<$Res, _$GetStreamParamsImpl>
    implements _$$GetStreamParamsImplCopyWith<$Res> {
  __$$GetStreamParamsImplCopyWithImpl(
      _$GetStreamParamsImpl _value, $Res Function(_$GetStreamParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
  }) {
    return _then(_$GetStreamParamsImpl(
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetStreamParamsImpl implements _GetStreamParams {
  const _$GetStreamParamsImpl({required this.roomId});

  @override
  final String roomId;

  @override
  String toString() {
    return 'GetStreamParams(roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetStreamParamsImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetStreamParamsImplCopyWith<_$GetStreamParamsImpl> get copyWith =>
      __$$GetStreamParamsImplCopyWithImpl<_$GetStreamParamsImpl>(
          this, _$identity);
}

abstract class _GetStreamParams implements GetStreamParams {
  const factory _GetStreamParams({required final String roomId}) =
      _$GetStreamParamsImpl;

  @override
  String get roomId;
  @override
  @JsonKey(ignore: true)
  _$$GetStreamParamsImplCopyWith<_$GetStreamParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
