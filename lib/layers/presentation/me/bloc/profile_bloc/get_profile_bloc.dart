import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/domain/entities/profile_entity.dart';
import 'package:storyv2/layers/domain/usecases/profile/get_my_profile.dart';

part 'generated/get_profile_bloc.freezed.dart';
part 'get_profile_event.dart';
part 'get_profile_state.dart';

class GetProfileBloc extends Bloc<GetProfileEvent, GetProfileState> {
  final GetMyProfile getMyProfile;
  GetProfileBloc(this.getMyProfile) : super(_Initial()) {
    on<GetProfileEvent>((event, emit) {});
    on<_Request>((event, emit) async {
      emit(_Loading());
      try {
        final response = await getMyProfile.call(NoParams());
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
