// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../get_stories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchStoryParams _$SearchStoryParamsFromJson(Map<String, dynamic> json) {
  return _SearchStoryParams.fromJson(json);
}

/// @nodoc
mixin _$SearchStoryParams {
  int get page => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  @JsonKey(name: "category__name__in")
  List<String>? get categoryNameIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchStoryParamsCopyWith<SearchStoryParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStoryParamsCopyWith<$Res> {
  factory $SearchStoryParamsCopyWith(
          SearchStoryParams value, $Res Function(SearchStoryParams) then) =
      _$SearchStoryParamsCopyWithImpl<$Res, SearchStoryParams>;
  @useResult
  $Res call(
      {int page,
      String? search,
      @JsonKey(name: "category__name__in") List<String>? categoryNameIn});
}

/// @nodoc
class _$SearchStoryParamsCopyWithImpl<$Res, $Val extends SearchStoryParams>
    implements $SearchStoryParamsCopyWith<$Res> {
  _$SearchStoryParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? search = freezed,
    Object? categoryNameIn = freezed,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryNameIn: freezed == categoryNameIn
          ? _value.categoryNameIn
          : categoryNameIn // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchStoryParamsImplCopyWith<$Res>
    implements $SearchStoryParamsCopyWith<$Res> {
  factory _$$SearchStoryParamsImplCopyWith(_$SearchStoryParamsImpl value,
          $Res Function(_$SearchStoryParamsImpl) then) =
      __$$SearchStoryParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      String? search,
      @JsonKey(name: "category__name__in") List<String>? categoryNameIn});
}

/// @nodoc
class __$$SearchStoryParamsImplCopyWithImpl<$Res>
    extends _$SearchStoryParamsCopyWithImpl<$Res, _$SearchStoryParamsImpl>
    implements _$$SearchStoryParamsImplCopyWith<$Res> {
  __$$SearchStoryParamsImplCopyWithImpl(_$SearchStoryParamsImpl _value,
      $Res Function(_$SearchStoryParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? search = freezed,
    Object? categoryNameIn = freezed,
  }) {
    return _then(_$SearchStoryParamsImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryNameIn: freezed == categoryNameIn
          ? _value._categoryNameIn
          : categoryNameIn // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchStoryParamsImpl implements _SearchStoryParams {
  const _$SearchStoryParamsImpl(
      {this.page = 1,
      this.search,
      @JsonKey(name: "category__name__in") final List<String>? categoryNameIn})
      : _categoryNameIn = categoryNameIn;

  factory _$SearchStoryParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchStoryParamsImplFromJson(json);

  @override
  @JsonKey()
  final int page;
  @override
  final String? search;
  final List<String>? _categoryNameIn;
  @override
  @JsonKey(name: "category__name__in")
  List<String>? get categoryNameIn {
    final value = _categoryNameIn;
    if (value == null) return null;
    if (_categoryNameIn is EqualUnmodifiableListView) return _categoryNameIn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchStoryParams(page: $page, search: $search, categoryNameIn: $categoryNameIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStoryParamsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.search, search) || other.search == search) &&
            const DeepCollectionEquality()
                .equals(other._categoryNameIn, _categoryNameIn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, search,
      const DeepCollectionEquality().hash(_categoryNameIn));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStoryParamsImplCopyWith<_$SearchStoryParamsImpl> get copyWith =>
      __$$SearchStoryParamsImplCopyWithImpl<_$SearchStoryParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchStoryParamsImplToJson(
      this,
    );
  }
}

abstract class _SearchStoryParams implements SearchStoryParams {
  const factory _SearchStoryParams(
      {final int page,
      final String? search,
      @JsonKey(name: "category__name__in")
      final List<String>? categoryNameIn}) = _$SearchStoryParamsImpl;

  factory _SearchStoryParams.fromJson(Map<String, dynamic> json) =
      _$SearchStoryParamsImpl.fromJson;

  @override
  int get page;
  @override
  String? get search;
  @override
  @JsonKey(name: "category__name__in")
  List<String>? get categoryNameIn;
  @override
  @JsonKey(ignore: true)
  _$$SearchStoryParamsImplCopyWith<_$SearchStoryParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
