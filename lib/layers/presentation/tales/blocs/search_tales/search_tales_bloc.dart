import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/layers/domain/usecases/tales/search_tales.dart';

import '../../../../domain/entities/tale_entity.dart';

part 'generated/search_tales_bloc.freezed.dart';
part 'search_tales_event.dart';
part 'search_tales_state.dart';

class SearchTalesBloc extends Bloc<SearchTalesEvent, SearchTalesState> {
  final SearchTales searchTales;
  SearchTalesBloc(this.searchTales) : super(_Initial()) {
    on<SearchTalesEvent>((event, emit) {});
    on<_Request>((event, emit) async {
      emit(_Loading());
      try {
        final response = await searchTales.call(SearchTalesParams(searchText: event.searchText));
        response.fold((l) {
          emit(_Failed(message: "Failed to get tales"));
        }, (r) {
          emit(_Success(tales: r));
        });
      } catch (e) {
        emit(_Failed(message: "Failed to get tales"));
      }
    });
  }
}
