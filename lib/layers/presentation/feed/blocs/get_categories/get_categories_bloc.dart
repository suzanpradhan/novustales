import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../domain/entities/category_entity.dart';
import '../../../../domain/usecases/feed/get_categories.dart';

part 'generated/get_categories_bloc.freezed.dart';
part 'get_categories_event.dart';
part 'get_categories_state.dart';

class GetCategoriesBloc extends Bloc<GetCategoriesEvent, GetCategoriesState> {
  final GetCategories _getCategories;
  GetCategoriesBloc(this._getCategories) : super(_Initial()) {
    on<GetCategoriesEvent>((event, emit) {});
    on<_Started>((event, emit) async {
      emit(_Loading());
      try {
        final response = await _getCategories.call(NoParams());
        response.fold((l) {
          emit(_Failed(message: "Failed to get tales"));
        }, (r) {
          emit(_Success(categories: r));
        });
      } catch (e) {
        emit(_Failed(message: "Failed to get tales"));
      }
    });
  }
}
