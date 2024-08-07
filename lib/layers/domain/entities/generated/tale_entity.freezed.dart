// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../tale_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaleEntity {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double? get distance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaleEntityCopyWith<TaleEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaleEntityCopyWith<$Res> {
  factory $TaleEntityCopyWith(
          TaleEntity value, $Res Function(TaleEntity) then) =
      _$TaleEntityCopyWithImpl<$Res, TaleEntity>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      String? thumbnail,
      String? categoryName,
      double? latitude,
      double? longitude,
      double? distance});
}

/// @nodoc
class _$TaleEntityCopyWithImpl<$Res, $Val extends TaleEntity>
    implements $TaleEntityCopyWith<$Res> {
  _$TaleEntityCopyWithImpl(this._value, this._then);

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
abstract class _$$TaleEntityImplCopyWith<$Res>
    implements $TaleEntityCopyWith<$Res> {
  factory _$$TaleEntityImplCopyWith(
          _$TaleEntityImpl value, $Res Function(_$TaleEntityImpl) then) =
      __$$TaleEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      String? thumbnail,
      String? categoryName,
      double? latitude,
      double? longitude,
      double? distance});
}

/// @nodoc
class __$$TaleEntityImplCopyWithImpl<$Res>
    extends _$TaleEntityCopyWithImpl<$Res, _$TaleEntityImpl>
    implements _$$TaleEntityImplCopyWith<$Res> {
  __$$TaleEntityImplCopyWithImpl(
      _$TaleEntityImpl _value, $Res Function(_$TaleEntityImpl) _then)
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
    return _then(_$TaleEntityImpl(
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

class _$TaleEntityImpl implements _TaleEntity {
  const _$TaleEntityImpl(
      {this.id,
      this.title,
      this.description,
      this.thumbnail,
      this.categoryName,
      this.latitude,
      this.longitude,
      this.distance});

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? thumbnail;
  @override
  final String? categoryName;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final double? distance;

  @override
  String toString() {
    return 'TaleEntity(id: $id, title: $title, description: $description, thumbnail: $thumbnail, categoryName: $categoryName, latitude: $latitude, longitude: $longitude, distance: $distance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaleEntityImpl &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      thumbnail, categoryName, latitude, longitude, distance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaleEntityImplCopyWith<_$TaleEntityImpl> get copyWith =>
      __$$TaleEntityImplCopyWithImpl<_$TaleEntityImpl>(this, _$identity);
}

abstract class _TaleEntity implements TaleEntity {
  const factory _TaleEntity(
      {final int? id,
      final String? title,
      final String? description,
      final String? thumbnail,
      final String? categoryName,
      final double? latitude,
      final double? longitude,
      final double? distance}) = _$TaleEntityImpl;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get thumbnail;
  @override
  String? get categoryName;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  double? get distance;
  @override
  @JsonKey(ignore: true)
  _$$TaleEntityImplCopyWith<_$TaleEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
