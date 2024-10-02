import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/usecases/chat/read_message.dart';
import '../../../../domain/usecases/chat/send_message.dart';

part 'generated/read_message_bloc.freezed.dart';
part 'read_message_event.dart';
part 'read_message_state.dart';

class ReadMessageBloc extends Bloc<ReadMessageEvent, ReadMessageState> {
  final ReadMessage _readMessage;
  ReadMessageBloc(this._readMessage) : super(_Initial()) {
    on<ReadMessageEvent>((event, emit) {});
    on<_ReadMessage>((event, emit) async {
      emit(_Loading());
      (await _readMessage.call(SendMessageParams(
              senderId: event.senderId, roomId: event.roomId, content: '')))
          .fold(
              (l) => {emit(_Failure("failed reading message"))},
              (r) => {
                    emit(_Success()),
                  });
    });
  }
}
