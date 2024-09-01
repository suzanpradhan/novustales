import 'package:formz/formz.dart';

enum SearchValidationError { empty }

class SearchInput extends FormzInput<String, SearchValidationError> {
  const SearchInput.pure() : super.pure('');
  const SearchInput.dirty([super.value = '']) : super.dirty();

  @override
  SearchValidationError? validator(String value) {
    // if (value.isEmpty) return SearchValidationError.empty;
    return null;
  }
}
