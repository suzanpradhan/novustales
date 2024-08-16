part of 'for_you_story_bloc.dart';

@freezed
class ForYouStoryState with _$ForYouStoryState {
  const factory ForYouStoryState.initial() = _Initial;
  const factory ForYouStoryState.loading() = _Loading;
  const factory ForYouStoryState.success({required List<StoryEntity> story}) =
      _Success;
  const factory ForYouStoryState.failed({required String message}) = _Failed;
}
