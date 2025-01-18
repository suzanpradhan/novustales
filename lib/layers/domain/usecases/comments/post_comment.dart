// ignore_for_file: invalid_annotation_target

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../entities/comment_entity.dart';
import '../../repositories/comment_repository.dart';

part 'generated/post_comment.freezed.dart';
part 'generated/post_comment.g.dart';

class PostComment
    implements UseCase<Either<Failure, CommentEntity>, PostCommentParams> {
  final CommentRepository repository;

  PostComment(this.repository);

  @override
  Future<Either<Failure, CommentEntity>> call(PostCommentParams params) async {
    return (repository.postComment(params));
  }
}

@freezed
class PostCommentParams with _$PostCommentParams {
  const factory PostCommentParams({
    required String content,
    required int user,
    required int story,
    int? parent,
  }) = _PostCommentParams;

  factory PostCommentParams.fromJson(Map<String, dynamic> json) =>
      _$PostCommentParamsFromJson(json);
}
