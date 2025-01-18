import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/get_comments/get_comments_bloc.dart';
import 'comment_card.dart';
import 'comment_card_shimmer.dart';

class ScrollableCommentList extends StatefulWidget {
  final ScrollController scrollController;
  final int storyId;
  const ScrollableCommentList(
      {super.key, required this.scrollController, required this.storyId});

  @override
  State<ScrollableCommentList> createState() => _ScrollableCommentListState();
}

class _ScrollableCommentListState extends State<ScrollableCommentList> {
  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (widget.scrollController.position.atEdge) {
      if (widget.scrollController.position.pixels != 0) {
        log("here ${widget.scrollController.position.pixels}");
        context
            .read<GetCommentsBloc>()
            .add(GetCommentsEvent.attempt(storyId: widget.storyId.toString()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.scrollController,
      slivers: [
        // Scrollable Content
        BlocBuilder<GetCommentsBloc, GetCommentsState>(
          builder: (context, getCommentsState) {
            return SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) => getCommentsState.stories.isNotEmpty
                  ? CommentCard(comment: getCommentsState.stories[index])
                  : getCommentsState.maybeMap(
                      loading: (value) => CommentCardShimmer(),
                      orElse: () => SizedBox(),
                    ),
              childCount: getCommentsState.stories.isNotEmpty
                  ? getCommentsState.stories.length
                  : getCommentsState.maybeMap(
                      loading: (value) => 3,
                      orElse: () => 0,
                    ),
            ));
          },
        ),
      ],
    );
  }
}
