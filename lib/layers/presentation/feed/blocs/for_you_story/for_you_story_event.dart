part of 'for_you_story_bloc.dart';

@freezed
class ForYouStoryEvent with _$ForYouStoryEvent {
  const factory ForYouStoryEvent.request() = _Request;
}
