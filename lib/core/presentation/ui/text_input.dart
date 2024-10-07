import 'package:formz/formz.dart';

enum TextValidationError { required, notNumeric, notString }

class TextInput extends FormzInput<String, TextValidationError> {
  const TextInput.pure() : super.pure('');
  const TextInput.dirty([super.value = '']) : super.dirty();

  @override
  TextValidationError? validator(String value) {
    return null;
  }
}

enum FullNameValidationError { empty, invalid }

class FullNameInput extends FormzInput<String, FullNameValidationError> {
  const FullNameInput.pure() : super.pure('');
  const FullNameInput.dirty([super.value = '']) : super.dirty();

  @override
  FullNameValidationError? validator(String value) {
    if (value.isEmpty) return FullNameValidationError.empty;

    final parts = value.trim().split(' ');
    if (parts.length < 2) return FullNameValidationError.invalid;

    return null;
  }
}

// required Numeric
class RequiredNumericTextInput extends TextInput {
  const RequiredNumericTextInput.pure() : super.pure();
  const RequiredNumericTextInput.dirty([super.value = '']) : super.dirty();

  @override
  TextValidationError? validator(String value) {
    if (_isNotNumeric(value)) {
      return TextValidationError.notNumeric;
    }

    return null;
  }

  bool _isNotNumeric(String value) {
    // Check if the value is not numeric
    return double.tryParse(value) == null;
  }
}

class RequiredStringTextInput extends TextInput {
  const RequiredStringTextInput.pure() : super.pure();

  @override
  TextValidationError? validator(String value) {
    if (_isNotString(value)) {
      return TextValidationError.notString;
    }
    return null;
  }

  bool _isNotString(String value) {
    // Check if the value is not a string (contains non-alphabetic characters)
    return !value.contains(RegExp(r'^[a-zA-Z]+$'));
  }
}

enum RequiredTextValidationError { empty }

class RequiredTextInput
    extends FormzInput<String, RequiredTextValidationError> {
  const RequiredTextInput.pure() : super.pure('');
  const RequiredTextInput.dirty([super.value = '']) : super.dirty();

  @override
  RequiredTextValidationError? validator(String value) {
    if (value.isEmpty) return RequiredTextValidationError.empty;
    return null;
  }
}
