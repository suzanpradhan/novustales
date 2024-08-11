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
  UserDetailsEntity? get user_details => throw _privateConstructorUsedError;
  String? get media_url => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  int? get views => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get media => throw _privateConstructorUsedError;
  String? get media_urls => throw _privateConstructorUsedError;
  String? get blob_ref => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get county => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  DateTime? get updated_at => throw _privateConstructorUsedError;

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
      UserDetailsEntity? user_details,
      String? media_url,
      String? category,
      int? views,
      String? title,
      String? media,
      String? media_urls,
      String? blob_ref,
      double? latitude,
      double? longitude,
      String? name,
      String? country,
      String? state,
      String? city,
      String? county,
      DateTime? created_at,
      DateTime? updated_at});

  $UserDetailsEntityCopyWith<$Res>? get user_details;
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
    Object? user_details = freezed,
    Object? media_url = freezed,
    Object? category = freezed,
    Object? views = freezed,
    Object? title = freezed,
    Object? media = freezed,
    Object? media_urls = freezed,
    Object? blob_ref = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? name = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? county = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user_details: freezed == user_details
          ? _value.user_details
          : user_details // ignore: cast_nullable_to_non_nullable
              as UserDetailsEntity?,
      media_url: freezed == media_url
          ? _value.media_url
          : media_url // ignore: cast_nullable_to_non_nullable
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
      media_urls: freezed == media_urls
          ? _value.media_urls
          : media_urls // ignore: cast_nullable_to_non_nullable
              as String?,
      blob_ref: freezed == blob_ref
          ? _value.blob_ref
          : blob_ref // ignore: cast_nullable_to_non_nullable
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
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDetailsEntityCopyWith<$Res>? get user_details {
    if (_value.user_details == null) {
      return null;
    }

    return $UserDetailsEntityCopyWith<$Res>(_value.user_details!, (value) {
      return _then(_value.copyWith(user_details: value) as $Val);
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
      UserDetailsEntity? user_details,
      String? media_url,
      String? category,
      int? views,
      String? title,
      String? media,
      String? media_urls,
      String? blob_ref,
      double? latitude,
      double? longitude,
      String? name,
      String? country,
      String? state,
      String? city,
      String? county,
      DateTime? created_at,
      DateTime? updated_at});

  @override
  $UserDetailsEntityCopyWith<$Res>? get user_details;
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
    Object? user_details = freezed,
    Object? media_url = freezed,
    Object? category = freezed,
    Object? views = freezed,
    Object? title = freezed,
    Object? media = freezed,
    Object? media_urls = freezed,
    Object? blob_ref = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? name = freezed,
    Object? country = freezed,
    Object? state = freezed,
    Object? city = freezed,
    Object? county = freezed,
    Object? created_at = freezed,
    Object? updated_at = freezed,
  }) {
    return _then(_$StoryEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user_details: freezed == user_details
          ? _value.user_details
          : user_details // ignore: cast_nullable_to_non_nullable
              as UserDetailsEntity?,
      media_url: freezed == media_url
          ? _value.media_url
          : media_url // ignore: cast_nullable_to_non_nullable
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
      media_urls: freezed == media_urls
          ? _value.media_urls
          : media_urls // ignore: cast_nullable_to_non_nullable
              as String?,
      blob_ref: freezed == blob_ref
          ? _value.blob_ref
          : blob_ref // ignore: cast_nullable_to_non_nullable
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
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$StoryEntityImpl implements _StoryEntity {
  const _$StoryEntityImpl(
      {this.id,
      this.user_details,
      this.media_url,
      this.category,
      this.views,
      this.title,
      this.media,
      this.media_urls,
      this.blob_ref,
      this.latitude,
      this.longitude,
      this.name,
      this.country,
      this.state,
      this.city,
      this.county,
      this.created_at,
      this.updated_at});

  @override
  final int? id;
  @override
  final UserDetailsEntity? user_details;
  @override
  final String? media_url;
  @override
  final String? category;
  @override
  final int? views;
  @override
  final String? title;
  @override
  final String? media;
  @override
  final String? media_urls;
  @override
  final String? blob_ref;
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
  final DateTime? created_at;
  @override
  final DateTime? updated_at;

  @override
  String toString() {
    return 'StoryEntity(id: $id, user_details: $user_details, media_url: $media_url, category: $category, views: $views, title: $title, media: $media, media_urls: $media_urls, blob_ref: $blob_ref, latitude: $latitude, longitude: $longitude, name: $name, country: $country, state: $state, city: $city, county: $county, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user_details, user_details) ||
                other.user_details == user_details) &&
            (identical(other.media_url, media_url) ||
                other.media_url == media_url) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.views, views) || other.views == views) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.media, media) || other.media == media) &&
            (identical(other.media_urls, media_urls) ||
                other.media_urls == media_urls) &&
            (identical(other.blob_ref, blob_ref) ||
                other.blob_ref == blob_ref) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.county, county) || other.county == county) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user_details,
      media_url,
      category,
      views,
      title,
      media,
      media_urls,
      blob_ref,
      latitude,
      longitude,
      name,
      country,
      state,
      city,
      county,
      created_at,
      updated_at);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryEntityImplCopyWith<_$StoryEntityImpl> get copyWith =>
      __$$StoryEntityImplCopyWithImpl<_$StoryEntityImpl>(this, _$identity);
}

abstract class _StoryEntity implements StoryEntity {
  const factory _StoryEntity(
      {final int? id,
      final UserDetailsEntity? user_details,
      final String? media_url,
      final String? category,
      final int? views,
      final String? title,
      final String? media,
      final String? media_urls,
      final String? blob_ref,
      final double? latitude,
      final double? longitude,
      final String? name,
      final String? country,
      final String? state,
      final String? city,
      final String? county,
      final DateTime? created_at,
      final DateTime? updated_at}) = _$StoryEntityImpl;

  @override
  int? get id;
  @override
  UserDetailsEntity? get user_details;
  @override
  String? get media_url;
  @override
  String? get category;
  @override
  int? get views;
  @override
  String? get title;
  @override
  String? get media;
  @override
  String? get media_urls;
  @override
  String? get blob_ref;
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
  DateTime? get created_at;
  @override
  DateTime? get updated_at;
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
  String? get nick_name => throw _privateConstructorUsedError;
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
      {int id, String? email, String? name, String? nick_name, String? avatar});
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
    Object? nick_name = freezed,
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
      nick_name: freezed == nick_name
          ? _value.nick_name
          : nick_name // ignore: cast_nullable_to_non_nullable
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
      {int id, String? email, String? name, String? nick_name, String? avatar});
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
    Object? nick_name = freezed,
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
      nick_name: freezed == nick_name
          ? _value.nick_name
          : nick_name // ignore: cast_nullable_to_non_nullable
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
      {this.id = 0, this.email, this.name, this.nick_name, this.avatar});

  @override
  @JsonKey()
  final int id;
  @override
  final String? email;
  @override
  final String? name;
  @override
  final String? nick_name;
  @override
  final String? avatar;

  @override
  String toString() {
    return 'UserDetailsEntity(id: $id, email: $email, name: $name, nick_name: $nick_name, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDetailsEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nick_name, nick_name) ||
                other.nick_name == nick_name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, name, nick_name, avatar);

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
      final String? nick_name,
      final String? avatar}) = _$UserDetailsEntityImpl;

  @override
  int get id;
  @override
  String? get email;
  @override
  String? get name;
  @override
  String? get nick_name;
  @override
  String? get avatar;
  @override
  @JsonKey(ignore: true)
  _$$UserDetailsEntityImplCopyWith<_$UserDetailsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
