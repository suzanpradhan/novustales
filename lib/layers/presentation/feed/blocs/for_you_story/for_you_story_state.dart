part of 'for_you_story_bloc.dart';

@freezed
class ForYouStoryState with _$ForYouStoryState {
  const factory ForYouStoryState.initial(
      {List<StoryEntity>? stories, required bool hasMoreData}) = _Initial;
  const factory ForYouStoryState.loading(
      {List<StoryEntity>? stories, required bool hasMoreData}) = _Loading;
  const factory ForYouStoryState.success(
      {List<StoryEntity>? stories, required bool hasMoreData}) = _Success;
  const factory ForYouStoryState.failed({
    List<StoryEntity>? stories,
    required bool hasMoreData,
    String? message,
  }) = _Failed;
}
