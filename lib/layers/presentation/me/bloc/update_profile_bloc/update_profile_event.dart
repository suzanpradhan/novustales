part of 'update_profile_bloc.dart';

@freezed
class UpdateProfileEvent with _$UpdateProfileEvent {
  const factory UpdateProfileEvent.extraFields({
    int? uuid,
  }) = _ExtraFields;
  const factory UpdateProfileEvent.validateFirstName(
      {@Default("") String firstName}) = _ValidateFirstName;
  const factory UpdateProfileEvent.validateLastName(
      {@Default("") String lastName}) = _ValidateLastName;
  const factory UpdateProfileEvent.validateBio({@Default("") String bio}) =
      _ValidateBio;
  const factory UpdateProfileEvent.validateImage({@Default("") String avatar}) =
      _ValidateImage;
  const factory UpdateProfileEvent.attempt() = _Attempt;
}
