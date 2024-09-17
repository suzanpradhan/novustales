// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../room_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) {
  return _RoomModel.fromJson(json);
}

/// @nodoc
mixin _$RoomModel {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  String? get lastMessage => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  List<ChatUser>? get receiverUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomModelCopyWith<RoomModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomModelCopyWith<$Res> {
  factory $RoomModelCopyWith(RoomModel value, $Res Function(RoomModel) then) =
      _$RoomModelCopyWithImpl<$Res, RoomModel>;
  @useResult
  $Res call(
      {String id,
      String? name,
      DateTime? createdAt,
      @JsonKey(includeFromJson: false) String? lastMessage,
      @JsonKey(includeFromJson: false) List<ChatUser>? receiverUser});
}

/// @nodoc
class _$RoomModelCopyWithImpl<$Res, $Val extends RoomModel>
    implements $RoomModelCopyWith<$Res> {
  _$RoomModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? lastMessage = freezed,
    Object? receiverUser = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as List<ChatUser>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomModelImplCopyWith<$Res>
    implements $RoomModelCopyWith<$Res> {
  factory _$$RoomModelImplCopyWith(
          _$RoomModelImpl value, $Res Function(_$RoomModelImpl) then) =
      __$$RoomModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? name,
      DateTime? createdAt,
      @JsonKey(includeFromJson: false) String? lastMessage,
      @JsonKey(includeFromJson: false) List<ChatUser>? receiverUser});
}

/// @nodoc
class __$$RoomModelImplCopyWithImpl<$Res>
    extends _$RoomModelCopyWithImpl<$Res, _$RoomModelImpl>
    implements _$$RoomModelImplCopyWith<$Res> {
  __$$RoomModelImplCopyWithImpl(
      _$RoomModelImpl _value, $Res Function(_$RoomModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? lastMessage = freezed,
    Object? receiverUser = freezed,
  }) {
    return _then(_$RoomModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
              as List<ChatUser>?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$RoomModelImpl extends _RoomModel {
  const _$RoomModelImpl(
      {required this.id,
      this.name,
      this.createdAt,
      @JsonKey(includeFromJson: false) this.lastMessage,
      @JsonKey(includeFromJson: false) final List<ChatUser>? receiverUser})
      : _receiverUser = receiverUser,
        super._();

  factory _$RoomModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomModelImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final DateTime? createdAt;
  @override
  @JsonKey(includeFromJson: false)
  final String? lastMessage;
  final List<ChatUser>? _receiverUser;
  @override
  @JsonKey(includeFromJson: false)
  List<ChatUser>? get receiverUser {
    final value = _receiverUser;
    if (value == null) return null;
    if (_receiverUser is EqualUnmodifiableListView) return _receiverUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RoomModel(id: $id, name: $name, createdAt: $createdAt, lastMessage: $lastMessage, receiverUser: $receiverUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            const DeepCollectionEquality()
                .equals(other._receiverUser, _receiverUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, createdAt, lastMessage,
      const DeepCollectionEquality().hash(_receiverUser));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomModelImplCopyWith<_$RoomModelImpl> get copyWith =>
      __$$RoomModelImplCopyWithImpl<_$RoomModelImpl>(this, _$identity);
}

abstract class _RoomModel extends RoomModel {
  const factory _RoomModel(
      {required final String id,
      final String? name,
      final DateTime? createdAt,
      @JsonKey(includeFromJson: false) final String? lastMessage,
      @JsonKey(includeFromJson: false)
      final List<ChatUser>? receiverUser}) = _$RoomModelImpl;
  const _RoomModel._() : super._();

  factory _RoomModel.fromJson(Map<String, dynamic> json) =
      _$RoomModelImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(includeFromJson: false)
  String? get lastMessage;
  @override
  @JsonKey(includeFromJson: false)
  List<ChatUser>? get receiverUser;
  @override
  @JsonKey(ignore: true)
  _$$RoomModelImplCopyWith<_$RoomModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
