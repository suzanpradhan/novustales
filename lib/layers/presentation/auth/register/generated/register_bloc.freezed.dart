// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) validateEmail,
    required TResult Function(String password) validatePassword,
    required TResult Function(String confirmPassword) validateConfirmPassword,
    required TResult Function(String phone) validatePhone,
    required TResult Function(String name) validateName,
    required TResult Function() attempt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? validateEmail,
    TResult? Function(String password)? validatePassword,
    TResult? Function(String confirmPassword)? validateConfirmPassword,
    TResult? Function(String phone)? validatePhone,
    TResult? Function(String name)? validateName,
    TResult? Function()? attempt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? validateEmail,
    TResult Function(String password)? validatePassword,
    TResult Function(String confirmPassword)? validateConfirmPassword,
    TResult Function(String phone)? validatePhone,
    TResult Function(String name)? validateName,
    TResult Function()? attempt,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ValidateEmail value) validateEmail,
    required TResult Function(_ValidatePassword value) validatePassword,
    required TResult Function(_ValidateConfirmPassword value)
        validateConfirmPassword,
    required TResult Function(_ValidatePhone value) validatePhone,
    required TResult Function(_ValidateName value) validateName,
    required TResult Function(_Attempt value) attempt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ValidateEmail value)? validateEmail,
    TResult? Function(_ValidatePassword value)? validatePassword,
    TResult? Function(_ValidateConfirmPassword value)? validateConfirmPassword,
    TResult? Function(_ValidatePhone value)? validatePhone,
    TResult? Function(_ValidateName value)? validateName,
    TResult? Function(_Attempt value)? attempt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidateEmail value)? validateEmail,
    TResult Function(_ValidatePassword value)? validatePassword,
    TResult Function(_ValidateConfirmPassword value)? validateConfirmPassword,
    TResult Function(_ValidatePhone value)? validatePhone,
    TResult Function(_ValidateName value)? validateName,
    TResult Function(_Attempt value)? attempt,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
          RegisterEvent value, $Res Function(RegisterEvent) then) =
      _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
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
    extends _$RegisterEventCopyWithImpl<$Res, _$ValidateEmailImpl>
    implements _$$ValidateEmailImplCopyWith<$Res> {
  __$$ValidateEmailImplCopyWithImpl(
      _$ValidateEmailImpl _value, $Res Function(_$ValidateEmailImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
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
    return 'RegisterEvent.validateEmail(email: $email)';
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

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateEmailImplCopyWith<_$ValidateEmailImpl> get copyWith =>
      __$$ValidateEmailImplCopyWithImpl<_$ValidateEmailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) validateEmail,
    required TResult Function(String password) validatePassword,
    required TResult Function(String confirmPassword) validateConfirmPassword,
    required TResult Function(String phone) validatePhone,
    required TResult Function(String name) validateName,
    required TResult Function() attempt,
  }) {
    return validateEmail(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? validateEmail,
    TResult? Function(String password)? validatePassword,
    TResult? Function(String confirmPassword)? validateConfirmPassword,
    TResult? Function(String phone)? validatePhone,
    TResult? Function(String name)? validateName,
    TResult? Function()? attempt,
  }) {
    return validateEmail?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? validateEmail,
    TResult Function(String password)? validatePassword,
    TResult Function(String confirmPassword)? validateConfirmPassword,
    TResult Function(String phone)? validatePhone,
    TResult Function(String name)? validateName,
    TResult Function()? attempt,
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
    required TResult Function(_ValidateConfirmPassword value)
        validateConfirmPassword,
    required TResult Function(_ValidatePhone value) validatePhone,
    required TResult Function(_ValidateName value) validateName,
    required TResult Function(_Attempt value) attempt,
  }) {
    return validateEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ValidateEmail value)? validateEmail,
    TResult? Function(_ValidatePassword value)? validatePassword,
    TResult? Function(_ValidateConfirmPassword value)? validateConfirmPassword,
    TResult? Function(_ValidatePhone value)? validatePhone,
    TResult? Function(_ValidateName value)? validateName,
    TResult? Function(_Attempt value)? attempt,
  }) {
    return validateEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidateEmail value)? validateEmail,
    TResult Function(_ValidatePassword value)? validatePassword,
    TResult Function(_ValidateConfirmPassword value)? validateConfirmPassword,
    TResult Function(_ValidatePhone value)? validatePhone,
    TResult Function(_ValidateName value)? validateName,
    TResult Function(_Attempt value)? attempt,
    required TResult orElse(),
  }) {
    if (validateEmail != null) {
      return validateEmail(this);
    }
    return orElse();
  }
}

abstract class _ValidateEmail implements RegisterEvent {
  const factory _ValidateEmail({final String email}) = _$ValidateEmailImpl;

  String get email;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
    extends _$RegisterEventCopyWithImpl<$Res, _$ValidatePasswordImpl>
    implements _$$ValidatePasswordImplCopyWith<$Res> {
  __$$ValidatePasswordImplCopyWithImpl(_$ValidatePasswordImpl _value,
      $Res Function(_$ValidatePasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
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
    return 'RegisterEvent.validatePassword(password: $password)';
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

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
    required TResult Function(String confirmPassword) validateConfirmPassword,
    required TResult Function(String phone) validatePhone,
    required TResult Function(String name) validateName,
    required TResult Function() attempt,
  }) {
    return validatePassword(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? validateEmail,
    TResult? Function(String password)? validatePassword,
    TResult? Function(String confirmPassword)? validateConfirmPassword,
    TResult? Function(String phone)? validatePhone,
    TResult? Function(String name)? validateName,
    TResult? Function()? attempt,
  }) {
    return validatePassword?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? validateEmail,
    TResult Function(String password)? validatePassword,
    TResult Function(String confirmPassword)? validateConfirmPassword,
    TResult Function(String phone)? validatePhone,
    TResult Function(String name)? validateName,
    TResult Function()? attempt,
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
    required TResult Function(_ValidateConfirmPassword value)
        validateConfirmPassword,
    required TResult Function(_ValidatePhone value) validatePhone,
    required TResult Function(_ValidateName value) validateName,
    required TResult Function(_Attempt value) attempt,
  }) {
    return validatePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ValidateEmail value)? validateEmail,
    TResult? Function(_ValidatePassword value)? validatePassword,
    TResult? Function(_ValidateConfirmPassword value)? validateConfirmPassword,
    TResult? Function(_ValidatePhone value)? validatePhone,
    TResult? Function(_ValidateName value)? validateName,
    TResult? Function(_Attempt value)? attempt,
  }) {
    return validatePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidateEmail value)? validateEmail,
    TResult Function(_ValidatePassword value)? validatePassword,
    TResult Function(_ValidateConfirmPassword value)? validateConfirmPassword,
    TResult Function(_ValidatePhone value)? validatePhone,
    TResult Function(_ValidateName value)? validateName,
    TResult Function(_Attempt value)? attempt,
    required TResult orElse(),
  }) {
    if (validatePassword != null) {
      return validatePassword(this);
    }
    return orElse();
  }
}

abstract class _ValidatePassword implements RegisterEvent {
  const factory _ValidatePassword({final String password}) =
      _$ValidatePasswordImpl;

  String get password;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidatePasswordImplCopyWith<_$ValidatePasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidateConfirmPasswordImplCopyWith<$Res> {
  factory _$$ValidateConfirmPasswordImplCopyWith(
          _$ValidateConfirmPasswordImpl value,
          $Res Function(_$ValidateConfirmPasswordImpl) then) =
      __$$ValidateConfirmPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String confirmPassword});
}

/// @nodoc
class __$$ValidateConfirmPasswordImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$ValidateConfirmPasswordImpl>
    implements _$$ValidateConfirmPasswordImplCopyWith<$Res> {
  __$$ValidateConfirmPasswordImplCopyWithImpl(
      _$ValidateConfirmPasswordImpl _value,
      $Res Function(_$ValidateConfirmPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmPassword = null,
  }) {
    return _then(_$ValidateConfirmPasswordImpl(
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ValidateConfirmPasswordImpl implements _ValidateConfirmPassword {
  const _$ValidateConfirmPasswordImpl({this.confirmPassword = ""});

  @override
  @JsonKey()
  final String confirmPassword;

  @override
  String toString() {
    return 'RegisterEvent.validateConfirmPassword(confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateConfirmPasswordImpl &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, confirmPassword);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateConfirmPasswordImplCopyWith<_$ValidateConfirmPasswordImpl>
      get copyWith => __$$ValidateConfirmPasswordImplCopyWithImpl<
          _$ValidateConfirmPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) validateEmail,
    required TResult Function(String password) validatePassword,
    required TResult Function(String confirmPassword) validateConfirmPassword,
    required TResult Function(String phone) validatePhone,
    required TResult Function(String name) validateName,
    required TResult Function() attempt,
  }) {
    return validateConfirmPassword(confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? validateEmail,
    TResult? Function(String password)? validatePassword,
    TResult? Function(String confirmPassword)? validateConfirmPassword,
    TResult? Function(String phone)? validatePhone,
    TResult? Function(String name)? validateName,
    TResult? Function()? attempt,
  }) {
    return validateConfirmPassword?.call(confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? validateEmail,
    TResult Function(String password)? validatePassword,
    TResult Function(String confirmPassword)? validateConfirmPassword,
    TResult Function(String phone)? validatePhone,
    TResult Function(String name)? validateName,
    TResult Function()? attempt,
    required TResult orElse(),
  }) {
    if (validateConfirmPassword != null) {
      return validateConfirmPassword(confirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ValidateEmail value) validateEmail,
    required TResult Function(_ValidatePassword value) validatePassword,
    required TResult Function(_ValidateConfirmPassword value)
        validateConfirmPassword,
    required TResult Function(_ValidatePhone value) validatePhone,
    required TResult Function(_ValidateName value) validateName,
    required TResult Function(_Attempt value) attempt,
  }) {
    return validateConfirmPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ValidateEmail value)? validateEmail,
    TResult? Function(_ValidatePassword value)? validatePassword,
    TResult? Function(_ValidateConfirmPassword value)? validateConfirmPassword,
    TResult? Function(_ValidatePhone value)? validatePhone,
    TResult? Function(_ValidateName value)? validateName,
    TResult? Function(_Attempt value)? attempt,
  }) {
    return validateConfirmPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidateEmail value)? validateEmail,
    TResult Function(_ValidatePassword value)? validatePassword,
    TResult Function(_ValidateConfirmPassword value)? validateConfirmPassword,
    TResult Function(_ValidatePhone value)? validatePhone,
    TResult Function(_ValidateName value)? validateName,
    TResult Function(_Attempt value)? attempt,
    required TResult orElse(),
  }) {
    if (validateConfirmPassword != null) {
      return validateConfirmPassword(this);
    }
    return orElse();
  }
}

abstract class _ValidateConfirmPassword implements RegisterEvent {
  const factory _ValidateConfirmPassword({final String confirmPassword}) =
      _$ValidateConfirmPasswordImpl;

  String get confirmPassword;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidateConfirmPasswordImplCopyWith<_$ValidateConfirmPasswordImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidatePhoneImplCopyWith<$Res> {
  factory _$$ValidatePhoneImplCopyWith(
          _$ValidatePhoneImpl value, $Res Function(_$ValidatePhoneImpl) then) =
      __$$ValidatePhoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$ValidatePhoneImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$ValidatePhoneImpl>
    implements _$$ValidatePhoneImplCopyWith<$Res> {
  __$$ValidatePhoneImplCopyWithImpl(
      _$ValidatePhoneImpl _value, $Res Function(_$ValidatePhoneImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
  }) {
    return _then(_$ValidatePhoneImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ValidatePhoneImpl implements _ValidatePhone {
  const _$ValidatePhoneImpl({this.phone = ""});

  @override
  @JsonKey()
  final String phone;

  @override
  String toString() {
    return 'RegisterEvent.validatePhone(phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidatePhoneImpl &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidatePhoneImplCopyWith<_$ValidatePhoneImpl> get copyWith =>
      __$$ValidatePhoneImplCopyWithImpl<_$ValidatePhoneImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) validateEmail,
    required TResult Function(String password) validatePassword,
    required TResult Function(String confirmPassword) validateConfirmPassword,
    required TResult Function(String phone) validatePhone,
    required TResult Function(String name) validateName,
    required TResult Function() attempt,
  }) {
    return validatePhone(phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? validateEmail,
    TResult? Function(String password)? validatePassword,
    TResult? Function(String confirmPassword)? validateConfirmPassword,
    TResult? Function(String phone)? validatePhone,
    TResult? Function(String name)? validateName,
    TResult? Function()? attempt,
  }) {
    return validatePhone?.call(phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? validateEmail,
    TResult Function(String password)? validatePassword,
    TResult Function(String confirmPassword)? validateConfirmPassword,
    TResult Function(String phone)? validatePhone,
    TResult Function(String name)? validateName,
    TResult Function()? attempt,
    required TResult orElse(),
  }) {
    if (validatePhone != null) {
      return validatePhone(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ValidateEmail value) validateEmail,
    required TResult Function(_ValidatePassword value) validatePassword,
    required TResult Function(_ValidateConfirmPassword value)
        validateConfirmPassword,
    required TResult Function(_ValidatePhone value) validatePhone,
    required TResult Function(_ValidateName value) validateName,
    required TResult Function(_Attempt value) attempt,
  }) {
    return validatePhone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ValidateEmail value)? validateEmail,
    TResult? Function(_ValidatePassword value)? validatePassword,
    TResult? Function(_ValidateConfirmPassword value)? validateConfirmPassword,
    TResult? Function(_ValidatePhone value)? validatePhone,
    TResult? Function(_ValidateName value)? validateName,
    TResult? Function(_Attempt value)? attempt,
  }) {
    return validatePhone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidateEmail value)? validateEmail,
    TResult Function(_ValidatePassword value)? validatePassword,
    TResult Function(_ValidateConfirmPassword value)? validateConfirmPassword,
    TResult Function(_ValidatePhone value)? validatePhone,
    TResult Function(_ValidateName value)? validateName,
    TResult Function(_Attempt value)? attempt,
    required TResult orElse(),
  }) {
    if (validatePhone != null) {
      return validatePhone(this);
    }
    return orElse();
  }
}

abstract class _ValidatePhone implements RegisterEvent {
  const factory _ValidatePhone({final String phone}) = _$ValidatePhoneImpl;

  String get phone;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidatePhoneImplCopyWith<_$ValidatePhoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidateNameImplCopyWith<$Res> {
  factory _$$ValidateNameImplCopyWith(
          _$ValidateNameImpl value, $Res Function(_$ValidateNameImpl) then) =
      __$$ValidateNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$ValidateNameImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$ValidateNameImpl>
    implements _$$ValidateNameImplCopyWith<$Res> {
  __$$ValidateNameImplCopyWithImpl(
      _$ValidateNameImpl _value, $Res Function(_$ValidateNameImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$ValidateNameImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ValidateNameImpl implements _ValidateName {
  const _$ValidateNameImpl({this.name = ""});

  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'RegisterEvent.validateName(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateNameImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateNameImplCopyWith<_$ValidateNameImpl> get copyWith =>
      __$$ValidateNameImplCopyWithImpl<_$ValidateNameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) validateEmail,
    required TResult Function(String password) validatePassword,
    required TResult Function(String confirmPassword) validateConfirmPassword,
    required TResult Function(String phone) validatePhone,
    required TResult Function(String name) validateName,
    required TResult Function() attempt,
  }) {
    return validateName(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? validateEmail,
    TResult? Function(String password)? validatePassword,
    TResult? Function(String confirmPassword)? validateConfirmPassword,
    TResult? Function(String phone)? validatePhone,
    TResult? Function(String name)? validateName,
    TResult? Function()? attempt,
  }) {
    return validateName?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? validateEmail,
    TResult Function(String password)? validatePassword,
    TResult Function(String confirmPassword)? validateConfirmPassword,
    TResult Function(String phone)? validatePhone,
    TResult Function(String name)? validateName,
    TResult Function()? attempt,
    required TResult orElse(),
  }) {
    if (validateName != null) {
      return validateName(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ValidateEmail value) validateEmail,
    required TResult Function(_ValidatePassword value) validatePassword,
    required TResult Function(_ValidateConfirmPassword value)
        validateConfirmPassword,
    required TResult Function(_ValidatePhone value) validatePhone,
    required TResult Function(_ValidateName value) validateName,
    required TResult Function(_Attempt value) attempt,
  }) {
    return validateName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ValidateEmail value)? validateEmail,
    TResult? Function(_ValidatePassword value)? validatePassword,
    TResult? Function(_ValidateConfirmPassword value)? validateConfirmPassword,
    TResult? Function(_ValidatePhone value)? validatePhone,
    TResult? Function(_ValidateName value)? validateName,
    TResult? Function(_Attempt value)? attempt,
  }) {
    return validateName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidateEmail value)? validateEmail,
    TResult Function(_ValidatePassword value)? validatePassword,
    TResult Function(_ValidateConfirmPassword value)? validateConfirmPassword,
    TResult Function(_ValidatePhone value)? validatePhone,
    TResult Function(_ValidateName value)? validateName,
    TResult Function(_Attempt value)? attempt,
    required TResult orElse(),
  }) {
    if (validateName != null) {
      return validateName(this);
    }
    return orElse();
  }
}

abstract class _ValidateName implements RegisterEvent {
  const factory _ValidateName({final String name}) = _$ValidateNameImpl;

  String get name;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidateNameImplCopyWith<_$ValidateNameImpl> get copyWith =>
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
    extends _$RegisterEventCopyWithImpl<$Res, _$AttemptImpl>
    implements _$$AttemptImplCopyWith<$Res> {
  __$$AttemptImplCopyWithImpl(
      _$AttemptImpl _value, $Res Function(_$AttemptImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AttemptImpl implements _Attempt {
  const _$AttemptImpl();

  @override
  String toString() {
    return 'RegisterEvent.attempt()';
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
    required TResult Function(String confirmPassword) validateConfirmPassword,
    required TResult Function(String phone) validatePhone,
    required TResult Function(String name) validateName,
    required TResult Function() attempt,
  }) {
    return attempt();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? validateEmail,
    TResult? Function(String password)? validatePassword,
    TResult? Function(String confirmPassword)? validateConfirmPassword,
    TResult? Function(String phone)? validatePhone,
    TResult? Function(String name)? validateName,
    TResult? Function()? attempt,
  }) {
    return attempt?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? validateEmail,
    TResult Function(String password)? validatePassword,
    TResult Function(String confirmPassword)? validateConfirmPassword,
    TResult Function(String phone)? validatePhone,
    TResult Function(String name)? validateName,
    TResult Function()? attempt,
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
    required TResult Function(_ValidateConfirmPassword value)
        validateConfirmPassword,
    required TResult Function(_ValidatePhone value) validatePhone,
    required TResult Function(_ValidateName value) validateName,
    required TResult Function(_Attempt value) attempt,
  }) {
    return attempt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ValidateEmail value)? validateEmail,
    TResult? Function(_ValidatePassword value)? validatePassword,
    TResult? Function(_ValidateConfirmPassword value)? validateConfirmPassword,
    TResult? Function(_ValidatePhone value)? validatePhone,
    TResult? Function(_ValidateName value)? validateName,
    TResult? Function(_Attempt value)? attempt,
  }) {
    return attempt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidateEmail value)? validateEmail,
    TResult Function(_ValidatePassword value)? validatePassword,
    TResult Function(_ValidateConfirmPassword value)? validateConfirmPassword,
    TResult Function(_ValidatePhone value)? validatePhone,
    TResult Function(_ValidateName value)? validateName,
    TResult Function(_Attempt value)? attempt,
    required TResult orElse(),
  }) {
    if (attempt != null) {
      return attempt(this);
    }
    return orElse();
  }
}

abstract class _Attempt implements RegisterEvent {
  const factory _Attempt() = _$AttemptImpl;
}

/// @nodoc
mixin _$RegisterState {
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  TextInput get fullName => throw _privateConstructorUsedError;
  EmailInput get email => throw _privateConstructorUsedError;
  PasswordInput get password => throw _privateConstructorUsedError;
  PasswordInput get confirmPassword => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  bool get isFirstAttempt => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      TextInput fullName,
      EmailInput email,
      PasswordInput password,
      PasswordInput confirmPassword,
      bool isValid,
      bool isFirstAttempt,
      String? message});
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? fullName = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? isValid = null,
    Object? isFirstAttempt = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as TextInput,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailInput,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstAttempt: null == isFirstAttempt
          ? _value.isFirstAttempt
          : isFirstAttempt // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterStateImplCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$RegisterStateImplCopyWith(
          _$RegisterStateImpl value, $Res Function(_$RegisterStateImpl) then) =
      __$$RegisterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      TextInput fullName,
      EmailInput email,
      PasswordInput password,
      PasswordInput confirmPassword,
      bool isValid,
      bool isFirstAttempt,
      String? message});
}

/// @nodoc
class __$$RegisterStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterStateImpl>
    implements _$$RegisterStateImplCopyWith<$Res> {
  __$$RegisterStateImplCopyWithImpl(
      _$RegisterStateImpl _value, $Res Function(_$RegisterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? fullName = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? isValid = null,
    Object? isFirstAttempt = null,
    Object? message = freezed,
  }) {
    return _then(_$RegisterStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as TextInput,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailInput,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as PasswordInput,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isFirstAttempt: null == isFirstAttempt
          ? _value.isFirstAttempt
          : isFirstAttempt // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RegisterStateImpl implements _RegisterState {
  const _$RegisterStateImpl(
      {this.status = FormzSubmissionStatus.initial,
      this.fullName = const TextInput.pure(),
      this.email = const EmailInput.pure(),
      this.password = const PasswordInput.pure(),
      this.confirmPassword = const PasswordInput.pure(),
      this.isValid = false,
      this.isFirstAttempt = true,
      this.message});

  @override
  @JsonKey()
  final FormzSubmissionStatus status;
  @override
  @JsonKey()
  final TextInput fullName;
  @override
  @JsonKey()
  final EmailInput email;
  @override
  @JsonKey()
  final PasswordInput password;
  @override
  @JsonKey()
  final PasswordInput confirmPassword;
  @override
  @JsonKey()
  final bool isValid;
  @override
  @JsonKey()
  final bool isFirstAttempt;
  @override
  final String? message;

  @override
  String toString() {
    return 'RegisterState(status: $status, fullName: $fullName, email: $email, password: $password, confirmPassword: $confirmPassword, isValid: $isValid, isFirstAttempt: $isFirstAttempt, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.isFirstAttempt, isFirstAttempt) ||
                other.isFirstAttempt == isFirstAttempt) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, fullName, email,
      password, confirmPassword, isValid, isFirstAttempt, message);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      __$$RegisterStateImplCopyWithImpl<_$RegisterStateImpl>(this, _$identity);
}

abstract class _RegisterState implements RegisterState {
  const factory _RegisterState(
      {final FormzSubmissionStatus status,
      final TextInput fullName,
      final EmailInput email,
      final PasswordInput password,
      final PasswordInput confirmPassword,
      final bool isValid,
      final bool isFirstAttempt,
      final String? message}) = _$RegisterStateImpl;

  @override
  FormzSubmissionStatus get status;
  @override
  TextInput get fullName;
  @override
  EmailInput get email;
  @override
  PasswordInput get password;
  @override
  PasswordInput get confirmPassword;
  @override
  bool get isValid;
  @override
  bool get isFirstAttempt;
  @override
  String? get message;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
