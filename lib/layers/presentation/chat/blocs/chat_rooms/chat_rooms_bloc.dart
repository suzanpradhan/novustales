import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/core/usecases/usecase.dart';
import 'package:storyv2/layers/domain/usecases/chat/get_rooms.dart';

import '../../../../domain/entities/chat/room_entity.dart';

part 'chat_rooms_event.dart';
part 'chat_rooms_state.dart';
part 'generated/chat_rooms_bloc.freezed.dart';

class ChatRoomsBloc extends Bloc<ChatRoomsEvent, ChatRoomsState> {
  final GetRooms getRooms;
  ChatRoomsBloc(this.getRooms) : super(_Initial()) {
    on<ChatRoomsEvent>((event, emit) {});
    on<_Attempted>((event, emit) async {
      emit(const _Loading());
      try {
        List<RoomEntity> rooms = await getRooms.call(NoParams());

        emit(_Success(rooms: rooms));
      } catch (e) {
        emit(_Failure("error"));
      }
    });
  }
}
