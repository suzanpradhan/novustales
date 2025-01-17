import 'package:dartz/dartz.dart';
import 'package:storyv2/core/api/api_client.dart';
import 'package:storyv2/core/api/api_paths.dart';
import 'package:storyv2/core/error/failures.dart';
import 'package:storyv2/core/helpers/extensions.dart';

import '../../domain/usecases/comments/get_comments.dart';
import '../../domain/usecases/comments/post_comment.dart';
import '../models/comment.dart';
import '../models/paginated_response.dart';

abstract class CommentSource {
  Future<Either<Failure, Comment>> postComment(PostCommentParams params);
  Future<Either<Failure, PaginatedResponse<Comment>>> getComments(
      GetCommentsParams params);
}

class CommentSourceImpl implements CommentSource {
  final ApiClient _apiClient;

  CommentSourceImpl(this._apiClient);

  @override
  Future<Either<Failure, Comment>> postComment(PostCommentParams params) async {
    final response = await _apiClient.postRequest(ApiPaths.commentUrl,
        data: params.toJson(),
        converter: (response) => Comment.fromJson(response));
    return response;
  }

  @override
  Future<Either<Failure, PaginatedResponse<Comment>>> getComments(
      GetCommentsParams params) async {
    final response = await _apiClient.getRequest(
      "${ApiPaths.commentUrl}?${params.toJson().toQueryString()}",
      converter: (response) =>
          PaginatedResponse<Comment>.fromJson(response, Comment.fromJson),
      queryParameters: params.toJson(),
    );
    return response;
  }
}
