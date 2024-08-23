part of 'get_popular_tales_bloc.dart';

@freezed
class GetPopularTalesEvent with _$GetPopularTalesEvent {
  const factory GetPopularTalesEvent.request() = _Request;
}
