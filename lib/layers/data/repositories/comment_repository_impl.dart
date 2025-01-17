import 'package:dartz/dartz.dart';
import 'package:storyv2/core/error/failures.dart';

import '../../domain/entities/comment_entity.dart';
import '../../domain/repositories/comment_repository.dart';
import '../../domain/usecases/comments/post_comment.dart';
import '../sources/comment_source.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentSource source;

  const CommentRepositoryImpl({
    required this.source,
  });

  @override
  Future<Either<Failure, CommentEntity>> postComment(
      PostCommentParams params) async {
    final response = await source.postComment(params);
    return response.fold((failure) => Left(failure), (response) async {
      return Right(response.toEntity());
    });
  }
}
