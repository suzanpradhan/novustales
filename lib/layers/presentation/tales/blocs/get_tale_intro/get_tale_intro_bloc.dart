import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/tale_entity.dart';

part 'generated/get_tale_intro_bloc.freezed.dart';
part 'get_tale_intro_event.dart';
part 'get_tale_intro_state.dart';

class GetTaleIntroBloc extends Bloc<GetTaleIntroEvent, GetTaleIntroState> {
  GetTaleIntroBloc() : super(_Initial()) {
    on<GetTaleIntroEvent>((event, emit) {});
    on<_Request>((event, emit) {
      emit(_Success(tale: event.tale));
    });
    on<_ReInitiate>((event, emit) {
      emit(_Initial());
    });
  }
}
