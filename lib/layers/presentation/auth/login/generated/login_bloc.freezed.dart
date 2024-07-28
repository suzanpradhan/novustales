// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) validateEmail,
    required TResult Function(String password) validatePassword,
    required TResult Function() attempt,
    required TResult Function() googleSignInAttempt,
    required TResult Function() appleSignInAttempt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? validateEmail,
    TResult? Function(String password)? validatePassword,
    TResult? Function()? attempt,
    TResult? Function()? googleSignInAttempt,
    TResult? Function()? appleSignInAttempt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? validateEmail,
    TResult Function(String password)? validatePassword,
    TResult Function()? attempt,
    TResult Function()? googleSignInAttempt,
    TResult Function()? appleSignInAttempt,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ValidateEmail value) validateEmail,
    required TResult Function(_ValidatePassword value) validatePassword,
    required TResult Function(_Attempt value) attempt,
    required TResult Function(_GoogleSignInAttempt value) googleSignInAttempt,
    required TResult Function(_AppleSignInAttempt value) appleSignInAttempt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ValidateEmail value)? validateEmail,
    TResult? Function(_ValidatePassword value)? validatePassword,
    TResult? Function(_Attempt value)? attempt,
    TResult? Function(_GoogleSignInAttempt value)? googleSignInAttempt,
    TResult? Function(_AppleSignInAttempt value)? appleSignInAttempt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidateEmail value)? validateEmail,
    TResult Function(_ValidatePassword value)? validatePassword,
    TResult Function(_Attempt value)? attempt,
    TResult Function(_GoogleSignInAttempt value)? googleSignInAttempt,
    TResult Function(_AppleSignInAttempt value)? appleSignInAttempt,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ValidateEmailImplCopyWith<$Res> {
  factory _$$ValidateEmailImplCopyWith(
          _$ValidateEmailImpl value, $Res Function(_$ValidateEmailImpl) then) =
      __$$ValidateEmailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ValidateEmailImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$ValidateEmailImpl>
    implements _$$ValidateEmailImplCopyWith<$Res> {
  __$$ValidateEmailImplCopyWithImpl(
      _$ValidateEmailImpl _value, $Res Function(_$ValidateEmailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ValidateEmailImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ValidateEmailImpl implements _ValidateEmail {
  const _$ValidateEmailImpl({this.email = ""});

  @override
  @JsonKey()
  final String email;

  @override
  String toString() {
    return 'LoginEvent.validateEmail(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateEmailImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateEmailImplCopyWith<_$ValidateEmailImpl> get copyWith =>
      __$$ValidateEmailImplCopyWithImpl<_$ValidateEmailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) validateEmail,
    required TResult Function(String password) validatePassword,
    required TResult Function() attempt,
    required TResult Function() googleSignInAttempt,
    required TResult Function() appleSignInAttempt,
  }) {
    return validateEmail(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? validateEmail,
    TResult? Function(String password)? validatePassword,
    TResult? Function()? attempt,
    TResult? Function()? googleSignInAttempt,
    TResult? Function()? appleSignInAttempt,
  }) {
    return validateEmail?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? validateEmail,
    TResult Function(String password)? validatePassword,
    TResult Function()? attempt,
    TResult Function()? googleSignInAttempt,
    TResult Function()? appleSignInAttempt,
    required TResult orElse(),
  }) {
    if (validateEmail != null) {
      return validateEmail(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ValidateEmail value) validateEmail,
    required TResult Function(_ValidatePassword value) validatePassword,
    required TResult Function(_Attempt value) attempt,
    required TResult Function(_GoogleSignInAttempt value) googleSignInAttempt,
    required TResult Function(_AppleSignInAttempt value) appleSignInAttempt,
  }) {
    return validateEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ValidateEmail value)? validateEmail,
    TResult? Function(_ValidatePassword value)? validatePassword,
    TResult? Function(_Attempt value)? attempt,
    TResult? Function(_GoogleSignInAttempt value)? googleSignInAttempt,
    TResult? Function(_AppleSignInAttempt value)? appleSignInAttempt,
  }) {
    return validateEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidateEmail value)? validateEmail,
    TResult Function(_ValidatePassword value)? validatePassword,
    TResult Function(_Attempt value)? attempt,
    TResult Function(_GoogleSignInAttempt value)? googleSignInAttempt,
    TResult Function(_AppleSignInAttempt value)? appleSignInAttempt,
    required TResult orElse(),
  }) {
    if (validateEmail != null) {
      return validateEmail(this);
    }
    return orElse();
  }
}

abstract class _ValidateEmail implements LoginEvent {
  const factory _ValidateEmail({final String email}) = _$ValidateEmailImpl;

  String get email;
  @JsonKey(ignore: true)
  _$$ValidateEmailImplCopyWith<_$ValidateEmailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidatePasswordImplCopyWith<$Res> {
  factory _$$ValidatePasswordImplCopyWith(_$ValidatePasswordImpl value,
          $Res Function(_$ValidatePasswordImpl) then) =
      __$$ValidatePasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$ValidatePasswordImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$ValidatePasswordImpl>
    implements _$$ValidatePasswordImplCopyWith<$Res> {
  __$$ValidatePasswordImplCopyWithImpl(_$ValidatePasswordImpl _value,
      $Res Function(_$ValidatePasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$ValidatePasswordImpl(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ValidatePasswordImpl implements _ValidatePassword {
  const _$ValidatePasswordImpl({this.password = ""});

  @override
  @JsonKey()
  final String password;

  @override
  String toString() {
    return 'LoginEvent.validatePassword(password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidatePasswordImpl &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidatePasswordImplCopyWith<_$ValidatePasswordImpl> get copyWith =>
      __$$ValidatePasswordImplCopyWithImpl<_$ValidatePasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) validateEmail,
    required TResult Function(String password) validatePassword,
    required TResult Function() attempt,
    required TResult Function() googleSignInAttempt,
    required TResult Function() appleSignInAttempt,
  }) {
    return validatePassword(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? validateEmail,
    TResult? Function(String password)? validatePassword,
    TResult? Function()? attempt,
    TResult? Function()? googleSignInAttempt,
    TResult? Function()? appleSignInAttempt,
  }) {
    return validatePassword?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? validateEmail,
    TResult Function(String password)? validatePassword,
    TResult Function()? attempt,
    TResult Function()? googleSignInAttempt,
    TResult Function()? appleSignInAttempt,
    required TResult orElse(),
  }) {
    if (validatePassword != null) {
      return validatePassword(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ValidateEmail value) validateEmail,
    required TResult Function(_ValidatePassword value) validatePassword,
    required TResult Function(_Attempt value) attempt,
    required TResult Function(_GoogleSignInAttempt value) googleSignInAttempt,
    required TResult Function(_AppleSignInAttempt value) appleSignInAttempt,
  }) {
    return validatePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ValidateEmail value)? validateEmail,
    TResult? Function(_ValidatePassword value)? validatePassword,
    TResult? Function(_Attempt value)? attempt,
    TResult? Function(_GoogleSignInAttempt value)? googleSignInAttempt,
    TResult? Function(_AppleSignInAttempt value)? appleSignInAttempt,
  }) {
    return validatePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidateEmail value)? validateEmail,
    TResult Function(_ValidatePassword value)? validatePassword,
    TResult Function(_Attempt value)? attempt,
    TResult Function(_GoogleSignInAttempt value)? googleSignInAttempt,
    TResult Function(_AppleSignInAttempt value)? appleSignInAttempt,
    required TResult orElse(),
  }) {
    if (validatePassword != null) {
      return validatePassword(this);
    }
    return orElse();
  }
}

abstract class _ValidatePassword implements LoginEvent {
  const factory _ValidatePassword({final String password}) =
      _$ValidatePasswordImpl;

  String get password;
  @JsonKey(ignore: true)
  _$$ValidatePasswordImplCopyWith<_$ValidatePasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AttemptImplCopyWith<$Res> {
  factory _$$AttemptImplCopyWith(
          _$AttemptImpl value, $Res Function(_$AttemptImpl) then) =
      __$$AttemptImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AttemptImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$AttemptImpl>
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
    return 'LoginEvent.attempt()';
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
    required TResult Function(String email) validateEmail,
    required TResult Function(String password) validatePassword,
    required TResult Function() attempt,
    required TResult Function() googleSignInAttempt,
    required TResult Function() appleSignInAttempt,
  }) {
    return attempt();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? validateEmail,
    TResult? Function(String password)? validatePassword,
    TResult? Function()? attempt,
    TResult? Function()? googleSignInAttempt,
    TResult? Function()? appleSignInAttempt,
  }) {
    return attempt?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? validateEmail,
    TResult Function(String password)? validatePassword,
    TResult Function()? attempt,
    TResult Function()? googleSignInAttempt,
    TResult Function()? appleSignInAttempt,
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
    required TResult Function(_ValidateEmail value) validateEmail,
    required TResult Function(_ValidatePassword value) validatePassword,
    required TResult Function(_Attempt value) attempt,
    required TResult Function(_GoogleSignInAttempt value) googleSignInAttempt,
    required TResult Function(_AppleSignInAttempt value) appleSignInAttempt,
  }) {
    return attempt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ValidateEmail value)? validateEmail,
    TResult? Function(_ValidatePassword value)? validatePassword,
    TResult? Function(_Attempt value)? attempt,
    TResult? Function(_GoogleSignInAttempt value)? googleSignInAttempt,
    TResult? Function(_AppleSignInAttempt value)? appleSignInAttempt,
  }) {
    return attempt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidateEmail value)? validateEmail,
    TResult Function(_ValidatePassword value)? validatePassword,
    TResult Function(_Attempt value)? attempt,
    TResult Function(_GoogleSignInAttempt value)? googleSignInAttempt,
    TResult Function(_AppleSignInAttempt value)? appleSignInAttempt,
    required TResult orElse(),
  }) {
    if (attempt != null) {
      return attempt(this);
    }
    return orElse();
  }
}

abstract class _Attempt implements LoginEvent {
  const factory _Attempt() = _$AttemptImpl;
}

/// @nodoc
abstract class _$$GoogleSignInAttemptImplCopyWith<$Res> {
  factory _$$GoogleSignInAttemptImplCopyWith(_$GoogleSignInAttemptImpl value,
          $Res Function(_$GoogleSignInAttemptImpl) then) =
      __$$GoogleSignInAttemptImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleSignInAttemptImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$GoogleSignInAttemptImpl>
    implements _$$GoogleSignInAttemptImplCopyWith<$Res> {
  __$$GoogleSignInAttemptImplCopyWithImpl(_$GoogleSignInAttemptImpl _value,
      $Res Function(_$GoogleSignInAttemptImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleSignInAttemptImpl implements _GoogleSignInAttempt {
  const _$GoogleSignInAttemptImpl();

  @override
  String toString() {
    return 'LoginEvent.googleSignInAttempt()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleSignInAttemptImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) validateEmail,
    required TResult Function(String password) validatePassword,
    required TResult Function() attempt,
    required TResult Function() googleSignInAttempt,
    required TResult Function() appleSignInAttempt,
  }) {
    return googleSignInAttempt();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? validateEmail,
    TResult? Function(String password)? validatePassword,
    TResult? Function()? attempt,
    TResult? Function()? googleSignInAttempt,
    TResult? Function()? appleSignInAttempt,
  }) {
    return googleSignInAttempt?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? validateEmail,
    TResult Function(String password)? validatePassword,
    TResult Function()? attempt,
    TResult Function()? googleSignInAttempt,
    TResult Function()? appleSignInAttempt,
    required TResult orElse(),
  }) {
    if (googleSignInAttempt != null) {
      return googleSignInAttempt();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ValidateEmail value) validateEmail,
    required TResult Function(_ValidatePassword value) validatePassword,
    required TResult Function(_Attempt value) attempt,
    required TResult Function(_GoogleSignInAttempt value) googleSignInAttempt,
    required TResult Function(_AppleSignInAttempt value) appleSignInAttempt,
  }) {
    return googleSignInAttempt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ValidateEmail value)? validateEmail,
    TResult? Function(_ValidatePassword value)? validatePassword,
    TResult? Function(_Attempt value)? attempt,
    TResult? Function(_GoogleSignInAttempt value)? googleSignInAttempt,
    TResult? Function(_AppleSignInAttempt value)? appleSignInAttempt,
  }) {
    return googleSignInAttempt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidateEmail value)? validateEmail,
    TResult Function(_ValidatePassword value)? validatePassword,
    TResult Function(_Attempt value)? attempt,
    TResult Function(_GoogleSignInAttempt value)? googleSignInAttempt,
    TResult Function(_AppleSignInAttempt value)? appleSignInAttempt,
    required TResult orElse(),
  }) {
    if (googleSignInAttempt != null) {
      return googleSignInAttempt(this);
    }
    return orElse();
  }
}

abstract class _GoogleSignInAttempt implements LoginEvent {
  const factory _GoogleSignInAttempt() = _$GoogleSignInAttemptImpl;
}

/// @nodoc
abstract class _$$AppleSignInAttemptImplCopyWith<$Res> {
  factory _$$AppleSignInAttemptImplCopyWith(_$AppleSignInAttemptImpl value,
          $Res Function(_$AppleSignInAttemptImpl) then) =
      __$$AppleSignInAttemptImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppleSignInAttemptImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$AppleSignInAttemptImpl>
    implements _$$AppleSignInAttemptImplCopyWith<$Res> {
  __$$AppleSignInAttemptImplCopyWithImpl(_$AppleSignInAttemptImpl _value,
      $Res Function(_$AppleSignInAttemptImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppleSignInAttemptImpl implements _AppleSignInAttempt {
  const _$AppleSignInAttemptImpl();

  @override
  String toString() {
    return 'LoginEvent.appleSignInAttempt()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppleSignInAttemptImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) validateEmail,
    required TResult Function(String password) validatePassword,
    required TResult Function() attempt,
    required TResult Function() googleSignInAttempt,
    required TResult Function() appleSignInAttempt,
  }) {
    return appleSignInAttempt();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? validateEmail,
    TResult? Function(String password)? validatePassword,
    TResult? Function()? attempt,
    TResult? Function()? googleSignInAttempt,
    TResult? Function()? appleSignInAttempt,
  }) {
    return appleSignInAttempt?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? validateEmail,
    TResult Function(String password)? validatePassword,
    TResult Function()? attempt,
    TResult Function()? googleSignInAttempt,
    TResult Function()? appleSignInAttempt,
    required TResult orElse(),
  }) {
    if (appleSignInAttempt != null) {
      return appleSignInAttempt();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ValidateEmail value) validateEmail,
    required TResult Function(_ValidatePassword value) validatePassword,
    required TResult Function(_Attempt value) attempt,
    required TResult Function(_GoogleSignInAttempt value) googleSignInAttempt,
    required TResult Function(_AppleSignInAttempt value) appleSignInAttempt,
  }) {
    return appleSignInAttempt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ValidateEmail value)? validateEmail,
    TResult? Function(_ValidatePassword value)? validatePassword,
    TResult? Function(_Attempt value)? attempt,
    TResult? Function(_GoogleSignInAttempt value)? googleSignInAttempt,
    TResult? Function(_AppleSignInAttempt value)? appleSignInAttempt,
  }) {
    return appleSignInAttempt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidateEmail value)? validateEmail,
    TResult Function(_ValidatePassword value)? validatePassword,
    TResult Function(_Attempt value)? attempt,
    TResult Function(_GoogleSignInAttempt value)? googleSignInAttempt,
    TResult Function(_AppleSignInAttempt value)? appleSignInAttempt,
    required TResult orElse(),
  }) {
    if (appleSignInAttempt != null) {
      return appleSignInAttempt(this);
    }
    return orElse();
  }
}

abstract class _AppleSignInAttempt implements LoginEvent {
  const factory _AppleSignInAttempt() = _$AppleSignInAttemptImpl;
}

/// @nodoc
mixin _$LoginState {
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  EmailInput get email => throw _privateConstructorUsedError;
  PasswordInput get password => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  bool get isFirstAttempt => throw _privateConstructorUsedError;
  FormzSubmissionStatus get googleSignInSatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get appleSignInStatus =>
      throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      EmailInput email,
      PasswordInput password,
      bool isValid,
      bool isFirstAttempt,
      FormzSubmissionStatus googleSignInSatus,
      FormzSubmissionStatus appleSignInStatus,
      String? message});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? email = null,
    Object? password = null,
    Object? isValid = null,
    Object? isFirstAttempt = null,
    Object? googleSignInSatus = null,
    Object? appleSignInStatus = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailInput,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstAttempt: null == isFirstAttempt
          ? _value.isFirstAttempt
          : isFirstAttempt // ignore: cast_nullable_to_non_nullable
              as bool,
      googleSignInSatus: null == googleSignInSatus
          ? _value.googleSignInSatus
          : googleSignInSatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      appleSignInStatus: null == appleSignInStatus
          ? _value.appleSignInStatus
          : appleSignInStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginStateImplCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$$LoginStateImplCopyWith(
          _$LoginStateImpl value, $Res Function(_$LoginStateImpl) then) =
      __$$LoginStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      EmailInput email,
      PasswordInput password,
      bool isValid,
      bool isFirstAttempt,
      FormzSubmissionStatus googleSignInSatus,
      FormzSubmissionStatus appleSignInStatus,
      String? message});
}

/// @nodoc
class __$$LoginStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginStateImpl>
    implements _$$LoginStateImplCopyWith<$Res> {
  __$$LoginStateImplCopyWithImpl(
      _$LoginStateImpl _value, $Res Function(_$LoginStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? email = null,
    Object? password = null,
    Object? isValid = null,
    Object? isFirstAttempt = null,
    Object? googleSignInSatus = null,
    Object? appleSignInStatus = null,
    Object? message = freezed,
  }) {
    return _then(_$LoginStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailInput,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstAttempt: null == isFirstAttempt
          ? _value.isFirstAttempt
          : isFirstAttempt // ignore: cast_nullable_to_non_nullable
              as bool,
      googleSignInSatus: null == googleSignInSatus
          ? _value.googleSignInSatus
          : googleSignInSatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      appleSignInStatus: null == appleSignInStatus
          ? _value.appleSignInStatus
          : appleSignInStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoginStateImpl implements _LoginState {
  const _$LoginStateImpl(
      {this.status = FormzSubmissionStatus.initial,
      this.email = const EmailInput.pure(),
      this.password = const PasswordInput.pure(),
      this.isValid = false,
      this.isFirstAttempt = true,
      this.googleSignInSatus = FormzSubmissionStatus.initial,
      this.appleSignInStatus = FormzSubmissionStatus.initial,
      this.message});

  @override
  @JsonKey()
  final FormzSubmissionStatus status;
  @override
  @JsonKey()
  final EmailInput email;
  @override
  @JsonKey()
  final PasswordInput password;
  @override
  @JsonKey()
  final bool isValid;
  @override
  @JsonKey()
  final bool isFirstAttempt;
  @override
  @JsonKey()
  final FormzSubmissionStatus googleSignInSatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus appleSignInStatus;
  @override
  final String? message;

  @override
  String toString() {
    return 'LoginState(status: $status, email: $email, password: $password, isValid: $isValid, isFirstAttempt: $isFirstAttempt, googleSignInSatus: $googleSignInSatus, appleSignInStatus: $appleSignInStatus, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.isFirstAttempt, isFirstAttempt) ||
                other.isFirstAttempt == isFirstAttempt) &&
            (identical(other.googleSignInSatus, googleSignInSatus) ||
                other.googleSignInSatus == googleSignInSatus) &&
            (identical(other.appleSignInStatus, appleSignInStatus) ||
                other.appleSignInStatus == appleSignInStatus) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, email, password, isValid,
      isFirstAttempt, googleSignInSatus, appleSignInStatus, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      __$$LoginStateImplCopyWithImpl<_$LoginStateImpl>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  const factory _LoginState(
      {final FormzSubmissionStatus status,
      final EmailInput email,
      final PasswordInput password,
      final bool isValid,
      final bool isFirstAttempt,
      final FormzSubmissionStatus googleSignInSatus,
      final FormzSubmissionStatus appleSignInStatus,
      final String? message}) = _$LoginStateImpl;

  @override
  FormzSubmissionStatus get status;
  @override
  EmailInput get email;
  @override
  PasswordInput get password;
  @override
  bool get isValid;
  @override
  bool get isFirstAttempt;
  @override
  FormzSubmissionStatus get googleSignInSatus;
  @override
  FormzSubmissionStatus get appleSignInStatus;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$LoginStateImplCopyWith<_$LoginStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
