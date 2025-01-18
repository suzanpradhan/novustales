import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../../../domain/entities/comment_entity.dart';
import '../blocs/post_comment/post_comment_bloc.dart';

class CommentCard extends StatelessWidget {
  final CommentEntity comment;
  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    final formattedTime = timeago.format(DateTime.parse(comment.createdAt!),
        locale: 'en_short', allowFromNow: false);
    return Container(
        padding: EdgeInsets.symmetric(vertical: UIConstants.minPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: comment.userDetails?.avatar != null &&
                      comment.userDetails!.avatar!.isNotEmpty
                  ? NetworkImage(comment.userDetails!.avatar!)
                  : null,
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.purpleAccent.withOpacity(0.2),
                    shape: BoxShape.circle),
                child: Center(
                  child: comment.userDetails?.avatar == null ||
                          comment.userDetails!.avatar!.isEmpty
                      ? Text(
                          (comment.userDetails!.nickName ??
                              comment.userDetails!.name ??
                              'X')[0],
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontSize: 60),
                        )
                      : null,
                ),
              ),
            ),
            Gapper.hmGap(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.bodySmall,
                        children: [
                          TextSpan(
                            text: comment.userDetails?.name ??
                                comment.userDetails?.email ??
                                '-',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          WidgetSpan(child: Gapper.h2xmGap()),
                          TextSpan(
                              // text: comment.createdAt != null
                              //     ? (formattedTime.split(" ")[0] == 'a'
                              //             ? "1"
                              //             : formattedTime.split(" ")[0]) +
                              //         formattedTime.split(" ")[1].split('')[0]
                              //     : "",
                              text: formattedTime,
                              style: Theme.of(context).textTheme.labelSmall)
                        ]),
                  ),
                  Text(
                    "${comment.content}",
                    maxLines: 10,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  InkWell(
                    onTap: () {
                      if (comment.id != null && comment.userDetails != null) {
                        context.read<PostCommentBloc>().add(
                            PostCommentEvent.replyComment(
                                parent: comment.id!,
                                replyToUser: comment.userDetails!));
                      }
                    },
                    child: Text("Reply",
                        style: Theme.of(context).textTheme.labelSmall),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
