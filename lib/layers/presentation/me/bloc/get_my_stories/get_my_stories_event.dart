part of 'get_my_stories_bloc.dart';

@freezed
class GetMyStoriesEvent with _$GetMyStoriesEvent {
  const factory GetMyStoriesEvent.request() = _Request;
}
