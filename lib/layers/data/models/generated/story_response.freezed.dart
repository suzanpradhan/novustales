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
  int get id => throw _privateConstructorUsedError;
  StoryUserDetail get userDetails => throw _privateConstructorUsedError;
  String get mediaUrl => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get views => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get media => throw _privateConstructorUsedError;
  String get mediaUrls => throw _privateConstructorUsedError;
  String? get blobRef => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String? get county => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

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
      {int id,
      StoryUserDetail userDetails,
      String mediaUrl,
      String category,
      int views,
      String title,
      String? media,
      String mediaUrls,
      String? blobRef,
      double latitude,
      double longitude,
      String name,
      String country,
      String state,
      String city,
      String? county,
      DateTime createdAt,
      DateTime updatedAt});

  $StoryUserDetailCopyWith<$Res> get userDetails;
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
    Object? id = null,
    Object? userDetails = null,
    Object? mediaUrl = null,
    Object? category = null,
    Object? views = null,
    Object? title = null,
    Object? media = freezed,
    Object? mediaUrls = null,
    Object? blobRef = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? name = null,
    Object? country = null,
    Object? state = null,
    Object? city = null,
    Object? county = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userDetails: null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as StoryUserDetail,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrls: null == mediaUrls
          ? _value.mediaUrls
          : mediaUrls // ignore: cast_nullable_to_non_nullable
              as String,
      blobRef: freezed == blobRef
          ? _value.blobRef
          : blobRef // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      county: freezed == county
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryUserDetailCopyWith<$Res> get userDetails {
    return $StoryUserDetailCopyWith<$Res>(_value.userDetails, (value) {
      return _then(_value.copyWith(userDetails: value) as $Val);
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
      {int id,
      StoryUserDetail userDetails,
      String mediaUrl,
      String category,
      int views,
      String title,
      String? media,
      String mediaUrls,
      String? blobRef,
      double latitude,
      double longitude,
      String name,
      String country,
      String state,
      String city,
      String? county,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $StoryUserDetailCopyWith<$Res> get userDetails;
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
    Object? id = null,
    Object? userDetails = null,
    Object? mediaUrl = null,
    Object? category = null,
    Object? views = null,
    Object? title = null,
    Object? media = freezed,
    Object? mediaUrls = null,
    Object? blobRef = freezed,
    Object? latitude = null,
    Object? longitude = null,
    Object? name = null,
    Object? country = null,
    Object? state = null,
    Object? city = null,
    Object? county = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$StoryResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userDetails: null == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as StoryUserDetail,
      mediaUrl: null == mediaUrl
          ? _value.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaUrls: null == mediaUrls
          ? _value.mediaUrls
          : mediaUrls // ignore: cast_nullable_to_non_nullable
              as String,
      blobRef: freezed == blobRef
          ? _value.blobRef
          : blobRef // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      county: freezed == county
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$StoryResponseImpl extends _StoryResponse {
  const _$StoryResponseImpl(
      {this.id = 0,
      required this.userDetails,
      required this.mediaUrl,
      required this.category,
      required this.views,
      required this.title,
      this.media,
      required this.mediaUrls,
      this.blobRef,
      required this.latitude,
      required this.longitude,
      required this.name,
      required this.country,
      required this.state,
      required this.city,
      this.county,
      required this.createdAt,
      required this.updatedAt})
      : super._();

  factory _$StoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryResponseImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  final StoryUserDetail userDetails;
  @override
  final String mediaUrl;
  @override
  final String category;
  @override
  final int views;
  @override
  final String title;
  @override
  final String? media;
  @override
  final String mediaUrls;
  @override
  final String? blobRef;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String name;
  @override
  final String country;
  @override
  final String state;
  @override
  final String city;
  @override
  final String? county;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'StoryResponse(id: $id, userDetails: $userDetails, mediaUrl: $mediaUrl, category: $category, views: $views, title: $title, media: $media, mediaUrls: $mediaUrls, blobRef: $blobRef, latitude: $latitude, longitude: $longitude, name: $name, country: $country, state: $state, city: $city, county: $county, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryResponseImpl &&
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

  @JsonKey(ignore: true)
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
  _$$StoryResponseImplCopyWith<_$StoryResponseImpl> get copyWith =>
      __$$StoryResponseImplCopyWithImpl<_$StoryResponseImpl>(this, _$identity);
}

abstract class _StoryResponse extends StoryResponse {
  const factory _StoryResponse(
      {final int id,
      required final StoryUserDetail userDetails,
      required final String mediaUrl,
      required final String category,
      required final int views,
      required final String title,
      final String? media,
      required final String mediaUrls,
      final String? blobRef,
      required final double latitude,
      required final double longitude,
      required final String name,
      required final String country,
      required final String state,
      required final String city,
      final String? county,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$StoryResponseImpl;
  const _StoryResponse._() : super._();

  factory _StoryResponse.fromJson(Map<String, dynamic> json) =
      _$StoryResponseImpl.fromJson;

  @override
  int get id;
  @override
  StoryUserDetail get userDetails;
  @override
  String get mediaUrl;
  @override
  String get category;
  @override
  int get views;
  @override
  String get title;
  @override
  String? get media;
  @override
  String get mediaUrls;
  @override
  String? get blobRef;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  String get name;
  @override
  String get country;
  @override
  String get state;
  @override
  String get city;
  @override
  String? get county;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
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
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get nickName => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;

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
      {int id, String email, String name, String? nickName, String avatar});
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
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? nickName = freezed,
    Object? avatar = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
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
      {int id, String email, String name, String? nickName, String avatar});
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
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? nickName = freezed,
    Object? avatar = null,
  }) {
    return _then(_$StoryUserDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: freezed == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$StoryUserDetailImpl extends _StoryUserDetail {
  const _$StoryUserDetailImpl(
      {required this.id,
      required this.email,
      required this.name,
      this.nickName,
      required this.avatar})
      : super._();

  factory _$StoryUserDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryUserDetailImplFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String name;
  @override
  final String? nickName;
  @override
  final String avatar;

  @override
  String toString() {
    return 'StoryUserDetail(id: $id, email: $email, name: $name, nickName: $nickName, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryUserDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, name, nickName, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryUserDetailImplCopyWith<_$StoryUserDetailImpl> get copyWith =>
      __$$StoryUserDetailImplCopyWithImpl<_$StoryUserDetailImpl>(
          this, _$identity);
}

abstract class _StoryUserDetail extends StoryUserDetail {
  const factory _StoryUserDetail(
      {required final int id,
      required final String email,
      required final String name,
      final String? nickName,
      required final String avatar}) = _$StoryUserDetailImpl;
  const _StoryUserDetail._() : super._();

  factory _StoryUserDetail.fromJson(Map<String, dynamic> json) =
      _$StoryUserDetailImpl.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get name;
  @override
  String? get nickName;
  @override
  String get avatar;
  @override
  @JsonKey(ignore: true)
  _$$StoryUserDetailImplCopyWith<_$StoryUserDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
