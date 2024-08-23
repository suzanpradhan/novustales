// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../story_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoryEntity {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_details')
  UserDetailsEntity? get userDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_url')
  String? get mediaUrl => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  int? get views => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get media => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_urls')
  String? get mediaUrls => throw _privateConstructorUsedError;
  @JsonKey(name: 'blob_ref')
  String? get blobRef => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get county => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoryEntityCopyWith<StoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryEntityCopyWith<$Res> {
  factory $StoryEntityCopyWith(
          StoryEntity value, $Res Function(StoryEntity) then) =
      _$StoryEntityCopyWithImpl<$Res, StoryEntity>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'user_details') UserDetailsEntity? userDetails,
      @JsonKey(name: 'media_url') String? mediaUrl,
      String? category,
      int? views,
      String? title,
      String? media,
      @JsonKey(name: 'media_urls') String? mediaUrls,
      @JsonKey(name: 'blob_ref') String? blobRef,
      double? latitude,
      double? longitude,
      String? name,
      String? country,
      String? state,
      String? city,
      String? county,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $UserDetailsEntityCopyWith<$Res>? get userDetails;
}

/// @nodoc
class _$StoryEntityCopyWithImpl<$Res, $Val extends StoryEntity>
    implements $StoryEntityCopyWith<$Res> {
  _$StoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userDetails = freezed,
    Object? mediaUrl = freezed,
    Object? category = freezed,
    Object? views = freezed,
    Object? title = freezed,
    Object? media = freezed,
    Object? mediaUrls = freezed,
    Object? blobRef = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? name = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? county = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetailsEntity?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrls: freezed == mediaUrls
          ? _value.mediaUrls
          : mediaUrls // ignore: cast_nullable_to_non_nullable
              as String?,
      blobRef: freezed == blobRef
          ? _value.blobRef
          : blobRef // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      county: freezed == county
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDetailsEntityCopyWith<$Res>? get userDetails {
    if (_value.userDetails == null) {
      return null;
    }

    return $UserDetailsEntityCopyWith<$Res>(_value.userDetails!, (value) {
      return _then(_value.copyWith(userDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoryEntityImplCopyWith<$Res>
    implements $StoryEntityCopyWith<$Res> {
  factory _$$StoryEntityImplCopyWith(
          _$StoryEntityImpl value, $Res Function(_$StoryEntityImpl) then) =
      __$$StoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'user_details') UserDetailsEntity? userDetails,
      @JsonKey(name: 'media_url') String? mediaUrl,
      String? category,
      int? views,
      String? title,
      String? media,
      @JsonKey(name: 'media_urls') String? mediaUrls,
      @JsonKey(name: 'blob_ref') String? blobRef,
      double? latitude,
      double? longitude,
      String? name,
      String? country,
      String? state,
      String? city,
      String? county,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $UserDetailsEntityCopyWith<$Res>? get userDetails;
}

/// @nodoc
class __$$StoryEntityImplCopyWithImpl<$Res>
    extends _$StoryEntityCopyWithImpl<$Res, _$StoryEntityImpl>
    implements _$$StoryEntityImplCopyWith<$Res> {
  __$$StoryEntityImplCopyWithImpl(
      _$StoryEntityImpl _value, $Res Function(_$StoryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userDetails = freezed,
    Object? mediaUrl = freezed,
    Object? category = freezed,
    Object? views = freezed,
    Object? title = freezed,
    Object? media = freezed,
    Object? mediaUrls = freezed,
    Object? blobRef = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? name = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? county = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$StoryEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserDetailsEntity?,
      mediaUrl: freezed == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      views: freezed == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrls: freezed == mediaUrls
          ? _value.mediaUrls
          : mediaUrls // ignore: cast_nullable_to_non_nullable
              as String?,
      blobRef: freezed == blobRef
          ? _value.blobRef
          : blobRef // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      county: freezed == county
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$StoryEntityImpl implements _StoryEntity {
  const _$StoryEntityImpl(
      {this.id,
      @JsonKey(name: 'user_details') this.userDetails,
      @JsonKey(name: 'media_url') this.mediaUrl,
      this.category,
      this.views,
      this.title,
      this.media,
      @JsonKey(name: 'media_urls') this.mediaUrls,
      @JsonKey(name: 'blob_ref') this.blobRef,
      this.latitude,
      this.longitude,
      this.name,
      this.country,
      this.state,
      this.city,
      this.county,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  @override
  final int? id;
  @override
  @JsonKey(name: 'user_details')
  final UserDetailsEntity? userDetails;
  @override
  @JsonKey(name: 'media_url')
  final String? mediaUrl;
  @override
  final String? category;
  @override
  final int? views;
  @override
  final String? title;
  @override
  final String? media;
  @override
  @JsonKey(name: 'media_urls')
  final String? mediaUrls;
  @override
  @JsonKey(name: 'blob_ref')
  final String? blobRef;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? name;
  @override
  final String? country;
  @override
  final String? state;
  @override
  final String? city;
  @override
  final String? county;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'StoryEntity(id: $id, userDetails: $userDetails, mediaUrl: $mediaUrl, category: $category, views: $views, title: $title, media: $media, mediaUrls: $mediaUrls, blobRef: $blobRef, latitude: $latitude, longitude: $longitude, name: $name, country: $country, state: $state, city: $city, county: $county, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.mediaUrls, mediaUrls) ||
                other.mediaUrls == mediaUrls) &&
            (identical(other.blobRef, blobRef) || other.blobRef == blobRef) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.county, county) || other.county == county) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userDetails,
      mediaUrl,
      category,
      views,
      title,
      media,
      mediaUrls,
      blobRef,
      latitude,
      longitude,
      name,
      country,
      state,
      city,
      county,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryEntityImplCopyWith<_$StoryEntityImpl> get copyWith =>
      __$$StoryEntityImplCopyWithImpl<_$StoryEntityImpl>(this, _$identity);
}

abstract class _StoryEntity implements StoryEntity {
  const factory _StoryEntity(
          {final int? id,
          @JsonKey(name: 'user_details') final UserDetailsEntity? userDetails,
          @JsonKey(name: 'media_url') final String? mediaUrl,
          final String? category,
          final int? views,
          final String? title,
          final String? media,
          @JsonKey(name: 'media_urls') final String? mediaUrls,
          @JsonKey(name: 'blob_ref') final String? blobRef,
          final double? latitude,
          final double? longitude,
          final String? name,
          final String? country,
          final String? state,
          final String? city,
          final String? county,
          @JsonKey(name: 'created_at') final DateTime? createdAt,
          @JsonKey(name: 'updated_at') final DateTime? updatedAt}) =
      _$StoryEntityImpl;

  @override
  int? get id;
  @override
  @JsonKey(name: 'user_details')
  UserDetailsEntity? get userDetails;
  @override
  @JsonKey(name: 'media_url')
  String? get mediaUrl;
  @override
  String? get category;
  @override
  int? get views;
  @override
  String? get title;
  @override
  String? get media;
  @override
  @JsonKey(name: 'media_urls')
  String? get mediaUrls;
  @override
  @JsonKey(name: 'blob_ref')
  String? get blobRef;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get name;
  @override
  String? get country;
  @override
  String? get state;
  @override
  String? get city;
  @override
  String? get county;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$StoryEntityImplCopyWith<_$StoryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserDetailsEntity {
  int get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_details')
  String? get nickName => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDetailsEntityCopyWith<UserDetailsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsEntityCopyWith<$Res> {
  factory $UserDetailsEntityCopyWith(
          UserDetailsEntity value, $Res Function(UserDetailsEntity) then) =
      _$UserDetailsEntityCopyWithImpl<$Res, UserDetailsEntity>;
  @useResult
  $Res call(
      {int id,
      String? email,
      String? name,
      @JsonKey(name: 'user_details') String? nickName,
      String? avatar});
}

/// @nodoc
class _$UserDetailsEntityCopyWithImpl<$Res, $Val extends UserDetailsEntity>
    implements $UserDetailsEntityCopyWith<$Res> {
  _$UserDetailsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? name = freezed,
    Object? nickName = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDetailsEntityImplCopyWith<$Res>
    implements $UserDetailsEntityCopyWith<$Res> {
  factory _$$UserDetailsEntityImplCopyWith(_$UserDetailsEntityImpl value,
          $Res Function(_$UserDetailsEntityImpl) then) =
      __$$UserDetailsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String? email,
      String? name,
      @JsonKey(name: 'user_details') String? nickName,
      String? avatar});
}

/// @nodoc
class __$$UserDetailsEntityImplCopyWithImpl<$Res>
    extends _$UserDetailsEntityCopyWithImpl<$Res, _$UserDetailsEntityImpl>
    implements _$$UserDetailsEntityImplCopyWith<$Res> {
  __$$UserDetailsEntityImplCopyWithImpl(_$UserDetailsEntityImpl _value,
      $Res Function(_$UserDetailsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? name = freezed,
    Object? nickName = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_$UserDetailsEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UserDetailsEntityImpl implements _UserDetailsEntity {
  const _$UserDetailsEntityImpl(
      {this.id = 0,
      this.email,
      this.name,
      @JsonKey(name: 'user_details') this.nickName,
      this.avatar});

  @override
  @JsonKey()
  final int id;
  @override
  final String? email;
  @override
  final String? name;
  @override
  @JsonKey(name: 'user_details')
  final String? nickName;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'UserDetailsEntity(id: $id, email: $email, name: $name, nickName: $nickName, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailsEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, name, nickName, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDetailsEntityImplCopyWith<_$UserDetailsEntityImpl> get copyWith =>
      __$$UserDetailsEntityImplCopyWithImpl<_$UserDetailsEntityImpl>(
          this, _$identity);
}

abstract class _UserDetailsEntity implements UserDetailsEntity {
  const factory _UserDetailsEntity(
      {final int id,
      final String? email,
      final String? name,
      @JsonKey(name: 'user_details') final String? nickName,
      final String? avatar}) = _$UserDetailsEntityImpl;

  @override
  int get id;
  @override
  String? get email;
  @override
  String? get name;
  @override
  @JsonKey(name: 'user_details')
  String? get nickName;
  @override
  String? get avatar;
  @override
  @JsonKey(ignore: true)
  _$$UserDetailsEntityImplCopyWith<_$UserDetailsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
