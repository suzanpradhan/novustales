part of 'update_profile_bloc.dart';

@freezed
class UpdateProfileState with _$UpdateProfileState {
  const factory UpdateProfileState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(TextInput.pure()) TextInput firstName,
    @Default(TextInput.pure()) TextInput lastName,
    @Default(TextInput.pure()) TextInput bio,
    @Default(TextInput.pure()) TextInput avatar,
    int? uuid,
    @Default(false) bool isValid,
    String? message,
  }) = _UpdateMyProfileState;
}
