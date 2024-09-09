// ignore_for_file: invalid_annotation_target

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../repositories/chat_repository.dart';

part 'generated/send_message.freezed.dart';
part 'generated/send_message.g.dart';

class SendMessage implements UseCase<Either<Failure, bool>, SendMessageParams> {
  final ChatRepository chatRepository;

  SendMessage(this.chatRepository);

  @override
  Future<Either<Failure, bool>> call(SendMessageParams params) async {
    return (chatRepository.sendMessage(params));
  }
}

@freezed
class SendMessageParams with _$SendMessageParams {
  const factory SendMessageParams(
      {@JsonKey(name: "profile_id") required String senderId,
      @JsonKey(name: "room_id") required String roomId,
      required String content}) = _SendMessageParams;

  factory SendMessageParams.fromJson(Map<String, dynamic> json) =>
      _$SendMessageParamsFromJson(json);
}
