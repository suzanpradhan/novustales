part of 'post_comment_bloc.dart';

@freezed
class PostCommentEvent with _$PostCommentEvent {
  const factory PostCommentEvent.validateComment(
      {@Default("") String comment}) = _ValidateComment;
  const factory PostCommentEvent.postComment({
    required int story,
  }) = _PostComment;
  const factory PostCommentEvent.replyComment({
    int? parent,
    UserDetailsEntity? replyToUser,
  }) = _ReplyComment;
}