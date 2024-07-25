import 'package:formz/formz.dart';

enum PasswordValidationError { empty, atLeastSix }

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) return PasswordValidationError.empty;
    if (value.length < 5) return PasswordValidationError.atLeastSix;
    return null;
  }
}
