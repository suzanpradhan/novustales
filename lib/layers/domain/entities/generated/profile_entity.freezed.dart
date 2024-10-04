// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEntity {
  int get id => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'nick_name')
  String get nickName => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_stories')
  int get numberOfStories => throw _privateConstructorUsedError;
  @JsonKey(name: 'number_of_views')
  int get numberOfViews => throw _privateConstructorUsedError;
  List<StoryEntity> get stories => throw _privateConstructorUsedError;

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileEntityCopyWith<ProfileEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEntityCopyWith<$Res> {
  factory $ProfileEntityCopyWith(
          ProfileEntity value, $Res Function(ProfileEntity) then) =
      _$ProfileEntityCopyWithImpl<$Res, ProfileEntity>;
  @useResult
  $Res call(
      {int id,
      String uuid,
      String email,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'nick_name') String nickName,
      String avatar,
      String? bio,
      @JsonKey(name: 'number_of_stories') int numberOfStories,
      @JsonKey(name: 'number_of_views') int numberOfViews,
      List<StoryEntity> stories});
}

/// @nodoc
class _$ProfileEntityCopyWithImpl<$Res, $Val extends ProfileEntity>
    implements $ProfileEntityCopyWith<$Res> {
  _$ProfileEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? nickName = null,
    Object? avatar = null,
    Object? bio = freezed,
    Object? numberOfStories = null,
    Object? numberOfViews = null,
    Object? stories = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfStories: null == numberOfStories
          ? _value.numberOfStories
          : numberOfStories // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfViews: null == numberOfViews
          ? _value.numberOfViews
          : numberOfViews // ignore: cast_nullable_to_non_nullable
              as int,
      stories: null == stories
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<StoryEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileEntityImplCopyWith<$Res>
    implements $ProfileEntityCopyWith<$Res> {
  factory _$$ProfileEntityImplCopyWith(
          _$ProfileEntityImpl value, $Res Function(_$ProfileEntityImpl) then) =
      __$$ProfileEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String uuid,
      String email,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      @JsonKey(name: 'nick_name') String nickName,
      String avatar,
      String? bio,
      @JsonKey(name: 'number_of_stories') int numberOfStories,
      @JsonKey(name: 'number_of_views') int numberOfViews,
      List<StoryEntity> stories});
}

/// @nodoc
class __$$ProfileEntityImplCopyWithImpl<$Res>
    extends _$ProfileEntityCopyWithImpl<$Res, _$ProfileEntityImpl>
    implements _$$ProfileEntityImplCopyWith<$Res> {
  __$$ProfileEntityImplCopyWithImpl(
      _$ProfileEntityImpl _value, $Res Function(_$ProfileEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uuid = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? nickName = null,
    Object? avatar = null,
    Object? bio = freezed,
    Object? numberOfStories = null,
    Object? numberOfViews = null,
    Object? stories = null,
  }) {
    return _then(_$ProfileEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfStories: null == numberOfStories
          ? _value.numberOfStories
          : numberOfStories // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfViews: null == numberOfViews
          ? _value.numberOfViews
          : numberOfViews // ignore: cast_nullable_to_non_nullable
              as int,
      stories: null == stories
          ? _value._stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<StoryEntity>,
    ));
  }
}

/// @nodoc

class _$ProfileEntityImpl implements _ProfileEntity {
  const _$ProfileEntityImpl(
      {required this.id,
      required this.uuid,
      required this.email,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      @JsonKey(name: 'nick_name') required this.nickName,
      required this.avatar,
      this.bio,
      @JsonKey(name: 'number_of_stories') this.numberOfStories = 0,
      @JsonKey(name: 'number_of_views') this.numberOfViews = 0,
      required final List<StoryEntity> stories})
      : _stories = stories;

  @override
  final int id;
  @override
  final String uuid;
  @override
  final String email;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  @JsonKey(name: 'nick_name')
  final String nickName;
  @override
  final String avatar;
  @override
  final String? bio;
  @override
  @JsonKey(name: 'number_of_stories')
  final int numberOfStories;
  @override
  @JsonKey(name: 'number_of_views')
  final int numberOfViews;
  final List<StoryEntity> _stories;
  @override
  List<StoryEntity> get stories {
    if (_stories is EqualUnmodifiableListView) return _stories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stories);
  }

  @override
  String toString() {
    return 'ProfileEntity(id: $id, uuid: $uuid, email: $email, firstName: $firstName, lastName: $lastName, nickName: $nickName, avatar: $avatar, bio: $bio, numberOfStories: $numberOfStories, numberOfViews: $numberOfViews, stories: $stories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.numberOfStories, numberOfStories) ||
                other.numberOfStories == numberOfStories) &&
            (identical(other.numberOfViews, numberOfViews) ||
                other.numberOfViews == numberOfViews) &&
            const DeepCollectionEquality().equals(other._stories, _stories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uuid,
      email,
      firstName,
      lastName,
      nickName,
      avatar,
      bio,
      numberOfStories,
      numberOfViews,
      const DeepCollectionEquality().hash(_stories));

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEntityImplCopyWith<_$ProfileEntityImpl> get copyWith =>
      __$$ProfileEntityImplCopyWithImpl<_$ProfileEntityImpl>(this, _$identity);
}

abstract class _ProfileEntity implements ProfileEntity {
  const factory _ProfileEntity(
      {required final int id,
      required final String uuid,
      required final String email,
      @JsonKey(name: 'first_name') required final String firstName,
      @JsonKey(name: 'last_name') required final String lastName,
      @JsonKey(name: 'nick_name') required final String nickName,
      required final String avatar,
      final String? bio,
      @JsonKey(name: 'number_of_stories') final int numberOfStories,
      @JsonKey(name: 'number_of_views') final int numberOfViews,
      required final List<StoryEntity> stories}) = _$ProfileEntityImpl;

  @override
  int get id;
  @override
  String get uuid;
  @override
  String get email;
  @override
  @JsonKey(name: 'first_name')
  String get firstName;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  @JsonKey(name: 'nick_name')
  String get nickName;
  @override
  String get avatar;
  @override
  String? get bio;
  @override
  @JsonKey(name: 'number_of_stories')
  int get numberOfStories;
  @override
  @JsonKey(name: 'number_of_views')
  int get numberOfViews;
  @override
  List<StoryEntity> get stories;

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileEntityImplCopyWith<_$ProfileEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
