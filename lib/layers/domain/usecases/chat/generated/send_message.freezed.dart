// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../send_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendMessageParams _$SendMessageParamsFromJson(Map<String, dynamic> json) {
  return _SendMessageParams.fromJson(json);
}

/// @nodoc
mixin _$SendMessageParams {
  @JsonKey(name: "profile_id")
  String get senderId => throw _privateConstructorUsedError;
  @JsonKey(name: "room_id")
  String get roomId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendMessageParamsCopyWith<SendMessageParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageParamsCopyWith<$Res> {
  factory $SendMessageParamsCopyWith(
          SendMessageParams value, $Res Function(SendMessageParams) then) =
      _$SendMessageParamsCopyWithImpl<$Res, SendMessageParams>;
  @useResult
  $Res call(
      {@JsonKey(name: "profile_id") String senderId,
      @JsonKey(name: "room_id") String roomId,
      String content});
}

/// @nodoc
class _$SendMessageParamsCopyWithImpl<$Res, $Val extends SendMessageParams>
    implements $SendMessageParamsCopyWith<$Res> {
  _$SendMessageParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? roomId = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendMessageParamsImplCopyWith<$Res>
    implements $SendMessageParamsCopyWith<$Res> {
  factory _$$SendMessageParamsImplCopyWith(_$SendMessageParamsImpl value,
          $Res Function(_$SendMessageParamsImpl) then) =
      __$$SendMessageParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "profile_id") String senderId,
      @JsonKey(name: "room_id") String roomId,
      String content});
}

/// @nodoc
class __$$SendMessageParamsImplCopyWithImpl<$Res>
    extends _$SendMessageParamsCopyWithImpl<$Res, _$SendMessageParamsImpl>
    implements _$$SendMessageParamsImplCopyWith<$Res> {
  __$$SendMessageParamsImplCopyWithImpl(_$SendMessageParamsImpl _value,
      $Res Function(_$SendMessageParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? roomId = null,
    Object? content = null,
  }) {
    return _then(_$SendMessageParamsImpl(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendMessageParamsImpl implements _SendMessageParams {
  const _$SendMessageParamsImpl(
      {@JsonKey(name: "profile_id") required this.senderId,
      @JsonKey(name: "room_id") required this.roomId,
      required this.content});

  factory _$SendMessageParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendMessageParamsImplFromJson(json);

  @override
  @JsonKey(name: "profile_id")
  final String senderId;
  @override
  @JsonKey(name: "room_id")
  final String roomId;
  @override
  final String content;

  @override
  String toString() {
    return 'SendMessageParams(senderId: $senderId, roomId: $roomId, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageParamsImpl &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, senderId, roomId, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageParamsImplCopyWith<_$SendMessageParamsImpl> get copyWith =>
      __$$SendMessageParamsImplCopyWithImpl<_$SendMessageParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendMessageParamsImplToJson(
      this,
    );
  }
}

abstract class _SendMessageParams implements SendMessageParams {
  const factory _SendMessageParams(
      {@JsonKey(name: "profile_id") required final String senderId,
      @JsonKey(name: "room_id") required final String roomId,
      required final String content}) = _$SendMessageParamsImpl;

  factory _SendMessageParams.fromJson(Map<String, dynamic> json) =
      _$SendMessageParamsImpl.fromJson;

  @override
  @JsonKey(name: "profile_id")
  String get senderId;
  @override
  @JsonKey(name: "room_id")
  String get roomId;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$SendMessageParamsImplCopyWith<_$SendMessageParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
