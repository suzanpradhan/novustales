// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../story_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoryResponse _$StoryResponseFromJson(Map<String, dynamic> json) {
  return _StoryResponse.fromJson(json);
}

/// @nodoc
mixin _$StoryResponse {
  int? get id => throw _privateConstructorUsedError;
  StoryUserDetail? get user_details => throw _privateConstructorUsedError;
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
  $StoryResponseCopyWith<StoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryResponseCopyWith<$Res> {
  factory $StoryResponseCopyWith(
          StoryResponse value, $Res Function(StoryResponse) then) =
      _$StoryResponseCopyWithImpl<$Res, StoryResponse>;
  @useResult
  $Res call(
      {int? id,
      StoryUserDetail? user_details,
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

  $StoryUserDetailCopyWith<$Res>? get user_details;
}

/// @nodoc
class _$StoryResponseCopyWithImpl<$Res, $Val extends StoryResponse>
    implements $StoryResponseCopyWith<$Res> {
  _$StoryResponseCopyWithImpl(this._value, this._then);

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
              as StoryUserDetail?,
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
  $StoryUserDetailCopyWith<$Res>? get user_details {
    if (_value.user_details == null) {
      return null;
    }

    return $StoryUserDetailCopyWith<$Res>(_value.user_details!, (value) {
      return _then(_value.copyWith(user_details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StoryResponseImplCopyWith<$Res>
    implements $StoryResponseCopyWith<$Res> {
  factory _$$StoryResponseImplCopyWith(
          _$StoryResponseImpl value, $Res Function(_$StoryResponseImpl) then) =
      __$$StoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      StoryUserDetail? user_details,
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
  $StoryUserDetailCopyWith<$Res>? get user_details;
}

/// @nodoc
class __$$StoryResponseImplCopyWithImpl<$Res>
    extends _$StoryResponseCopyWithImpl<$Res, _$StoryResponseImpl>
    implements _$$StoryResponseImplCopyWith<$Res> {
  __$$StoryResponseImplCopyWithImpl(
      _$StoryResponseImpl _value, $Res Function(_$StoryResponseImpl) _then)
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
    return _then(_$StoryResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user_details: freezed == user_details
          ? _value.user_details
          : user_details // ignore: cast_nullable_to_non_nullable
              as StoryUserDetail?,
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
@JsonSerializable(createToJson: false)
class _$StoryResponseImpl extends _StoryResponse {
  const _$StoryResponseImpl(
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
      this.updated_at})
      : super._();

  factory _$StoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final StoryUserDetail? user_details;
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
    return 'StoryResponse(id: $id, user_details: $user_details, media_url: $media_url, category: $category, views: $views, title: $title, media: $media, media_urls: $media_urls, blob_ref: $blob_ref, latitude: $latitude, longitude: $longitude, name: $name, country: $country, state: $state, city: $city, county: $county, created_at: $created_at, updated_at: $updated_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryResponseImpl &&
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

  @JsonKey(ignore: true)
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
  _$$StoryResponseImplCopyWith<_$StoryResponseImpl> get copyWith =>
      __$$StoryResponseImplCopyWithImpl<_$StoryResponseImpl>(this, _$identity);
}

abstract class _StoryResponse extends StoryResponse {
  const factory _StoryResponse(
      {final int? id,
      final StoryUserDetail? user_details,
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
      final DateTime? updated_at}) = _$StoryResponseImpl;
  const _StoryResponse._() : super._();

  factory _StoryResponse.fromJson(Map<String, dynamic> json) =
      _$StoryResponseImpl.fromJson;

  @override
  int? get id;
  @override
  StoryUserDetail? get user_details;
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
  _$$StoryResponseImplCopyWith<_$StoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryUserDetail _$StoryUserDetailFromJson(Map<String, dynamic> json) {
  return _StoryUserDetail.fromJson(json);
}

/// @nodoc
mixin _$StoryUserDetail {
  int? get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get nick_name => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoryUserDetailCopyWith<StoryUserDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryUserDetailCopyWith<$Res> {
  factory $StoryUserDetailCopyWith(
          StoryUserDetail value, $Res Function(StoryUserDetail) then) =
      _$StoryUserDetailCopyWithImpl<$Res, StoryUserDetail>;
  @useResult
  $Res call(
      {int? id,
      String? email,
      String? name,
      String? nick_name,
      String? avatar});
}

/// @nodoc
class _$StoryUserDetailCopyWithImpl<$Res, $Val extends StoryUserDetail>
    implements $StoryUserDetailCopyWith<$Res> {
  _$StoryUserDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? nick_name = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$StoryUserDetailImplCopyWith<$Res>
    implements $StoryUserDetailCopyWith<$Res> {
  factory _$$StoryUserDetailImplCopyWith(_$StoryUserDetailImpl value,
          $Res Function(_$StoryUserDetailImpl) then) =
      __$$StoryUserDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? email,
      String? name,
      String? nick_name,
      String? avatar});
}

/// @nodoc
class __$$StoryUserDetailImplCopyWithImpl<$Res>
    extends _$StoryUserDetailCopyWithImpl<$Res, _$StoryUserDetailImpl>
    implements _$$StoryUserDetailImplCopyWith<$Res> {
  __$$StoryUserDetailImplCopyWithImpl(
      _$StoryUserDetailImpl _value, $Res Function(_$StoryUserDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? nick_name = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_$StoryUserDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
@JsonSerializable(createToJson: false)
class _$StoryUserDetailImpl extends _StoryUserDetail {
  const _$StoryUserDetailImpl(
      {this.id, this.email, this.name, this.nick_name, this.avatar})
      : super._();

  factory _$StoryUserDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryUserDetailImplFromJson(json);

  @override
  final int? id;
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
    return 'StoryUserDetail(id: $id, email: $email, name: $name, nick_name: $nick_name, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryUserDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nick_name, nick_name) ||
                other.nick_name == nick_name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, name, nick_name, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryUserDetailImplCopyWith<_$StoryUserDetailImpl> get copyWith =>
      __$$StoryUserDetailImplCopyWithImpl<_$StoryUserDetailImpl>(
          this, _$identity);
}

abstract class _StoryUserDetail extends StoryUserDetail {
  const factory _StoryUserDetail(
      {final int? id,
      final String? email,
      final String? name,
      final String? nick_name,
      final String? avatar}) = _$StoryUserDetailImpl;
  const _StoryUserDetail._() : super._();

  factory _StoryUserDetail.fromJson(Map<String, dynamic> json) =
      _$StoryUserDetailImpl.fromJson;

  @override
  int? get id;
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
  _$$StoryUserDetailImplCopyWith<_$StoryUserDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
