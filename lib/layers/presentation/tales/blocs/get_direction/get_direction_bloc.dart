import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:storyv2/layers/domain/usecases/tales/get_direction.dart';

part 'generated/get_direction_bloc.freezed.dart';
part 'get_direction_event.dart';
part 'get_direction_state.dart';

class GetDirectionBloc extends Bloc<GetDirectionEvent, GetDirectionState> {
  final GetDirection getNearMeTales;
  GetDirectionBloc(this.getNearMeTales) : super(_Initial()) {
    on<GetDirectionEvent>((event, emit) {});
    on<_Request>((event, emit) async {
      emit(_Loading());
      try {
        final response = await getNearMeTales
            .call(GetDirectionParams(origin: event.origin, destination: event.destination));
        response.fold((l) {
          log("didnt direction");
          emit(_Failed(message: l.toString()));
        }, (r) {
          log("got direction");
          emit(_Success(polylinePoints: r));
        });
      } catch (e) {
        log(e.toString());
        emit(_Failed(message: e.toString()));
      }
    });
  }
}
