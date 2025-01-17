import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../entities/comment_entity.dart';
import '../../entities/pagination_entity.dart';
import '../../repositories/comment_repository.dart';

part 'generated/get_comments.freezed.dart';
part 'generated/get_comments.g.dart';

class GetComments {
  final CommentRepository _commentRepository;

  GetComments(this._commentRepository);

  Future<Either<Failure, PaginationEntity<CommentEntity>>> call(
      GetCommentsParams storyId) async {
    return await (_commentRepository.getComments(storyId));
  }
}

@freezed
class GetCommentsParams with _$GetCommentsParams {
  const factory GetCommentsParams({
    @Default(1) int? page,
    @JsonKey(name: 'story_id') required int storyId,
  }) = _GetCommentsParams;

  factory GetCommentsParams.fromJson(Map<String, dynamic> json) =>
      _$GetCommentsParamsFromJson(json);
}
