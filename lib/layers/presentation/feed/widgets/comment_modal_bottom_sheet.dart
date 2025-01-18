import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storyv2/layers/presentation/feed/widgets/emoji_imput_field.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../../../../utils/dependencies_injection.dart';
import '../blocs/get_comments/get_comments_bloc.dart';
import '../blocs/post_comment/post_comment_bloc.dart';
import 'scrollable_comment_list.dart';

class CommentModalBottomSheet extends StatelessWidget {
  final int storyId;
  const CommentModalBottomSheet({super.key, required this.storyId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PostCommentBloc(sl()),
        ),
        BlocProvider(
          create: (context) => GetCommentsBloc(sl())
            ..add(GetCommentsEvent.attempt(storyId: storyId.toString())),
        ),
      ],
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.6,
          maxChildSize: 0.9,
          snap: true,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  buildHeader(context),
                  Expanded(
                    child: Gapper.screenPadding(
                        child: ScrollableCommentList(
                            scrollController: scrollController,
                            storyId: storyId)),
                  ),
                  buildFooter(storyId),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gapper.vxmGap(),
          Container(
            constraints: const BoxConstraints(maxWidth: 120),
            width: double.infinity,
            height: 5,
            decoration: BoxDecoration(
                color: AppColors.whiteShade,
                borderRadius: BorderRadius.circular(5)),
          ),
          Gapper.vxmGap(),
          Text("Comments"),
        ],
      ),
    );
  }

  Widget buildFooter(int? storyId) {
    return Emojiinputfield(
      storyId: storyId,
    );
  }
}
