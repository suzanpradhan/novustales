import 'package:formz/formz.dart';

enum ImageValidationError { noImages }

class ImagesInput extends FormzInput<List<String>, ImageValidationError> {
  const ImagesInput.pure() : super.pure(const <String>[]);
  const ImagesInput.dirty([super.value = const <String>[]]) : super.dirty();

  @override
  ImageValidationError? validator(List<String?> value) {
    if (value.isEmpty ||
        value.every(
          (element) => element == null,
        ) ||
        value.every(
          (element) => element!.isEmpty,
        )) return ImageValidationError.noImages;
    return null;
  }
}
