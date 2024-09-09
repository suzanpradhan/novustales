// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../send_message_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SendMessageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) valudateContent,
    required TResult Function(String senderId, String roomId) sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? valudateContent,
    TResult? Function(String senderId, String roomId)? sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? valudateContent,
    TResult Function(String senderId, String roomId)? sendMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ValidateContent value) valudateContent,
    required TResult Function(_SendMessage value) sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ValidateContent value)? valudateContent,
    TResult? Function(_SendMessage value)? sendMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidateContent value)? valudateContent,
    TResult Function(_SendMessage value)? sendMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageEventCopyWith<$Res> {
  factory $SendMessageEventCopyWith(
          SendMessageEvent value, $Res Function(SendMessageEvent) then) =
      _$SendMessageEventCopyWithImpl<$Res, SendMessageEvent>;
}

/// @nodoc
class _$SendMessageEventCopyWithImpl<$Res, $Val extends SendMessageEvent>
    implements $SendMessageEventCopyWith<$Res> {
  _$SendMessageEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ValidateContentImplCopyWith<$Res> {
  factory _$$ValidateContentImplCopyWith(_$ValidateContentImpl value,
          $Res Function(_$ValidateContentImpl) then) =
      __$$ValidateContentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$ValidateContentImplCopyWithImpl<$Res>
    extends _$SendMessageEventCopyWithImpl<$Res, _$ValidateContentImpl>
    implements _$$ValidateContentImplCopyWith<$Res> {
  __$$ValidateContentImplCopyWithImpl(
      _$ValidateContentImpl _value, $Res Function(_$ValidateContentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$ValidateContentImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ValidateContentImpl implements _ValidateContent {
  const _$ValidateContentImpl({this.content = ""});

  @override
  @JsonKey()
  final String content;

  @override
  String toString() {
    return 'SendMessageEvent.valudateContent(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateContentImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateContentImplCopyWith<_$ValidateContentImpl> get copyWith =>
      __$$ValidateContentImplCopyWithImpl<_$ValidateContentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) valudateContent,
    required TResult Function(String senderId, String roomId) sendMessage,
  }) {
    return valudateContent(content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? valudateContent,
    TResult? Function(String senderId, String roomId)? sendMessage,
  }) {
    return valudateContent?.call(content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? valudateContent,
    TResult Function(String senderId, String roomId)? sendMessage,
    required TResult orElse(),
  }) {
    if (valudateContent != null) {
      return valudateContent(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ValidateContent value) valudateContent,
    required TResult Function(_SendMessage value) sendMessage,
  }) {
    return valudateContent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ValidateContent value)? valudateContent,
    TResult? Function(_SendMessage value)? sendMessage,
  }) {
    return valudateContent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidateContent value)? valudateContent,
    TResult Function(_SendMessage value)? sendMessage,
    required TResult orElse(),
  }) {
    if (valudateContent != null) {
      return valudateContent(this);
    }
    return orElse();
  }
}

abstract class _ValidateContent implements SendMessageEvent {
  const factory _ValidateContent({final String content}) =
      _$ValidateContentImpl;

  String get content;
  @JsonKey(ignore: true)
  _$$ValidateContentImplCopyWith<_$ValidateContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendMessageImplCopyWith<$Res> {
  factory _$$SendMessageImplCopyWith(
          _$SendMessageImpl value, $Res Function(_$SendMessageImpl) then) =
      __$$SendMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String senderId, String roomId});
}

/// @nodoc
class __$$SendMessageImplCopyWithImpl<$Res>
    extends _$SendMessageEventCopyWithImpl<$Res, _$SendMessageImpl>
    implements _$$SendMessageImplCopyWith<$Res> {
  __$$SendMessageImplCopyWithImpl(
      _$SendMessageImpl _value, $Res Function(_$SendMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? senderId = null,
    Object? roomId = null,
  }) {
    return _then(_$SendMessageImpl(
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      roomId: null == roomId
          ? _value.roomId
          : roomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendMessageImpl implements _SendMessage {
  const _$SendMessageImpl({required this.senderId, required this.roomId});

  @override
  final String senderId;
  @override
  final String roomId;

  @override
  String toString() {
    return 'SendMessageEvent.sendMessage(senderId: $senderId, roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageImpl &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, senderId, roomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      __$$SendMessageImplCopyWithImpl<_$SendMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) valudateContent,
    required TResult Function(String senderId, String roomId) sendMessage,
  }) {
    return sendMessage(senderId, roomId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? valudateContent,
    TResult? Function(String senderId, String roomId)? sendMessage,
  }) {
    return sendMessage?.call(senderId, roomId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? valudateContent,
    TResult Function(String senderId, String roomId)? sendMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(senderId, roomId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ValidateContent value) valudateContent,
    required TResult Function(_SendMessage value) sendMessage,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ValidateContent value)? valudateContent,
    TResult? Function(_SendMessage value)? sendMessage,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ValidateContent value)? valudateContent,
    TResult Function(_SendMessage value)? sendMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class _SendMessage implements SendMessageEvent {
  const factory _SendMessage(
      {required final String senderId,
      required final String roomId}) = _$SendMessageImpl;

  String get senderId;
  String get roomId;
  @JsonKey(ignore: true)
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SendMessageState {
  FormzSubmissionStatus get status => throw _privateConstructorUsedError;
  RequiredTextInput get content => throw _privateConstructorUsedError;
  String? get failedMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SendMessageStateCopyWith<SendMessageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendMessageStateCopyWith<$Res> {
  factory $SendMessageStateCopyWith(
          SendMessageState value, $Res Function(SendMessageState) then) =
      _$SendMessageStateCopyWithImpl<$Res, SendMessageState>;
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      RequiredTextInput content,
      String? failedMessage});
}

/// @nodoc
class _$SendMessageStateCopyWithImpl<$Res, $Val extends SendMessageState>
    implements $SendMessageStateCopyWith<$Res> {
  _$SendMessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? content = null,
    Object? failedMessage = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as RequiredTextInput,
      failedMessage: freezed == failedMessage
          ? _value.failedMessage
          : failedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendMessageStateImplCopyWith<$Res>
    implements $SendMessageStateCopyWith<$Res> {
  factory _$$SendMessageStateImplCopyWith(_$SendMessageStateImpl value,
          $Res Function(_$SendMessageStateImpl) then) =
      __$$SendMessageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzSubmissionStatus status,
      RequiredTextInput content,
      String? failedMessage});
}

/// @nodoc
class __$$SendMessageStateImplCopyWithImpl<$Res>
    extends _$SendMessageStateCopyWithImpl<$Res, _$SendMessageStateImpl>
    implements _$$SendMessageStateImplCopyWith<$Res> {
  __$$SendMessageStateImplCopyWithImpl(_$SendMessageStateImpl _value,
      $Res Function(_$SendMessageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? content = null,
    Object? failedMessage = freezed,
  }) {
    return _then(_$SendMessageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as RequiredTextInput,
      failedMessage: freezed == failedMessage
          ? _value.failedMessage
          : failedMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SendMessageStateImpl implements _SendMessageState {
  const _$SendMessageStateImpl(
      {this.status = FormzSubmissionStatus.initial,
      this.content = const RequiredTextInput.pure(),
      this.failedMessage});

  @override
  @JsonKey()
  final FormzSubmissionStatus status;
  @override
  @JsonKey()
  final RequiredTextInput content;
  @override
  final String? failedMessage;

  @override
  String toString() {
    return 'SendMessageState(status: $status, content: $content, failedMessage: $failedMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.failedMessage, failedMessage) ||
                other.failedMessage == failedMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, content, failedMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageStateImplCopyWith<_$SendMessageStateImpl> get copyWith =>
      __$$SendMessageStateImplCopyWithImpl<_$SendMessageStateImpl>(
          this, _$identity);
}

abstract class _SendMessageState implements SendMessageState {
  const factory _SendMessageState(
      {final FormzSubmissionStatus status,
      final RequiredTextInput content,
      final String? failedMessage}) = _$SendMessageStateImpl;

  @override
  FormzSubmissionStatus get status;
  @override
  RequiredTextInput get content;
  @override
  String? get failedMessage;
  @override
  @JsonKey(ignore: true)
  _$$SendMessageStateImplCopyWith<_$SendMessageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
