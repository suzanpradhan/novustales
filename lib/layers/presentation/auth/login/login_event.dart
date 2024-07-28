part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.validateEmail({@Default("") String email}) =
      _ValidateEmail;
  const factory LoginEvent.validatePassword({@Default("") String password}) =
      _ValidatePassword;
  const factory LoginEvent.attempt() = _Attempt;
  const factory LoginEvent.googleSignInAttempt() = _GoogleSignInAttempt;
  const factory LoginEvent.appleSignInAttempt() = _AppleSignInAttempt;
}
