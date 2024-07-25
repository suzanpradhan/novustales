// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthetication,
    required TResult Function() clearSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthetication,
    TResult? Function()? clearSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthetication,
    TResult Function()? clearSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthentication value) checkAuthetication,
    required TResult Function(_ClearSession value) clearSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthentication value)? checkAuthetication,
    TResult? Function(_ClearSession value)? clearSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthentication value)? checkAuthetication,
    TResult Function(_ClearSession value)? clearSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CheckAuthenticationImplCopyWith<$Res> {
  factory _$$CheckAuthenticationImplCopyWith(_$CheckAuthenticationImpl value,
          $Res Function(_$CheckAuthenticationImpl) then) =
      __$$CheckAuthenticationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthenticationImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$CheckAuthenticationImpl>
    implements _$$CheckAuthenticationImplCopyWith<$Res> {
  __$$CheckAuthenticationImplCopyWithImpl(_$CheckAuthenticationImpl _value,
      $Res Function(_$CheckAuthenticationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckAuthenticationImpl implements _CheckAuthentication {
  const _$CheckAuthenticationImpl();

  @override
  String toString() {
    return 'AppEvent.checkAuthetication()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckAuthenticationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthetication,
    required TResult Function() clearSession,
  }) {
    return checkAuthetication();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthetication,
    TResult? Function()? clearSession,
  }) {
    return checkAuthetication?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthetication,
    TResult Function()? clearSession,
    required TResult orElse(),
  }) {
    if (checkAuthetication != null) {
      return checkAuthetication();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthentication value) checkAuthetication,
    required TResult Function(_ClearSession value) clearSession,
  }) {
    return checkAuthetication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthentication value)? checkAuthetication,
    TResult? Function(_ClearSession value)? clearSession,
  }) {
    return checkAuthetication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthentication value)? checkAuthetication,
    TResult Function(_ClearSession value)? clearSession,
    required TResult orElse(),
  }) {
    if (checkAuthetication != null) {
      return checkAuthetication(this);
    }
    return orElse();
  }
}

abstract class _CheckAuthentication implements AppEvent {
  const factory _CheckAuthentication() = _$CheckAuthenticationImpl;
}

/// @nodoc
abstract class _$$ClearSessionImplCopyWith<$Res> {
  factory _$$ClearSessionImplCopyWith(
          _$ClearSessionImpl value, $Res Function(_$ClearSessionImpl) then) =
      __$$ClearSessionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSessionImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$ClearSessionImpl>
    implements _$$ClearSessionImplCopyWith<$Res> {
  __$$ClearSessionImplCopyWithImpl(
      _$ClearSessionImpl _value, $Res Function(_$ClearSessionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearSessionImpl implements _ClearSession {
  const _$ClearSessionImpl();

  @override
  String toString() {
    return 'AppEvent.clearSession()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSessionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthetication,
    required TResult Function() clearSession,
  }) {
    return clearSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthetication,
    TResult? Function()? clearSession,
  }) {
    return clearSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthetication,
    TResult Function()? clearSession,
    required TResult orElse(),
  }) {
    if (clearSession != null) {
      return clearSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthentication value) checkAuthetication,
    required TResult Function(_ClearSession value) clearSession,
  }) {
    return clearSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthentication value)? checkAuthetication,
    TResult? Function(_ClearSession value)? clearSession,
  }) {
    return clearSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthentication value)? checkAuthetication,
    TResult Function(_ClearSession value)? clearSession,
    required TResult orElse(),
  }) {
    if (clearSession != null) {
      return clearSession(this);
    }
    return orElse();
  }
}

abstract class _ClearSession implements AppEvent {
  const factory _ClearSession() = _$ClearSessionImpl;
}

/// @nodoc
mixin _$AppState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingAuthentication,
    required TResult Function() authenticated,
    required TResult Function(String? message) unAuthenticated,
    required TResult Function() clearedSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingAuthentication,
    TResult? Function()? authenticated,
    TResult? Function(String? message)? unAuthenticated,
    TResult? Function()? clearedSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingAuthentication,
    TResult Function()? authenticated,
    TResult Function(String? message)? unAuthenticated,
    TResult Function()? clearedSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingAuthentication value)
        checkingAuthentication,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_UnAuthenticted value) unAuthenticated,
    required TResult Function(_ClearedSession value) clearedSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingAuthentication value)? checkingAuthentication,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_UnAuthenticted value)? unAuthenticated,
    TResult? Function(_ClearedSession value)? clearedSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingAuthentication value)? checkingAuthentication,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_UnAuthenticted value)? unAuthenticated,
    TResult Function(_ClearedSession value)? clearedSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AppState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingAuthentication,
    required TResult Function() authenticated,
    required TResult Function(String? message) unAuthenticated,
    required TResult Function() clearedSession,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingAuthentication,
    TResult? Function()? authenticated,
    TResult? Function(String? message)? unAuthenticated,
    TResult? Function()? clearedSession,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingAuthentication,
    TResult Function()? authenticated,
    TResult Function(String? message)? unAuthenticated,
    TResult Function()? clearedSession,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingAuthentication value)
        checkingAuthentication,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_UnAuthenticted value) unAuthenticated,
    required TResult Function(_ClearedSession value) clearedSession,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingAuthentication value)? checkingAuthentication,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_UnAuthenticted value)? unAuthenticated,
    TResult? Function(_ClearedSession value)? clearedSession,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingAuthentication value)? checkingAuthentication,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_UnAuthenticted value)? unAuthenticated,
    TResult Function(_ClearedSession value)? clearedSession,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AppState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$CheckingAuthenticationImplCopyWith<$Res> {
  factory _$$CheckingAuthenticationImplCopyWith(
          _$CheckingAuthenticationImpl value,
          $Res Function(_$CheckingAuthenticationImpl) then) =
      __$$CheckingAuthenticationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckingAuthenticationImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$CheckingAuthenticationImpl>
    implements _$$CheckingAuthenticationImplCopyWith<$Res> {
  __$$CheckingAuthenticationImplCopyWithImpl(
      _$CheckingAuthenticationImpl _value,
      $Res Function(_$CheckingAuthenticationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckingAuthenticationImpl implements _CheckingAuthentication {
  const _$CheckingAuthenticationImpl();

  @override
  String toString() {
    return 'AppState.checkingAuthentication()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckingAuthenticationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingAuthentication,
    required TResult Function() authenticated,
    required TResult Function(String? message) unAuthenticated,
    required TResult Function() clearedSession,
  }) {
    return checkingAuthentication();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingAuthentication,
    TResult? Function()? authenticated,
    TResult? Function(String? message)? unAuthenticated,
    TResult? Function()? clearedSession,
  }) {
    return checkingAuthentication?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingAuthentication,
    TResult Function()? authenticated,
    TResult Function(String? message)? unAuthenticated,
    TResult Function()? clearedSession,
    required TResult orElse(),
  }) {
    if (checkingAuthentication != null) {
      return checkingAuthentication();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingAuthentication value)
        checkingAuthentication,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_UnAuthenticted value) unAuthenticated,
    required TResult Function(_ClearedSession value) clearedSession,
  }) {
    return checkingAuthentication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingAuthentication value)? checkingAuthentication,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_UnAuthenticted value)? unAuthenticated,
    TResult? Function(_ClearedSession value)? clearedSession,
  }) {
    return checkingAuthentication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingAuthentication value)? checkingAuthentication,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_UnAuthenticted value)? unAuthenticated,
    TResult Function(_ClearedSession value)? clearedSession,
    required TResult orElse(),
  }) {
    if (checkingAuthentication != null) {
      return checkingAuthentication(this);
    }
    return orElse();
  }
}

abstract class _CheckingAuthentication implements AppState {
  const factory _CheckingAuthentication() = _$CheckingAuthenticationImpl;
}

/// @nodoc
abstract class _$$AuthenticatedImplCopyWith<$Res> {
  factory _$$AuthenticatedImplCopyWith(
          _$AuthenticatedImpl value, $Res Function(_$AuthenticatedImpl) then) =
      __$$AuthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthenticatedImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AuthenticatedImpl>
    implements _$$AuthenticatedImplCopyWith<$Res> {
  __$$AuthenticatedImplCopyWithImpl(
      _$AuthenticatedImpl _value, $Res Function(_$AuthenticatedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthenticatedImpl implements _Authenticated {
  const _$AuthenticatedImpl();

  @override
  String toString() {
    return 'AppState.authenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingAuthentication,
    required TResult Function() authenticated,
    required TResult Function(String? message) unAuthenticated,
    required TResult Function() clearedSession,
  }) {
    return authenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingAuthentication,
    TResult? Function()? authenticated,
    TResult? Function(String? message)? unAuthenticated,
    TResult? Function()? clearedSession,
  }) {
    return authenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingAuthentication,
    TResult Function()? authenticated,
    TResult Function(String? message)? unAuthenticated,
    TResult Function()? clearedSession,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingAuthentication value)
        checkingAuthentication,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_UnAuthenticted value) unAuthenticated,
    required TResult Function(_ClearedSession value) clearedSession,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingAuthentication value)? checkingAuthentication,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_UnAuthenticted value)? unAuthenticated,
    TResult? Function(_ClearedSession value)? clearedSession,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingAuthentication value)? checkingAuthentication,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_UnAuthenticted value)? unAuthenticated,
    TResult Function(_ClearedSession value)? clearedSession,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class _Authenticated implements AppState {
  const factory _Authenticated() = _$AuthenticatedImpl;
}

/// @nodoc
abstract class _$$UnAuthentictedImplCopyWith<$Res> {
  factory _$$UnAuthentictedImplCopyWith(_$UnAuthentictedImpl value,
          $Res Function(_$UnAuthentictedImpl) then) =
      __$$UnAuthentictedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnAuthentictedImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$UnAuthentictedImpl>
    implements _$$UnAuthentictedImplCopyWith<$Res> {
  __$$UnAuthentictedImplCopyWithImpl(
      _$UnAuthentictedImpl _value, $Res Function(_$UnAuthentictedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnAuthentictedImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnAuthentictedImpl implements _UnAuthenticted {
  const _$UnAuthentictedImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'AppState.unAuthenticated(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnAuthentictedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnAuthentictedImplCopyWith<_$UnAuthentictedImpl> get copyWith =>
      __$$UnAuthentictedImplCopyWithImpl<_$UnAuthentictedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingAuthentication,
    required TResult Function() authenticated,
    required TResult Function(String? message) unAuthenticated,
    required TResult Function() clearedSession,
  }) {
    return unAuthenticated(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingAuthentication,
    TResult? Function()? authenticated,
    TResult? Function(String? message)? unAuthenticated,
    TResult? Function()? clearedSession,
  }) {
    return unAuthenticated?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingAuthentication,
    TResult Function()? authenticated,
    TResult Function(String? message)? unAuthenticated,
    TResult Function()? clearedSession,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingAuthentication value)
        checkingAuthentication,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_UnAuthenticted value) unAuthenticated,
    required TResult Function(_ClearedSession value) clearedSession,
  }) {
    return unAuthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingAuthentication value)? checkingAuthentication,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_UnAuthenticted value)? unAuthenticated,
    TResult? Function(_ClearedSession value)? clearedSession,
  }) {
    return unAuthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingAuthentication value)? checkingAuthentication,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_UnAuthenticted value)? unAuthenticated,
    TResult Function(_ClearedSession value)? clearedSession,
    required TResult orElse(),
  }) {
    if (unAuthenticated != null) {
      return unAuthenticated(this);
    }
    return orElse();
  }
}

abstract class _UnAuthenticted implements AppState {
  const factory _UnAuthenticted({final String? message}) = _$UnAuthentictedImpl;

  String? get message;
  @JsonKey(ignore: true)
  _$$UnAuthentictedImplCopyWith<_$UnAuthentictedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearedSessionImplCopyWith<$Res> {
  factory _$$ClearedSessionImplCopyWith(_$ClearedSessionImpl value,
          $Res Function(_$ClearedSessionImpl) then) =
      __$$ClearedSessionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearedSessionImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$ClearedSessionImpl>
    implements _$$ClearedSessionImplCopyWith<$Res> {
  __$$ClearedSessionImplCopyWithImpl(
      _$ClearedSessionImpl _value, $Res Function(_$ClearedSessionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearedSessionImpl implements _ClearedSession {
  const _$ClearedSessionImpl();

  @override
  String toString() {
    return 'AppState.clearedSession()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearedSessionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() checkingAuthentication,
    required TResult Function() authenticated,
    required TResult Function(String? message) unAuthenticated,
    required TResult Function() clearedSession,
  }) {
    return clearedSession();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? checkingAuthentication,
    TResult? Function()? authenticated,
    TResult? Function(String? message)? unAuthenticated,
    TResult? Function()? clearedSession,
  }) {
    return clearedSession?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? checkingAuthentication,
    TResult Function()? authenticated,
    TResult Function(String? message)? unAuthenticated,
    TResult Function()? clearedSession,
    required TResult orElse(),
  }) {
    if (clearedSession != null) {
      return clearedSession();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_CheckingAuthentication value)
        checkingAuthentication,
    required TResult Function(_Authenticated value) authenticated,
    required TResult Function(_UnAuthenticted value) unAuthenticated,
    required TResult Function(_ClearedSession value) clearedSession,
  }) {
    return clearedSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_CheckingAuthentication value)? checkingAuthentication,
    TResult? Function(_Authenticated value)? authenticated,
    TResult? Function(_UnAuthenticted value)? unAuthenticated,
    TResult? Function(_ClearedSession value)? clearedSession,
  }) {
    return clearedSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_CheckingAuthentication value)? checkingAuthentication,
    TResult Function(_Authenticated value)? authenticated,
    TResult Function(_UnAuthenticted value)? unAuthenticated,
    TResult Function(_ClearedSession value)? clearedSession,
    required TResult orElse(),
  }) {
    if (clearedSession != null) {
      return clearedSession(this);
    }
    return orElse();
  }
}

abstract class _ClearedSession implements AppState {
  const factory _ClearedSession() = _$ClearedSessionImpl;
}
