import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/usecases/usecase.dart';
import '../../entities/chat/message_entity.dart';
import '../../repositories/chat_repository.dart';

part 'generated/message_stream.freezed.dart';

class MessageStream
    implements UseCase<Stream<List<MessageEntity>>, GetStreamParams> {
  final ChatRepository chatRepository;

  MessageStream(this.chatRepository);

  @override
  Future<Stream<List<MessageEntity>>> call(GetStreamParams params) async {
    return (chatRepository.messageStream(params));
  }
}

@freezed
class GetStreamParams with _$GetStreamParams {
  const factory GetStreamParams({
    required String roomId,
  }) = _GetStreamParams;
}
