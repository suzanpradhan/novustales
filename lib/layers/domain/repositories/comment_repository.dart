import 'package:dartz/dartz.dart';
import 'package:storyv2/core/error/failures.dart';

import '../entities/comment_entity.dart';
import '../usecases/comments/post_comment.dart';

abstract class CommentRepository {
  Future<Either<Failure, CommentEntity>> postComment(PostCommentParams params);
}
