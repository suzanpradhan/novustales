part of 'get_near_me_tales_bloc.dart';

@freezed
class GetNearMeTalesState with _$GetNearMeTalesState {
  const factory GetNearMeTalesState.initial() = _Initial;
  const factory GetNearMeTalesState.loading() = _Loading;
  const factory GetNearMeTalesState.success({required List<TaleEntity> tales}) = _Success;
  const factory GetNearMeTalesState.failed({required String message}) = _Failed;
}
