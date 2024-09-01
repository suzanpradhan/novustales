import 'package:formz/formz.dart';

enum ArrayInputValidationError { required }

class ArrayInput extends FormzInput<List<String>?, ArrayInputValidationError> {
  const ArrayInput.pure() : super.pure(null);
  const ArrayInput.dirty([super.value]) : super.dirty();

  @override
  ArrayInputValidationError? validator(List<String>? value) {
    return null;
  }
}
