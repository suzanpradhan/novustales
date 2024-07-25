part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.validateEmail({@Default("") String email}) =
      _ValidateEmail;
  const factory RegisterEvent.validatePassword({@Default("") String password}) =
      _ValidatePassword;
  const factory RegisterEvent.validateConfirmPassword(
      {@Default("") String confirmPassword}) = _ValidateConfirmPassword;
  const factory RegisterEvent.validatePhone({@Default("") String phone}) =
      _ValidatePhone;
  const factory RegisterEvent.validateName({@Default("") String name}) =
      _ValidateName;
  const factory RegisterEvent.attempt() = _Attempt;
}
