import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';

import '../../../../domain/usecases/feed/get_stories.dart';

part 'for_you_story_event.dart';
part 'for_you_story_state.dart';
part 'generated/for_you_story_bloc.freezed.dart';

class ForYouStoryBloc extends Bloc<ForYouStoryEvent, ForYouStoryState> {
  final GetStories _getStories;
  int currentPage = 0;
  ForYouStoryBloc(this._getStories)
      : super(_Initial(hasMoreData: true, stories: [])) {
    on<ForYouStoryEvent>((event, emit) {});
    on<_Request>((event, emit) async {
      if (!state.hasMoreData) return;
      emit(_Loading(hasMoreData: state.hasMoreData, stories: state.stories));
      try {
        currentPage = currentPage + 1;
        final response = await _getStories.call(SearchStoryParams(
          recommendType: 'for_you',
          page: currentPage,
        ));
        response.fold((l) {
          emit(_Failed(
            stories: state.stories,
            hasMoreData: state.hasMoreData,
            message: "Server Error!",
          ));
        }, (r) {
          bool hasMoreData = r.nextPage ?? false;
          emit(_Success(
              hasMoreData: hasMoreData,
              stories: (state.stories ?? []) + (r.results ?? [])));
        });
      } catch (e) {
        emit(_Failed(
          stories: state.stories,
          hasMoreData: state.hasMoreData,
          message: "Server Error!",
        ));
      }
    });
  }
}
