part of 'get_comments_bloc.dart';

@freezed
class GetCommentsState with _$GetCommentsState {
  const factory GetCommentsState.initial({
    required List<CommentEntity> stories,
  }) = _Initial;
  const factory GetCommentsState.loading({
    required List<CommentEntity> stories,
  }) = _Loading;
  const factory GetCommentsState.success({
    required List<CommentEntity> stories,
  }) = _Success;
  const factory GetCommentsState.failed({
    required String message,
    required List<CommentEntity> stories,
  }) = _Failed;
}
