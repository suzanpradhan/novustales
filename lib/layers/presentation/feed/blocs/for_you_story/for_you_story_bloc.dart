import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';
import 'package:storyv2/layers/domain/usecases/feed/get_for_me_story.dart';

part 'for_you_story_event.dart';
part 'for_you_story_state.dart';
part 'generated/for_you_story_bloc.freezed.dart';

class ForYouStoryBloc extends Bloc<ForYouStoryEvent, ForYouStoryState> {
  final GetForMeStory getForMeStory;
  ForYouStoryBloc(this.getForMeStory) : super(_Initial()) {
    on<ForYouStoryEvent>((event, emit) {});
    on<_Request>((event, emit) async {
      emit(_Loading());
      try {
        final response = await getForMeStory.call(NoParams());
        response.fold((l) {
          emit(_Failed(message: l.toString()));
        }, (r) {
          emit(_Success(story: r));
        });
      } catch (e) {
        emit(_Failed(message: e.toString()));
      }
    });
  }
}
