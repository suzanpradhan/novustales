part of 'get_stories_bloc.dart';

@freezed
class GetStoriesState with _$GetStoriesState {
  const factory GetStoriesState.initial() = _Initial;
  const factory GetStoriesState.loading() = _Loading;
  const factory GetStoriesState.success({required List<StoryEntity> stories}) =
      _Success;
  const factory GetStoriesState.failed({required String message}) = _Failed;
}
