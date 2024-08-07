part of 'search_tales_bloc.dart';

@freezed
class SearchTalesState with _$SearchTalesState {
  const factory SearchTalesState.initial() = _Initial;
  const factory SearchTalesState.loading() = _Loading;
  const factory SearchTalesState.success({required List<TaleEntity> tales}) = _Success;
  const factory SearchTalesState.failed({required String message}) = _Failed;
}
