import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/entities/chat/message_entity.dart';
import '../../../../domain/usecases/chat/message_stream.dart';

part 'generated/message_stream_bloc.freezed.dart';
part 'message_stream_event.dart';
part 'message_stream_state.dart';

class MessageStreamBloc extends Bloc<MessageStreamEvent, MessageStreamState> {
  final MessageStream messageStream;
  MessageStreamBloc(this.messageStream) : super(const _Initial()) {
    on<MessageStreamEvent>((event, emit) {});
    on<_Attempted>((event, emit) async {
      emit(const _Loading());
      final stream =
          await messageStream.call(GetStreamParams(roomId: event.roomId));
      await emit.onEach(stream, onData: (data) {
        if (state is _Success) {
          emit((state as _Success).copyWith(messages: data));
        } else {
          emit(_Success(messages: data));
        }
      });
    });
  }
}
