import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../../../../core/presentation/widgets/form_fields/form_input_field.dart';
import '../blocs/post_comment/post_comment_bloc.dart';

class Emojiinputfield extends StatefulWidget {
  final int? storyId;
  const Emojiinputfield({super.key, this.storyId});

  @override
  State<Emojiinputfield> createState() => _EmojiinputfieldState();
}

class _EmojiinputfieldState extends State<Emojiinputfield> {
  final FocusNode _focusNode = FocusNode();
  bool toggleFocus = false;

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  // void _focusTextField() {
  //   if (!_focusNode.hasFocus && toggleFocus) {
  //   }

  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCommentBloc, PostCommentState>(
      listener: (context, state) {
        if (state.replyToUser != null && state.parentId != null) {
          FocusScope.of(context).requestFocus(_focusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      builder: (context, state) {
        final comment = state.comment.value;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state.parentId != null && state.replyToUser != null)
              Container(
                padding: EdgeInsets.only(
                  top: UIConstants.x2minPadding,
                  bottom: UIConstants.x2minPadding,
                ),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.greyWhite,
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade300, width: 1),
                  ),
                ),
                child: Gapper.screenPadding(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Replying to @${state.replyToUser!.name}",
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    InkWell(
                        onTap: () {
                          context
                              .read<PostCommentBloc>()
                              .add(PostCommentEvent.replyComment());
                        },
                        child: Icon(
                          Ionicons.close_circle_outline,
                          size: 16,
                        ))
                  ],
                )),
              ),
            Container(
              // height: 88, // Fixed height for the footer
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300, width: 1),
                ),
              ),
              child: Column(
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
                    focusNode: _focusNode,
                    initialValue: comment,
                    color: AppColors.white,
                    border: Border.all(width: 0, color: Colors.transparent),
                    suffix: InkWell(
                      onTap: () {
                        if (widget.storyId != null) {
                          context.read<PostCommentBloc>().add(
                              PostCommentEvent.postComment(
                                  story: widget.storyId!));
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                            right: UIConstants.xminPadding),
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(
                                UIConstants.minBorderRadius)),
                        child: Icon(Icons.send,
                            size: 20,
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                    onChanged: (value) {
                      log("value $value");
                      context.read<PostCommentBloc>().add(
                          PostCommentEvent.validateComment(comment: value));
                    },
                    context: context,
                    alignment: InputAlignment.vertical,
                  ),
                ],
              ),
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
