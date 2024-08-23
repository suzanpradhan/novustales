part of 'trending_story_bloc.dart';

@freezed
class TrendingStoryState with _$TrendingStoryState {
  const factory TrendingStoryState.initial() = _Initial;
  const factory TrendingStoryState.loading() = _Loading;
  const factory TrendingStoryState.success({required List<StoryEntity> story}) =
      _Success;
  const factory TrendingStoryState.failed({required String message}) = _Failed;
}
