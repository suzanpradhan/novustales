import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/layers/domain/usecases/tales/get_near_me_tales.dart';

import '../../../../domain/entities/tale_entity.dart';

part 'generated/get_near_me_tales_bloc.freezed.dart';
part 'get_near_me_tales_event.dart';
part 'get_near_me_tales_state.dart';

class GetNearMeTalesBloc extends Bloc<GetNearMeTalesEvent, GetNearMeTalesState> {
  final GetNearMeTales getNearMeTales;
  GetNearMeTalesBloc(this.getNearMeTales) : super(_Initial()) {
    on<GetNearMeTalesEvent>((event, emit) {});
    on<_Request>((event, emit) async {
      emit(_Loading());
      try {
        final response = await getNearMeTales.call(event.params);
        response.fold((l) {
          emit(_Failed(message: "Failed to get near me tales"));
        }, (r) {
          emit(_Success(tales: r));
        });
      } catch (e) {
        emit(_Failed(message: "Failed to get near me tales"));
      }
    });
  }
}
