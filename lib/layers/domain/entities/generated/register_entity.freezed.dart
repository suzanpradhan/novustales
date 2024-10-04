// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../register_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterEntity {
  String? get message => throw _privateConstructorUsedError;

  /// Create a copy of RegisterEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterEntityCopyWith<RegisterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEntityCopyWith<$Res> {
  factory $RegisterEntityCopyWith(
          RegisterEntity value, $Res Function(RegisterEntity) then) =
      _$RegisterEntityCopyWithImpl<$Res, RegisterEntity>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$RegisterEntityCopyWithImpl<$Res, $Val extends RegisterEntity>
    implements $RegisterEntityCopyWith<$Res> {
  _$RegisterEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterEntityImplCopyWith<$Res>
    implements $RegisterEntityCopyWith<$Res> {
  factory _$$RegisterEntityImplCopyWith(_$RegisterEntityImpl value,
          $Res Function(_$RegisterEntityImpl) then) =
      __$$RegisterEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$RegisterEntityImplCopyWithImpl<$Res>
    extends _$RegisterEntityCopyWithImpl<$Res, _$RegisterEntityImpl>
    implements _$$RegisterEntityImplCopyWith<$Res> {
  __$$RegisterEntityImplCopyWithImpl(
      _$RegisterEntityImpl _value, $Res Function(_$RegisterEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$RegisterEntityImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RegisterEntityImpl implements _RegisterEntity {
  const _$RegisterEntityImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'RegisterEntity(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterEntityImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RegisterEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterEntityImplCopyWith<_$RegisterEntityImpl> get copyWith =>
      __$$RegisterEntityImplCopyWithImpl<_$RegisterEntityImpl>(
          this, _$identity);
}

abstract class _RegisterEntity implements RegisterEntity {
  const factory _RegisterEntity({final String? message}) = _$RegisterEntityImpl;

  @override
  String? get message;

  /// Create a copy of RegisterEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterEntityImplCopyWith<_$RegisterEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
