import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/domain/usecases/tales/get_popular_tales.dart';

import '../../../../domain/entities/tale_entity.dart';

part 'generated/get_popular_tales_bloc.freezed.dart';
part 'get_popular_tales_event.dart';
part 'get_popular_tales_state.dart';

class GetPopularTalesBloc extends Bloc<GetPopularTalesEvent, GetPopularTalesState> {
  final GetPopularTales getPopularTales;
  GetPopularTalesBloc(this.getPopularTales) : super(_Initial()) {
    on<GetPopularTalesEvent>((event, emit) {});
    on<_Request>((event, emit) async {
      emit(_Loading());
      try {
        final response = await getPopularTales.call(NoParams());
        response.fold((l) {
          emit(_Failed(message: "Failed to get popular tales"));
        }, (r) {
          emit(_Success(tales: r));
        });
      } catch (e) {
        emit(_Failed(message: "Failed to get popular tales"));
      }
    });
  }
}
