part of 'message_stream_bloc.dart';

@freezed
class MessageStreamState with _$MessageStreamState {
  const factory MessageStreamState.initial() = _Initial;
  const factory MessageStreamState.loading() = _Loading;
  const factory MessageStreamState.success(
      {required List<MessageEntity> messages}) = _Success;
}
