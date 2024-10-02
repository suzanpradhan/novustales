import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../../domain/entities/chat/message_entity.dart';
import '../../domain/entities/chat/room_entity.dart';
import '../../domain/repositories/chat_repository.dart';
import '../../domain/usecases/chat/check_or_create_profile.dart';
import '../../domain/usecases/chat/message_stream.dart';
import '../../domain/usecases/chat/send_message.dart';
import '../models/chat/room_response.dart';
import '../sources/chat_remote_source.dart';

class ChatRepositoryImpl extends ChatRepository {
  final ChatRemoteSource chatRemoteSource;

  ChatRepositoryImpl(this.chatRemoteSource);

  @override
  Future<List<RoomEntity>> getRooms(NoParams params) async {
    final Future<List<RoomModel>> rooms = chatRemoteSource.getRooms(params);

    return (await rooms).map((room) => room.toEntity()).toList();
  }

  @override
  Future<bool> checkOrCreateProfile(CheckOrCreateProfileParams params) async {
    return await chatRemoteSource.checkOrCreateProfileSource(params);
  }

  @override
  Stream<List<MessageEntity>> messageStream(GetStreamParams getStreamParams) {
    return chatRemoteSource
        .getMessagesStream(roomId: getStreamParams.roomId)
        .map((maps) => maps.map((map) => map.toEntity()).toList());
  }

  @override
  Future<Either<Failure, bool>> sendMessage(
      SendMessageParams sendMessageParams) {
    return chatRemoteSource.sendMessage(params: sendMessageParams);
  }

  @override
  Future<Either<Failure, bool>> readMessage(
      SendMessageParams sendMessageParams) {
    return chatRemoteSource.readMessage(params: sendMessageParams);
  }
}
