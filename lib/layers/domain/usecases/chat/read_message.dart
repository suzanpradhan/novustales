// ignore_for_file: invalid_annotation_target

import 'package:dartz/dartz.dart';
import 'package:storyv2/layers/domain/usecases/chat/send_message.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../repositories/chat_repository.dart';

class ReadMessage implements UseCase<Either<Failure, bool>, SendMessageParams> {
  final ChatRepository chatRepository;

  ReadMessage(this.chatRepository);

  @override
  Future<Either<Failure, bool>> call(SendMessageParams params) async {
    return (chatRepository.readMessage(params));
  }
}
