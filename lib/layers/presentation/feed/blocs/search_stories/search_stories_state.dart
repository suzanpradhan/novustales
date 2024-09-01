part of 'search_stories_bloc.dart';

@freezed
class SearchStoriesState with _$SearchStoriesState {
  const factory SearchStoriesState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(SearchInput.pure()) SearchInput search,
    @Default(ArrayInput.pure()) ArrayInput categoryNames,
    // @Default(true) bool isFirstAttempt,
    String? message,
    List<StoryEntity>? filterData,
    // @Default(true) bool hasMoreData,
  }) = _SearchStoriesState;
}
