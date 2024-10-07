part of 'trending_story_bloc.dart';

@freezed
class TrendingStoryState with _$TrendingStoryState {
  const factory TrendingStoryState.initial(
      {List<StoryEntity>? stories, required bool hasMoreData}) = _Initial;
  const factory TrendingStoryState.loading(
      {List<StoryEntity>? stories, required bool hasMoreData}) = _Loading;
  const factory TrendingStoryState.success(
      {List<StoryEntity>? stories, required bool hasMoreData}) = _Success;
  const factory TrendingStoryState.failed({
    List<StoryEntity>? stories,
    required bool hasMoreData,
    String? message,
  }) = _Failed;
}
