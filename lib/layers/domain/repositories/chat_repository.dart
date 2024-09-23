import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecases/usecase.dart';
import '../entities/chat/message_entity.dart';
import '../entities/chat/room_entity.dart';
import '../usecases/chat/check_or_create_profile.dart';
import '../usecases/chat/message_stream.dart';
import '../usecases/chat/send_message.dart';

abstract class ChatRepository {
  Future<List<RoomEntity>> getRooms(NoParams params);
  Future<bool> checkOrCreateProfile(CheckOrCreateProfileParams params);
  Stream<List<MessageEntity>> messageStream(GetStreamParams getStreamParams);
  Future<Either<Failure, bool>> sendMessage(
      SendMessageParams sendMessageParams);
  Future<Either<Failure, bool>> readMessage(
      SendMessageParams sendMessageParams);
}
