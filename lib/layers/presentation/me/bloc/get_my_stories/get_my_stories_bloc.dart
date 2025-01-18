import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../domain/entities/pagination_entity.dart';
import '../../../../domain/entities/story_entity.dart';
import '../../../../domain/usecases/feed/get_my_stories.dart';

part 'generated/get_my_stories_bloc.freezed.dart';
part 'get_my_stories_event.dart';
part 'get_my_stories_state.dart';

class GetMyStoriesBloc extends Bloc<GetMyStoriesEvent, GetMyStoriesState> {
  final GetMyStories getMyProfile;
  GetMyStoriesBloc(this.getMyProfile) : super(_Initial()) {
    on<GetMyStoriesEvent>((event, emit) {});
    on<_Request>((event, emit) async {
      emit(_Loading());
      try {
        final response = await getMyProfile.call(NoParams());
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
