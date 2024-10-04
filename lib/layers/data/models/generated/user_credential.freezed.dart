// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../user_credential.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserCredential {
  String? get accessToken => throw _privateConstructorUsedError;

  /// Create a copy of UserCredential
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCredentialCopyWith<UserCredential> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCredentialCopyWith<$Res> {
  factory $UserCredentialCopyWith(
          UserCredential value, $Res Function(UserCredential) then) =
      _$UserCredentialCopyWithImpl<$Res, UserCredential>;
  @useResult
  $Res call({String? accessToken});
}

/// @nodoc
class _$UserCredentialCopyWithImpl<$Res, $Val extends UserCredential>
    implements $UserCredentialCopyWith<$Res> {
  _$UserCredentialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserCredential
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserCredentialImplCopyWith<$Res>
    implements $UserCredentialCopyWith<$Res> {
  factory _$$UserCredentialImplCopyWith(_$UserCredentialImpl value,
          $Res Function(_$UserCredentialImpl) then) =
      __$$UserCredentialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? accessToken});
}

/// @nodoc
class __$$UserCredentialImplCopyWithImpl<$Res>
    extends _$UserCredentialCopyWithImpl<$Res, _$UserCredentialImpl>
    implements _$$UserCredentialImplCopyWith<$Res> {
  __$$UserCredentialImplCopyWithImpl(
      _$UserCredentialImpl _value, $Res Function(_$UserCredentialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserCredential
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
  }) {
    return _then(_$UserCredentialImpl(
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserCredentialImpl extends _UserCredential {
  const _$UserCredentialImpl({this.accessToken}) : super._();

  @override
  final String? accessToken;

  @override
  String toString() {
    return 'UserCredential(accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserCredentialImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken);

  /// Create a copy of UserCredential
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserCredentialImplCopyWith<_$UserCredentialImpl> get copyWith =>
      __$$UserCredentialImplCopyWithImpl<_$UserCredentialImpl>(
          this, _$identity);
}

abstract class _UserCredential extends UserCredential {
  const factory _UserCredential({final String? accessToken}) =
      _$UserCredentialImpl;
  const _UserCredential._() : super._();

  @override
  String? get accessToken;

  /// Create a copy of UserCredential
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserCredentialImplCopyWith<_$UserCredentialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
