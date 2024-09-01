part of 'search_stories_bloc.dart';

@freezed
class SearchStoriesEvent with _$SearchStoriesEvent {
  const factory SearchStoriesEvent.registerSearchString(
      {@Default("") String search}) = _RegisterSearchString;
  const factory SearchStoriesEvent.registerCategoryName(
      {@Default("") String categoryName}) = _RegisterCategoryName;
  const factory SearchStoriesEvent.attempt() = _Attempt;
}
