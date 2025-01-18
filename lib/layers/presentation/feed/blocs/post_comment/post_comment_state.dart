part of 'post_comment_bloc.dart';

@freezed
class PostCommentState with _$PostCommentState {
  const factory PostCommentState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(RequiredTextInput.pure()) RequiredTextInput comment,
  }) = _PostCommentState;
}
