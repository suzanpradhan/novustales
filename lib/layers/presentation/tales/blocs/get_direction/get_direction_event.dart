part of 'get_direction_bloc.dart';

@freezed
class GetDirectionEvent with _$GetDirectionEvent {
  const factory GetDirectionEvent.request({required LatLng origin, required LatLng destination}) =
      _Request;
}
