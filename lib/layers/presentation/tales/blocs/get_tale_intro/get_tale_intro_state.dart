part of 'get_tale_intro_bloc.dart';

@freezed
class GetTaleIntroState with _$GetTaleIntroState {
  const factory GetTaleIntroState.initial() = _Initial;
  const factory GetTaleIntroState.loading() = _Loading;
  const factory GetTaleIntroState.success({TaleEntity? tale}) = _Success;
  const factory GetTaleIntroState.failed({required String message}) = _Failed;
}
