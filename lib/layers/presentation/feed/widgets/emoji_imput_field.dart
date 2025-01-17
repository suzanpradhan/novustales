import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../../../../core/presentation/widgets/form_fields/form_input_field.dart';
import '../blocs/post_comment/post_comment_bloc.dart';

class Emojiinputfield extends StatelessWidget {
  final int? storyId;
  const Emojiinputfield({super.key, this.storyId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCommentBloc, PostCommentState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final comment = state.comment.value;
        return Column(
          children: [
            Gapper.v2xmGap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildEmojiButton("❤️", context, state),
                _buildEmojiButton("🙌", context, state),
                _buildEmojiButton("👏", context, state),
                _buildEmojiButton("🔥", context, state),
                _buildEmojiButton("😢", context, state),
                _buildEmojiButton("😮", context, state),
                _buildEmojiButton("😂", context, state),
                _buildEmojiButton("😍", context, state),
              ],
            ),
            // Input Field
            FormInputField(
              placeholder: "Type a message",
              height: 50,
              maxLines: 1,
              initialValue: comment,
              color: AppColors.white,
              border: Border.all(width: 0, color: Colors.transparent),
              suffix: InkWell(
                onTap: () {
                  if (storyId != null) {
                    context
                        .read<PostCommentBloc>()
                        .add(PostCommentEvent.postComment(story: storyId!));
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(right: UIConstants.xminPadding),
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius:
                          BorderRadius.circular(UIConstants.minBorderRadius)),
                  child: Icon(Icons.send,
                      size: 20, color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
              onChanged: (value) {
                log("value $value");
                context
                    .read<PostCommentBloc>()
                    .add(PostCommentEvent.validateComment(comment: value));
              },
              context: context,
              alignment: InputAlignment.vertical,
            ),
          ],
        );
      },
    );
  }

  Widget _buildEmojiButton(
      String emoji, BuildContext context, PostCommentState state) {
    return GestureDetector(
      onTap: () => context.read<PostCommentBloc>().add(
          PostCommentEvent.validateComment(
              comment: "${state.comment.value}$emoji")),
      child: Text(
        emoji,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
