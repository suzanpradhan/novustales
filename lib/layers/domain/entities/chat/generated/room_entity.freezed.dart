// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../room_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RoomEntity {
  String get uuid => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;
  List<ChatProfileEntity>? get receiverUser =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomEntityCopyWith<RoomEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomEntityCopyWith<$Res> {
  factory $RoomEntityCopyWith(
          RoomEntity value, $Res Function(RoomEntity) then) =
      _$RoomEntityCopyWithImpl<$Res, RoomEntity>;
  @useResult
  $Res call(
      {String uuid,
      String? name,
      DateTime? createdAt,
      String? lastMessage,
      List<ChatProfileEntity>? receiverUser});
}

/// @nodoc
class _$RoomEntityCopyWithImpl<$Res, $Val extends RoomEntity>
    implements $RoomEntityCopyWith<$Res> {
  _$RoomEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? lastMessage = freezed,
    Object? receiverUser = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverUser: freezed == receiverUser
          ? _value.receiverUser
          : receiverUser // ignore: cast_nullable_to_non_nullable
              as List<ChatProfileEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomEntityImplCopyWith<$Res>
    implements $RoomEntityCopyWith<$Res> {
  factory _$$RoomEntityImplCopyWith(
          _$RoomEntityImpl value, $Res Function(_$RoomEntityImpl) then) =
      __$$RoomEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      String? name,
      DateTime? createdAt,
      String? lastMessage,
      List<ChatProfileEntity>? receiverUser});
}

/// @nodoc
class __$$RoomEntityImplCopyWithImpl<$Res>
    extends _$RoomEntityCopyWithImpl<$Res, _$RoomEntityImpl>
    implements _$$RoomEntityImplCopyWith<$Res> {
  __$$RoomEntityImplCopyWithImpl(
      _$RoomEntityImpl _value, $Res Function(_$RoomEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? lastMessage = freezed,
    Object? receiverUser = freezed,
  }) {
    return _then(_$RoomEntityImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastMessage: freezed == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverUser: freezed == receiverUser
          ? _value._receiverUser
          : receiverUser // ignore: cast_nullable_to_non_nullable
              as List<ChatProfileEntity>?,
    ));
  }
}

/// @nodoc

class _$RoomEntityImpl implements _RoomEntity {
  const _$RoomEntityImpl(
      {required this.uuid,
      this.name,
      this.createdAt,
      this.lastMessage,
      final List<ChatProfileEntity>? receiverUser})
      : _receiverUser = receiverUser;

  @override
  final String uuid;
  @override
  final String? name;
  @override
  final DateTime? createdAt;
  @override
  final String? lastMessage;
  final List<ChatProfileEntity>? _receiverUser;
  @override
  List<ChatProfileEntity>? get receiverUser {
    final value = _receiverUser;
    if (value == null) return null;
    if (_receiverUser is EqualUnmodifiableListView) return _receiverUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RoomEntity(uuid: $uuid, name: $name, createdAt: $createdAt, lastMessage: $lastMessage, receiverUser: $receiverUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomEntityImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            const DeepCollectionEquality()
                .equals(other._receiverUser, _receiverUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, name, createdAt,
      lastMessage, const DeepCollectionEquality().hash(_receiverUser));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomEntityImplCopyWith<_$RoomEntityImpl> get copyWith =>
      __$$RoomEntityImplCopyWithImpl<_$RoomEntityImpl>(this, _$identity);
}

abstract class _RoomEntity implements RoomEntity {
  const factory _RoomEntity(
      {required final String uuid,
      final String? name,
      final DateTime? createdAt,
      final String? lastMessage,
      final List<ChatProfileEntity>? receiverUser}) = _$RoomEntityImpl;

  @override
  String get uuid;
  @override
  String? get name;
  @override
  DateTime? get createdAt;
  @override
  String? get lastMessage;
  @override
  List<ChatProfileEntity>? get receiverUser;
  @override
  @JsonKey(ignore: true)
  _$$RoomEntityImplCopyWith<_$RoomEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}