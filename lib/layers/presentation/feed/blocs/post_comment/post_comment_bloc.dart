import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/presentation/ui/text_input.dart';
import '../../../../../utils/secure_storage.dart';
import '../../../../domain/usecases/comments/post_comment.dart';

part 'generated/post_comment_bloc.freezed.dart';
part 'post_comment_event.dart';
part 'post_comment_state.dart';

class PostCommentBloc extends Bloc<PostCommentEvent, PostCommentState> {
  final PostComment _postComment;

  PostCommentBloc(this._postComment) : super(const PostCommentState()) {
    on<PostCommentEvent>((event, emit) {});

    on<_ValidateComment>(
      (event, emit) {
        log("event comment ${event.comment}");
        final comment = RequiredTextInput.dirty(event.comment);
        emit(state.copyWith(
          comment: comment,
          status: FormzSubmissionStatus.initial,
        ));
      },
    );

    on<_PostComment>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final senderId =
          await SecureStorageMixin().getValue(SecureStorageKeys.id);
      if (Formz.validate([state.comment]) && senderId != null) {
        (await _postComment.call(PostCommentParams(
                content: state.comment.value,
                user: int.parse(senderId),
                story: event.story,
                parent: event.parent)))
            .fold(
                (l) => {
                      emit(state.copyWith(
                        status: FormzSubmissionStatus.failure,
                      ))
                    },
                (r) => {
                      emit(state.copyWith(
                          comment: const RequiredTextInput.pure(),
                          status: FormzSubmissionStatus.success))
                    });
      }
    });
  }
}
