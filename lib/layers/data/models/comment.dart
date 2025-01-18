import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storyv2/layers/data/models/story_response.dart';

import '../../domain/entities/comment_entity.dart';

part 'generated/comment.freezed.dart';
part 'generated/comment.g.dart';

@Freezed(toJson: false)
class Comment with _$Comment {
  const factory Comment({
    int? id,
    int? likes,
    int? story,
    int? parent,
    List<Comment>? children,
    @JsonKey(name: 'user_details') UserDetail? userDetails,
    @JsonKey(name: 'is_liked') bool? isLiked,
    String? content,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _Comment;

  const Comment._();

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  CommentEntity toEntity() => CommentEntity(
      id: id,
      content: content,
      createdAt: createdAt,
      isLiked: isLiked,
      likes: likes,
      parent: parent,
      story: story,
      children: children?.map((e) => e.toEntity()).toList(),
      userDetails: userDetails?.toEntity());
}
