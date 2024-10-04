// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../search_tales.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchTalesParams _$SearchTalesParamsFromJson(Map<String, dynamic> json) {
  return _SearchTalesParams.fromJson(json);
}

/// @nodoc
mixin _$SearchTalesParams {
  @JsonKey(name: "search")
  String get searchText => throw _privateConstructorUsedError;

  /// Serializes this SearchTalesParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchTalesParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchTalesParamsCopyWith<SearchTalesParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTalesParamsCopyWith<$Res> {
  factory $SearchTalesParamsCopyWith(
          SearchTalesParams value, $Res Function(SearchTalesParams) then) =
      _$SearchTalesParamsCopyWithImpl<$Res, SearchTalesParams>;
  @useResult
  $Res call({@JsonKey(name: "search") String searchText});
}

/// @nodoc
class _$SearchTalesParamsCopyWithImpl<$Res, $Val extends SearchTalesParams>
    implements $SearchTalesParamsCopyWith<$Res> {
  _$SearchTalesParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchTalesParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
  }) {
    return _then(_value.copyWith(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchTalesParamsImplCopyWith<$Res>
    implements $SearchTalesParamsCopyWith<$Res> {
  factory _$$SearchTalesParamsImplCopyWith(_$SearchTalesParamsImpl value,
          $Res Function(_$SearchTalesParamsImpl) then) =
      __$$SearchTalesParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "search") String searchText});
}

/// @nodoc
class __$$SearchTalesParamsImplCopyWithImpl<$Res>
    extends _$SearchTalesParamsCopyWithImpl<$Res, _$SearchTalesParamsImpl>
    implements _$$SearchTalesParamsImplCopyWith<$Res> {
  __$$SearchTalesParamsImplCopyWithImpl(_$SearchTalesParamsImpl _value,
      $Res Function(_$SearchTalesParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchTalesParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchText = null,
  }) {
    return _then(_$SearchTalesParamsImpl(
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchTalesParamsImpl implements _SearchTalesParams {
  const _$SearchTalesParamsImpl(
      {@JsonKey(name: "search") required this.searchText});

  factory _$SearchTalesParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchTalesParamsImplFromJson(json);

  @override
  @JsonKey(name: "search")
  final String searchText;

  @override
  String toString() {
    return 'SearchTalesParams(searchText: $searchText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTalesParamsImpl &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, searchText);

  /// Create a copy of SearchTalesParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTalesParamsImplCopyWith<_$SearchTalesParamsImpl> get copyWith =>
      __$$SearchTalesParamsImplCopyWithImpl<_$SearchTalesParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchTalesParamsImplToJson(
      this,
    );
  }
}

abstract class _SearchTalesParams implements SearchTalesParams {
  const factory _SearchTalesParams(
          {@JsonKey(name: "search") required final String searchText}) =
      _$SearchTalesParamsImpl;

  factory _SearchTalesParams.fromJson(Map<String, dynamic> json) =
      _$SearchTalesParamsImpl.fromJson;

  @override
  @JsonKey(name: "search")
  String get searchText;

  /// Create a copy of SearchTalesParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchTalesParamsImplCopyWith<_$SearchTalesParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
