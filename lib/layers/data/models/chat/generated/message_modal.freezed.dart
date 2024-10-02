// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../message_modal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

/// @nodoc
mixin _$MessageModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_id")
  String get profileId => throw _privateConstructorUsedError;
  @JsonKey(name: "room_id")
  String get roomId => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  bool? get read => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageModelCopyWith<MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
          MessageModel value, $Res Function(MessageModel) then) =
      _$MessageModelCopyWithImpl<$Res, MessageModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "profile_id") String profileId,
      @JsonKey(name: "room_id") String roomId,
      String? content,
      @JsonKey(name: "created_at") String? createdAt,
      bool? read});
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res, $Val extends MessageModel>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profileId = null,
    Object? roomId = null,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? read = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      read: freezed == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageModelImplCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$$MessageModelImplCopyWith(
          _$MessageModelImpl value, $Res Function(_$MessageModelImpl) then) =
      __$$MessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: "profile_id") String profileId,
      @JsonKey(name: "room_id") String roomId,
      String? content,
      @JsonKey(name: "created_at") String? createdAt,
      bool? read});
}

/// @nodoc
class __$$MessageModelImplCopyWithImpl<$Res>
    extends _$MessageModelCopyWithImpl<$Res, _$MessageModelImpl>
    implements _$$MessageModelImplCopyWith<$Res> {
  __$$MessageModelImplCopyWithImpl(
      _$MessageModelImpl _value, $Res Function(_$MessageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profileId = null,
    Object? roomId = null,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? read = freezed,
  }) {
    return _then(_$MessageModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      read: freezed == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$MessageModelImpl extends _MessageModel {
  const _$MessageModelImpl(
      {required this.id,
      @JsonKey(name: "profile_id") required this.profileId,
      @JsonKey(name: "room_id") required this.roomId,
      this.content,
      @JsonKey(name: "created_at") this.createdAt,
      this.read})
      : super._();

  factory _$MessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "profile_id")
  final String profileId;
  @override
  @JsonKey(name: "room_id")
  final String roomId;
  @override
  final String? content;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  final bool? read;

  @override
  String toString() {
    return 'MessageModel(id: $id, profileId: $profileId, roomId: $roomId, content: $content, createdAt: $createdAt, read: $read)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.read, read) || other.read == read));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, profileId, roomId, content, createdAt, read);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      __$$MessageModelImplCopyWithImpl<_$MessageModelImpl>(this, _$identity);
}

abstract class _MessageModel extends MessageModel {
  const factory _MessageModel(
      {required final String id,
      @JsonKey(name: "profile_id") required final String profileId,
      @JsonKey(name: "room_id") required final String roomId,
      final String? content,
      @JsonKey(name: "created_at") final String? createdAt,
      final bool? read}) = _$MessageModelImpl;
  const _MessageModel._() : super._();

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$MessageModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "profile_id")
  String get profileId;
  @override
  @JsonKey(name: "room_id")
  String get roomId;
  @override
  String? get content;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  bool? get read;
  @override
  @JsonKey(ignore: true)
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
