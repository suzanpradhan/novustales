part of 'get_profile_bloc.dart';

@freezed
class GetProfileState with _$GetProfileState {
  const factory GetProfileState.initial() = _Initial;
  const factory GetProfileState.loading() = _Loading;
  const factory GetProfileState.success({required ProfileEntity me}) = _Success;
  const factory GetProfileState.failed({required String message}) = _Failed;
}
