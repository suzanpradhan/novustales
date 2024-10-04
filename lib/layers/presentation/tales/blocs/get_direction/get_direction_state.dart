part of 'get_direction_bloc.dart';

@freezed
class GetDirectionState with _$GetDirectionState {
  const factory GetDirectionState.initial() = _Initial;
  const factory GetDirectionState.loading() = _Loading;
  const factory GetDirectionState.success({required List<LatLng> polylinePoints}) = _Success;
  const factory GetDirectionState.failed({required String message}) = _Failed;
}
