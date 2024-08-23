part of 'trending_story_bloc.dart';

@freezed
class TrendingStoryEvent with _$TrendingStoryEvent {
  const factory TrendingStoryEvent.request() = _Request;
}
