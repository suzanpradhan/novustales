part of 'get_popular_tales_bloc.dart';

@freezed
class GetPopularTalesState with _$GetPopularTalesState {
  const factory GetPopularTalesState.initial() = _Initial;
  const factory GetPopularTalesState.loading() = _Loading;
  const factory GetPopularTalesState.success({required List<TaleEntity> tales}) = _Success;
  const factory GetPopularTalesState.failed({required String message}) = _Failed;
}
