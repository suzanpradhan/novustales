part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(FullNameInput.pure()) FullNameInput fullName,
    @Default(EmailInput.pure()) EmailInput email,
    @Default(PasswordInput.pure()) PasswordInput password,
    @Default(PasswordInput.pure()) PasswordInput confirmPassword,
    @Default(false) bool isValid,
    @Default(true) bool isFirstAttempt,
    String? message,
  }) = _RegisterState;
}
