import 'package:flutter/material.dart';
import 'package:storyv2/layers/presentation/feed/widgets/emoji_imput_field.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/presentation/ui/spacer.dart';

class CommentModalBottomSheet extends StatelessWidget {
  final int? storyId;
  const CommentModalBottomSheet({super.key, this.storyId});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                _buildHeader(context),
                Expanded(
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      // Scrollable Content
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) => ListTile(
                            title: Text('Comment $index'),
                          ),
                          childCount: 50,
                        ),
                      ),
                    ],
                  ),
                ),
                _buildFooter(storyId),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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

  Widget _buildFooter(int? storyId) {
    return Container(
        height: 88, // Fixed height for the footer
        padding: EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        child: Emojiinputfield(
          storyId: storyId,
        ));
  }
}
