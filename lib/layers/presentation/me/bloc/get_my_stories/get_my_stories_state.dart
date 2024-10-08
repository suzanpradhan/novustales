part of 'get_my_stories_bloc.dart';

@freezed
class GetMyStoriesState with _$GetMyStoriesState {
  const factory GetMyStoriesState.initial() = _Initial;
  const factory GetMyStoriesState.loading() = _Loading;
  const factory GetMyStoriesState.success(
      {required PaginationEntity<StoryEntity> tales}) = _Success;
  const factory GetMyStoriesState.failed({required String message}) = _Failed;
}
