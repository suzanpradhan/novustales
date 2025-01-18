import 'package:freezed_annotation/freezed_annotation.dart';

import 'story_entity.dart';

part 'generated/comment_entity.freezed.dart';

@freezed
class CommentEntity with _$CommentEntity {
  const factory CommentEntity(
      {int? id,
      int? likes,
      bool? isLiked,
      String? content,
      String? createdAt,
      UserDetailsEntity? userDetails,
      int? story,
      int? parent,
      List<CommentEntity>? children}) = _CommentEntity;
}
