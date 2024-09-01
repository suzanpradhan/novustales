import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';

import '../../../../domain/usecases/feed/get_stories.dart';

part 'generated/get_stories_bloc.freezed.dart';
part 'get_stories_event.dart';
part 'get_stories_state.dart';

class GetStoriesBloc extends Bloc<GetStoriesEvent, GetStoriesState> {
  final GetStories _getStories;
  GetStoriesBloc(this._getStories) : super(_Initial()) {
    on<GetStoriesEvent>((event, emit) {});
    on<_Started>((event, emit) async {
      emit(_Loading());
      try {
        final response = await _getStories.call(SearchStoryParams());
        response.fold((l) {
          emit(_Failed(message: "Failed to get tales"));
        }, (r) {
          emit(_Success(stories: r));
        });
      } catch (e) {
        emit(_Failed(message: "Failed to get tales"));
      }
    });
  }
}
