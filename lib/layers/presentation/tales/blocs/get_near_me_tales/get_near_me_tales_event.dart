part of 'get_near_me_tales_bloc.dart';

@freezed
class GetNearMeTalesEvent with _$GetNearMeTalesEvent {
  const factory GetNearMeTalesEvent.request({required NearMeTalesParams params}) = _Request;
}
