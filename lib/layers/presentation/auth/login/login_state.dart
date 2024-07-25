part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState(
      {@Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
      @Default(EmailInput.pure()) EmailInput email,
      @Default(PasswordInput.pure()) PasswordInput password,
      @Default(false) bool isValid,
      @Default(true) bool isFirstAttempt,
      @Default(FormzSubmissionStatus.initial)
      FormzSubmissionStatus googleSignInSatus,
      @Default(FormzSubmissionStatus.initial)
      FormzSubmissionStatus appleSignInStatus,
      String? message}) = _LoginState;
}
