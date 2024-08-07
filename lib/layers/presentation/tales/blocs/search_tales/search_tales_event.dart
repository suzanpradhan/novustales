part of 'search_tales_bloc.dart';

@freezed
class SearchTalesEvent with _$SearchTalesEvent {
  const factory SearchTalesEvent.request({required String searchText}) = _Request;
}
