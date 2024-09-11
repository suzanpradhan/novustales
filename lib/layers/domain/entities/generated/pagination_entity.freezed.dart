// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../pagination_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaginationEntity<T> {
  List<T>? get results => throw _privateConstructorUsedError;
  bool? get nextPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationEntityCopyWith<T, PaginationEntity<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationEntityCopyWith<T, $Res> {
  factory $PaginationEntityCopyWith(
          PaginationEntity<T> value, $Res Function(PaginationEntity<T>) then) =
      _$PaginationEntityCopyWithImpl<T, $Res, PaginationEntity<T>>;
  @useResult
  $Res call({List<T>? results, bool? nextPage});
}

/// @nodoc
class _$PaginationEntityCopyWithImpl<T, $Res, $Val extends PaginationEntity<T>>
    implements $PaginationEntityCopyWith<T, $Res> {
  _$PaginationEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_value.copyWith(
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationEntityImplCopyWith<T, $Res>
    implements $PaginationEntityCopyWith<T, $Res> {
  factory _$$PaginationEntityImplCopyWith(_$PaginationEntityImpl<T> value,
          $Res Function(_$PaginationEntityImpl<T>) then) =
      __$$PaginationEntityImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T>? results, bool? nextPage});
}

/// @nodoc
class __$$PaginationEntityImplCopyWithImpl<T, $Res>
    extends _$PaginationEntityCopyWithImpl<T, $Res, _$PaginationEntityImpl<T>>
    implements _$$PaginationEntityImplCopyWith<T, $Res> {
  __$$PaginationEntityImplCopyWithImpl(_$PaginationEntityImpl<T> _value,
      $Res Function(_$PaginationEntityImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = freezed,
    Object? nextPage = freezed,
  }) {
    return _then(_$PaginationEntityImpl<T>(
      results: freezed == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      nextPage: freezed == nextPage
          ? _value.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$PaginationEntityImpl<T> implements _PaginationEntity<T> {
  const _$PaginationEntityImpl({final List<T>? results, this.nextPage})
      : _results = results;

  final List<T>? _results;
  @override
  List<T>? get results {
    final value = _results;
    if (value == null) return null;
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? nextPage;

  @override
  String toString() {
    return 'PaginationEntity<$T>(results: $results, nextPage: $nextPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationEntityImpl<T> &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_results), nextPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationEntityImplCopyWith<T, _$PaginationEntityImpl<T>> get copyWith =>
      __$$PaginationEntityImplCopyWithImpl<T, _$PaginationEntityImpl<T>>(
          this, _$identity);
}

abstract class _PaginationEntity<T> implements PaginationEntity<T> {
  const factory _PaginationEntity(
      {final List<T>? results,
      final bool? nextPage}) = _$PaginationEntityImpl<T>;

  @override
  List<T>? get results;
  @override
  bool? get nextPage;
  @override
  @JsonKey(ignore: true)
  _$$PaginationEntityImplCopyWith<T, _$PaginationEntityImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
