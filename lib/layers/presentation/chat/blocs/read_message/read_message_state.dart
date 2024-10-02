part of 'read_message_bloc.dart';

@freezed
class ReadMessageState with _$ReadMessageState {
  const factory ReadMessageState.initial() = _Initial;
  const factory ReadMessageState.loading() = _Loading;
  const factory ReadMessageState.success() = _Success;
  const factory ReadMessageState.failure(String? message) = _Failure;
}
