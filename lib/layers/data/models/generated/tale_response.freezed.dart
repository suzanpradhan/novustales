// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../tale_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaleResponse _$TaleResponseFromJson(Map<String, dynamic> json) {
  return _TaleResponse.fromJson(json);
}

/// @nodoc
mixin _$TaleResponse {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "thumbnail_url")
  String? get thumbnail => throw _privateConstructorUsedError;
  @JsonKey(name: "category_name")
  String? get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: "latitude")
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: "longitude")
  double? get longitude => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaleResponseCopyWith<TaleResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaleResponseCopyWith<$Res> {
  factory $TaleResponseCopyWith(
          TaleResponse value, $Res Function(TaleResponse) then) =
      _$TaleResponseCopyWithImpl<$Res, TaleResponse>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      @JsonKey(name: "thumbnail_url") String? thumbnail,
      @JsonKey(name: "category_name") String? categoryName,
      @JsonKey(name: "latitude") double? latitude,
      @JsonKey(name: "longitude") double? longitude,
      double? distance});
}

/// @nodoc
class _$TaleResponseCopyWithImpl<$Res, $Val extends TaleResponse>
    implements $TaleResponseCopyWith<$Res> {
  _$TaleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? thumbnail = freezed,
    Object? categoryName = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaleResponseImplCopyWith<$Res>
    implements $TaleResponseCopyWith<$Res> {
  factory _$$TaleResponseImplCopyWith(
          _$TaleResponseImpl value, $Res Function(_$TaleResponseImpl) then) =
      __$$TaleResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      @JsonKey(name: "thumbnail_url") String? thumbnail,
      @JsonKey(name: "category_name") String? categoryName,
      @JsonKey(name: "latitude") double? latitude,
      @JsonKey(name: "longitude") double? longitude,
      double? distance});
}

/// @nodoc
class __$$TaleResponseImplCopyWithImpl<$Res>
    extends _$TaleResponseCopyWithImpl<$Res, _$TaleResponseImpl>
    implements _$$TaleResponseImplCopyWith<$Res> {
  __$$TaleResponseImplCopyWithImpl(
      _$TaleResponseImpl _value, $Res Function(_$TaleResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? thumbnail = freezed,
    Object? categoryName = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? distance = freezed,
  }) {
    return _then(_$TaleResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$TaleResponseImpl extends _TaleResponse {
  const _$TaleResponseImpl(
      {this.id,
      this.title,
      this.description,
      @JsonKey(name: "thumbnail_url") this.thumbnail,
      @JsonKey(name: "category_name") this.categoryName,
      @JsonKey(name: "latitude") this.latitude,
      @JsonKey(name: "longitude") this.longitude,
      this.distance})
      : super._();

  factory _$TaleResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaleResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  @JsonKey(name: "thumbnail_url")
  final String? thumbnail;
  @override
  @JsonKey(name: "category_name")
  final String? categoryName;
  @override
  @JsonKey(name: "latitude")
  final double? latitude;
  @override
  @JsonKey(name: "longitude")
  final double? longitude;
  @override
  final double? distance;

  @override
  String toString() {
    return 'TaleResponse(id: $id, title: $title, description: $description, thumbnail: $thumbnail, categoryName: $categoryName, latitude: $latitude, longitude: $longitude, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaleResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      thumbnail, categoryName, latitude, longitude, distance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaleResponseImplCopyWith<_$TaleResponseImpl> get copyWith =>
      __$$TaleResponseImplCopyWithImpl<_$TaleResponseImpl>(this, _$identity);
}

abstract class _TaleResponse extends TaleResponse {
  const factory _TaleResponse(
      {final int? id,
      final String? title,
      final String? description,
      @JsonKey(name: "thumbnail_url") final String? thumbnail,
      @JsonKey(name: "category_name") final String? categoryName,
      @JsonKey(name: "latitude") final double? latitude,
      @JsonKey(name: "longitude") final double? longitude,
      final double? distance}) = _$TaleResponseImpl;
  const _TaleResponse._() : super._();

  factory _TaleResponse.fromJson(Map<String, dynamic> json) =
      _$TaleResponseImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  @JsonKey(name: "thumbnail_url")
  String? get thumbnail;
  @override
  @JsonKey(name: "category_name")
  String? get categoryName;
  @override
  @JsonKey(name: "latitude")
  double? get latitude;
  @override
  @JsonKey(name: "longitude")
  double? get longitude;
  @override
  double? get distance;
  @override
  @JsonKey(ignore: true)
  _$$TaleResponseImplCopyWith<_$TaleResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
