// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../search_stories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchStoriesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String search) registerSearchString,
    required TResult Function(String categoryName) registerCategoryName,
    required TResult Function() attempt,
    required TResult Function() paginate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search)? registerSearchString,
    TResult? Function(String categoryName)? registerCategoryName,
    TResult? Function()? attempt,
    TResult? Function()? paginate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? registerSearchString,
    TResult Function(String categoryName)? registerCategoryName,
    TResult Function()? attempt,
    TResult Function()? paginate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegisterSearchString value) registerSearchString,
    required TResult Function(_RegisterCategoryName value) registerCategoryName,
    required TResult Function(_Attempt value) attempt,
    required TResult Function(_Paginate value) paginate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegisterSearchString value)? registerSearchString,
    TResult? Function(_RegisterCategoryName value)? registerCategoryName,
    TResult? Function(_Attempt value)? attempt,
    TResult? Function(_Paginate value)? paginate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegisterSearchString value)? registerSearchString,
    TResult Function(_RegisterCategoryName value)? registerCategoryName,
    TResult Function(_Attempt value)? attempt,
    TResult Function(_Paginate value)? paginate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStoriesEventCopyWith<$Res> {
  factory $SearchStoriesEventCopyWith(
          SearchStoriesEvent value, $Res Function(SearchStoriesEvent) then) =
      _$SearchStoriesEventCopyWithImpl<$Res, SearchStoriesEvent>;
}

/// @nodoc
class _$SearchStoriesEventCopyWithImpl<$Res, $Val extends SearchStoriesEvent>
    implements $SearchStoriesEventCopyWith<$Res> {
  _$SearchStoriesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RegisterSearchStringImplCopyWith<$Res> {
  factory _$$RegisterSearchStringImplCopyWith(_$RegisterSearchStringImpl value,
          $Res Function(_$RegisterSearchStringImpl) then) =
      __$$RegisterSearchStringImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String search});
}

/// @nodoc
class __$$RegisterSearchStringImplCopyWithImpl<$Res>
    extends _$SearchStoriesEventCopyWithImpl<$Res, _$RegisterSearchStringImpl>
    implements _$$RegisterSearchStringImplCopyWith<$Res> {
  __$$RegisterSearchStringImplCopyWithImpl(_$RegisterSearchStringImpl _value,
      $Res Function(_$RegisterSearchStringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? search = null,
  }) {
    return _then(_$RegisterSearchStringImpl(
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterSearchStringImpl implements _RegisterSearchString {
  const _$RegisterSearchStringImpl({this.search = ""});

  @override
  @JsonKey()
  final String search;

  @override
  String toString() {
    return 'SearchStoriesEvent.registerSearchString(search: $search)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterSearchStringImpl &&
            (identical(other.search, search) || other.search == search));
  }

  @override
  int get hashCode => Object.hash(runtimeType, search);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterSearchStringImplCopyWith<_$RegisterSearchStringImpl>
      get copyWith =>
          __$$RegisterSearchStringImplCopyWithImpl<_$RegisterSearchStringImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String search) registerSearchString,
    required TResult Function(String categoryName) registerCategoryName,
    required TResult Function() attempt,
    required TResult Function() paginate,
  }) {
    return registerSearchString(search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search)? registerSearchString,
    TResult? Function(String categoryName)? registerCategoryName,
    TResult? Function()? attempt,
    TResult? Function()? paginate,
  }) {
    return registerSearchString?.call(search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? registerSearchString,
    TResult Function(String categoryName)? registerCategoryName,
    TResult Function()? attempt,
    TResult Function()? paginate,
    required TResult orElse(),
  }) {
    if (registerSearchString != null) {
      return registerSearchString(search);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegisterSearchString value) registerSearchString,
    required TResult Function(_RegisterCategoryName value) registerCategoryName,
    required TResult Function(_Attempt value) attempt,
    required TResult Function(_Paginate value) paginate,
  }) {
    return registerSearchString(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegisterSearchString value)? registerSearchString,
    TResult? Function(_RegisterCategoryName value)? registerCategoryName,
    TResult? Function(_Attempt value)? attempt,
    TResult? Function(_Paginate value)? paginate,
  }) {
    return registerSearchString?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegisterSearchString value)? registerSearchString,
    TResult Function(_RegisterCategoryName value)? registerCategoryName,
    TResult Function(_Attempt value)? attempt,
    TResult Function(_Paginate value)? paginate,
    required TResult orElse(),
  }) {
    if (registerSearchString != null) {
      return registerSearchString(this);
    }
    return orElse();
  }
}

abstract class _RegisterSearchString implements SearchStoriesEvent {
  const factory _RegisterSearchString({final String search}) =
      _$RegisterSearchStringImpl;

  String get search;
  @JsonKey(ignore: true)
  _$$RegisterSearchStringImplCopyWith<_$RegisterSearchStringImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterCategoryNameImplCopyWith<$Res> {
  factory _$$RegisterCategoryNameImplCopyWith(_$RegisterCategoryNameImpl value,
          $Res Function(_$RegisterCategoryNameImpl) then) =
      __$$RegisterCategoryNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String categoryName});
}

/// @nodoc
class __$$RegisterCategoryNameImplCopyWithImpl<$Res>
    extends _$SearchStoriesEventCopyWithImpl<$Res, _$RegisterCategoryNameImpl>
    implements _$$RegisterCategoryNameImplCopyWith<$Res> {
  __$$RegisterCategoryNameImplCopyWithImpl(_$RegisterCategoryNameImpl _value,
      $Res Function(_$RegisterCategoryNameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
  }) {
    return _then(_$RegisterCategoryNameImpl(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterCategoryNameImpl implements _RegisterCategoryName {
  const _$RegisterCategoryNameImpl({this.categoryName = ""});

  @override
  @JsonKey()
  final String categoryName;

  @override
  String toString() {
    return 'SearchStoriesEvent.registerCategoryName(categoryName: $categoryName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterCategoryNameImpl &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterCategoryNameImplCopyWith<_$RegisterCategoryNameImpl>
      get copyWith =>
          __$$RegisterCategoryNameImplCopyWithImpl<_$RegisterCategoryNameImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String search) registerSearchString,
    required TResult Function(String categoryName) registerCategoryName,
    required TResult Function() attempt,
    required TResult Function() paginate,
  }) {
    return registerCategoryName(categoryName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search)? registerSearchString,
    TResult? Function(String categoryName)? registerCategoryName,
    TResult? Function()? attempt,
    TResult? Function()? paginate,
  }) {
    return registerCategoryName?.call(categoryName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? registerSearchString,
    TResult Function(String categoryName)? registerCategoryName,
    TResult Function()? attempt,
    TResult Function()? paginate,
    required TResult orElse(),
  }) {
    if (registerCategoryName != null) {
      return registerCategoryName(categoryName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegisterSearchString value) registerSearchString,
    required TResult Function(_RegisterCategoryName value) registerCategoryName,
    required TResult Function(_Attempt value) attempt,
    required TResult Function(_Paginate value) paginate,
  }) {
    return registerCategoryName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegisterSearchString value)? registerSearchString,
    TResult? Function(_RegisterCategoryName value)? registerCategoryName,
    TResult? Function(_Attempt value)? attempt,
    TResult? Function(_Paginate value)? paginate,
  }) {
    return registerCategoryName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegisterSearchString value)? registerSearchString,
    TResult Function(_RegisterCategoryName value)? registerCategoryName,
    TResult Function(_Attempt value)? attempt,
    TResult Function(_Paginate value)? paginate,
    required TResult orElse(),
  }) {
    if (registerCategoryName != null) {
      return registerCategoryName(this);
    }
    return orElse();
  }
}

abstract class _RegisterCategoryName implements SearchStoriesEvent {
  const factory _RegisterCategoryName({final String categoryName}) =
      _$RegisterCategoryNameImpl;

  String get categoryName;
  @JsonKey(ignore: true)
  _$$RegisterCategoryNameImplCopyWith<_$RegisterCategoryNameImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AttemptImplCopyWith<$Res> {
  factory _$$AttemptImplCopyWith(
          _$AttemptImpl value, $Res Function(_$AttemptImpl) then) =
      __$$AttemptImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AttemptImplCopyWithImpl<$Res>
    extends _$SearchStoriesEventCopyWithImpl<$Res, _$AttemptImpl>
    implements _$$AttemptImplCopyWith<$Res> {
  __$$AttemptImplCopyWithImpl(
      _$AttemptImpl _value, $Res Function(_$AttemptImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AttemptImpl implements _Attempt {
  const _$AttemptImpl();

  @override
  String toString() {
    return 'SearchStoriesEvent.attempt()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AttemptImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String search) registerSearchString,
    required TResult Function(String categoryName) registerCategoryName,
    required TResult Function() attempt,
    required TResult Function() paginate,
  }) {
    return attempt();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search)? registerSearchString,
    TResult? Function(String categoryName)? registerCategoryName,
    TResult? Function()? attempt,
    TResult? Function()? paginate,
  }) {
    return attempt?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? registerSearchString,
    TResult Function(String categoryName)? registerCategoryName,
    TResult Function()? attempt,
    TResult Function()? paginate,
    required TResult orElse(),
  }) {
    if (attempt != null) {
      return attempt();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegisterSearchString value) registerSearchString,
    required TResult Function(_RegisterCategoryName value) registerCategoryName,
    required TResult Function(_Attempt value) attempt,
    required TResult Function(_Paginate value) paginate,
  }) {
    return attempt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegisterSearchString value)? registerSearchString,
    TResult? Function(_RegisterCategoryName value)? registerCategoryName,
    TResult? Function(_Attempt value)? attempt,
    TResult? Function(_Paginate value)? paginate,
  }) {
    return attempt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegisterSearchString value)? registerSearchString,
    TResult Function(_RegisterCategoryName value)? registerCategoryName,
    TResult Function(_Attempt value)? attempt,
    TResult Function(_Paginate value)? paginate,
    required TResult orElse(),
  }) {
    if (attempt != null) {
      return attempt(this);
    }
    return orElse();
  }
}

abstract class _Attempt implements SearchStoriesEvent {
  const factory _Attempt() = _$AttemptImpl;
}

/// @nodoc
abstract class _$$PaginateImplCopyWith<$Res> {
  factory _$$PaginateImplCopyWith(
          _$PaginateImpl value, $Res Function(_$PaginateImpl) then) =
      __$$PaginateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PaginateImplCopyWithImpl<$Res>
    extends _$SearchStoriesEventCopyWithImpl<$Res, _$PaginateImpl>
    implements _$$PaginateImplCopyWith<$Res> {
  __$$PaginateImplCopyWithImpl(
      _$PaginateImpl _value, $Res Function(_$PaginateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PaginateImpl implements _Paginate {
  const _$PaginateImpl();

  @override
  String toString() {
    return 'SearchStoriesEvent.paginate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PaginateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String search) registerSearchString,
    required TResult Function(String categoryName) registerCategoryName,
    required TResult Function() attempt,
    required TResult Function() paginate,
  }) {
    return paginate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String search)? registerSearchString,
    TResult? Function(String categoryName)? registerCategoryName,
    TResult? Function()? attempt,
    TResult? Function()? paginate,
  }) {
    return paginate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String search)? registerSearchString,
    TResult Function(String categoryName)? registerCategoryName,
    TResult Function()? attempt,
    TResult Function()? paginate,
    required TResult orElse(),
  }) {
    if (paginate != null) {
      return paginate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RegisterSearchString value) registerSearchString,
    required TResult Function(_RegisterCategoryName value) registerCategoryName,
    required TResult Function(_Attempt value) attempt,
    required TResult Function(_Paginate value) paginate,
  }) {
    return paginate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RegisterSearchString value)? registerSearchString,
    TResult? Function(_RegisterCategoryName value)? registerCategoryName,
    TResult? Function(_Attempt value)? attempt,
    TResult? Function(_Paginate value)? paginate,
  }) {
    return paginate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RegisterSearchString value)? registerSearchString,
    TResult Function(_RegisterCategoryName value)? registerCategoryName,
    TResult Function(_Attempt value)? attempt,
    TResult Function(_Paginate value)? paginate,
    required TResult orElse(),
  }) {
    if (paginate != null) {
      return paginate(this);
    }
    return orElse();
  }
}

abstract class _Paginate implements SearchStoriesEvent {
  const factory _Paginate() = _$PaginateImpl;
}

/// @nodoc
mixin _$SearchStoriesState {
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  SearchInput get search => throw _privateConstructorUsedError;
  ArrayInput get categoryNames =>
      throw _privateConstructorUsedError; // @Default(true) bool isFirstAttempt,
  bool get isFirstAttempt => throw _privateConstructorUsedError;
  bool get hasMoreData => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<StoryEntity>? get filterData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStoriesStateCopyWith<SearchStoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStoriesStateCopyWith<$Res> {
  factory $SearchStoriesStateCopyWith(
          SearchStoriesState value, $Res Function(SearchStoriesState) then) =
      _$SearchStoriesStateCopyWithImpl<$Res, SearchStoriesState>;
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      SearchInput search,
      ArrayInput categoryNames,
      bool isFirstAttempt,
      bool hasMoreData,
      String? message,
      List<StoryEntity>? filterData});
}

/// @nodoc
class _$SearchStoriesStateCopyWithImpl<$Res, $Val extends SearchStoriesState>
    implements $SearchStoriesStateCopyWith<$Res> {
  _$SearchStoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? search = null,
    Object? categoryNames = null,
    Object? isFirstAttempt = null,
    Object? hasMoreData = null,
    Object? message = freezed,
    Object? filterData = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as SearchInput,
      categoryNames: null == categoryNames
          ? _value.categoryNames
          : categoryNames // ignore: cast_nullable_to_non_nullable
              as ArrayInput,
      isFirstAttempt: null == isFirstAttempt
          ? _value.isFirstAttempt
          : isFirstAttempt // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      filterData: freezed == filterData
          ? _value.filterData
          : filterData // ignore: cast_nullable_to_non_nullable
              as List<StoryEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchStoriesStateImplCopyWith<$Res>
    implements $SearchStoriesStateCopyWith<$Res> {
  factory _$$SearchStoriesStateImplCopyWith(_$SearchStoriesStateImpl value,
          $Res Function(_$SearchStoriesStateImpl) then) =
      __$$SearchStoriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      SearchInput search,
      ArrayInput categoryNames,
      bool isFirstAttempt,
      bool hasMoreData,
      String? message,
      List<StoryEntity>? filterData});
}

/// @nodoc
class __$$SearchStoriesStateImplCopyWithImpl<$Res>
    extends _$SearchStoriesStateCopyWithImpl<$Res, _$SearchStoriesStateImpl>
    implements _$$SearchStoriesStateImplCopyWith<$Res> {
  __$$SearchStoriesStateImplCopyWithImpl(_$SearchStoriesStateImpl _value,
      $Res Function(_$SearchStoriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? search = null,
    Object? categoryNames = null,
    Object? isFirstAttempt = null,
    Object? hasMoreData = null,
    Object? message = freezed,
    Object? filterData = freezed,
  }) {
    return _then(_$SearchStoriesStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as SearchInput,
      categoryNames: null == categoryNames
          ? _value.categoryNames
          : categoryNames // ignore: cast_nullable_to_non_nullable
              as ArrayInput,
      isFirstAttempt: null == isFirstAttempt
          ? _value.isFirstAttempt
          : isFirstAttempt // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      filterData: freezed == filterData
          ? _value._filterData
          : filterData // ignore: cast_nullable_to_non_nullable
              as List<StoryEntity>?,
    ));
  }
}

/// @nodoc

class _$SearchStoriesStateImpl implements _SearchStoriesState {
  const _$SearchStoriesStateImpl(
      {this.status = FormzSubmissionStatus.initial,
      this.search = const SearchInput.pure(),
      this.categoryNames = const ArrayInput.pure(),
      this.isFirstAttempt = true,
      this.hasMoreData = true,
      this.message,
      final List<StoryEntity>? filterData})
      : _filterData = filterData;

  @override
  @JsonKey()
  final FormzSubmissionStatus status;
  @override
  @JsonKey()
  final SearchInput search;
  @override
  @JsonKey()
  final ArrayInput categoryNames;
// @Default(true) bool isFirstAttempt,
  @override
  @JsonKey()
  final bool isFirstAttempt;
  @override
  @JsonKey()
  final bool hasMoreData;
  @override
  final String? message;
  final List<StoryEntity>? _filterData;
  @override
  List<StoryEntity>? get filterData {
    final value = _filterData;
    if (value == null) return null;
    if (_filterData is EqualUnmodifiableListView) return _filterData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchStoriesState(status: $status, search: $search, categoryNames: $categoryNames, isFirstAttempt: $isFirstAttempt, hasMoreData: $hasMoreData, message: $message, filterData: $filterData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStoriesStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.categoryNames, categoryNames) ||
                other.categoryNames == categoryNames) &&
            (identical(other.isFirstAttempt, isFirstAttempt) ||
                other.isFirstAttempt == isFirstAttempt) &&
            (identical(other.hasMoreData, hasMoreData) ||
                other.hasMoreData == hasMoreData) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._filterData, _filterData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      search,
      categoryNames,
      isFirstAttempt,
      hasMoreData,
      message,
      const DeepCollectionEquality().hash(_filterData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStoriesStateImplCopyWith<_$SearchStoriesStateImpl> get copyWith =>
      __$$SearchStoriesStateImplCopyWithImpl<_$SearchStoriesStateImpl>(
          this, _$identity);
}

abstract class _SearchStoriesState implements SearchStoriesState {
  const factory _SearchStoriesState(
      {final FormzSubmissionStatus status,
      final SearchInput search,
      final ArrayInput categoryNames,
      final bool isFirstAttempt,
      final bool hasMoreData,
      final String? message,
      final List<StoryEntity>? filterData}) = _$SearchStoriesStateImpl;

  @override
  FormzSubmissionStatus get status;
  @override
  SearchInput get search;
  @override
  ArrayInput get categoryNames;
  @override // @Default(true) bool isFirstAttempt,
  bool get isFirstAttempt;
  @override
  bool get hasMoreData;
  @override
  String? get message;
  @override
  List<StoryEntity>? get filterData;
  @override
  @JsonKey(ignore: true)
  _$$SearchStoriesStateImplCopyWith<_$SearchStoriesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
