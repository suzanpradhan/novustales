import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/domain/entities/story_entity.dart';
import 'package:storyv2/layers/domain/usecases/feed/get_trending_story.dart';

part 'generated/trending_story_bloc.freezed.dart';
part 'trending_story_event.dart';
part 'trending_story_state.dart';

class TrendingStoryBloc extends Bloc<TrendingStoryEvent, TrendingStoryState> {
  final GetTrendingStory getTrendingStory;
  TrendingStoryBloc(this.getTrendingStory) : super(_Initial()) {
    on<TrendingStoryEvent>((event, emit) {});
    on<_Request>((event, emit) async {
      emit(_Loading());
      try {
        final response = await getTrendingStory.call(NoParams());
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
