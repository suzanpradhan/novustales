import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/presentation/ui/input_modals/array_input.dart';
import '../../../../../core/presentation/ui/input_modals/search_input.dart';
import '../../../../domain/entities/story_entity.dart';
import '../../../../domain/usecases/feed/get_stories.dart';

part 'generated/search_stories_bloc.freezed.dart';
part 'search_stories_event.dart';
part 'search_stories_state.dart';

class SearchStoriesBloc extends Bloc<SearchStoriesEvent, SearchStoriesState> {
  final GetStories _getstories;
  int currentPage = 0;
  SearchStoriesBloc(this._getstories) : super(SearchStoriesState()) {
    on<SearchStoriesEvent>((event, emit) {});

    on<_RegisterCategoryName>(
      (event, emit) async {
        if (state.categoryNames.value == null ||
            !state.categoryNames.value!.contains(event.categoryName)) {
          log("here");

          emit(state.copyWith(
              categoryNames: ArrayInput.dirty(
                  [...state.categoryNames.value ?? [], event.categoryName])));
        } else {
          List<String> categoryNames = state.categoryNames.value ?? [];
          categoryNames.remove(event.categoryName);
          emit(state.copyWith(
              categoryNames: ArrayInput.dirty([
            ...categoryNames,
          ])));
        }

        await search(emit);
      },
    );

    on<_RegisterSearchString>(
      (event, emit) {
        emit(state.copyWith(search: SearchInput.dirty(event.search)));
      },
    );

    on<_Attempt>((event, emit) async {
      emit(state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ));
      currentPage = 1;
      await search(emit);
    });

    on<_Paginate>((event, emit) async {
      emit(state.copyWith(
        status: FormzSubmissionStatus.inProgress,
      ));
      if (!state.hasMoreData) return;
      currentPage = currentPage + 1;
      await search(emit);
    });
  }

  search(Emitter<SearchStoriesState> emit) async {
    final data = await _getstories.call(SearchStoryParams(
        page: currentPage,
        search: state.search.value,
        categoryNameIn: state.categoryNames.value));
    data.fold((failure) {
      if (failure is ServerFailure) {
        emit(state.copyWith(message: failure.message ?? "Server Error!"));
      }
    }, (response) {
      bool hasMoreData = response.nextPage ?? false;
      emit(state.copyWith(
          message: "Successful fetching Stories",
          filterData: [
            ...state.filterData ?? [],
            ...response.results ?? [],
          ],
          status: FormzSubmissionStatus.success,
          hasMoreData: hasMoreData));
    });
  }
}
