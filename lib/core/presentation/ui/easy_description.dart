import 'package:flutter/material.dart';
import 'package:storyv2/core/helpers/extensions.dart';

import '../../constants/app_colors.dart';

class EasyDescription extends StatefulWidget {
  final String? description;
  final int? wordLimits;
  final bool showIsMore;
  const EasyDescription(
      {super.key, this.description, this.wordLimits, this.showIsMore = true});

  @override
  State<EasyDescription> createState() => _EasyDescriptionState();
}

class _EasyDescriptionState extends State<EasyDescription> {
  bool showMore = false;
  int initialWordLimit = 25;
  List<String> words = [];

  @override
  void initState() {
    super.initState();
    words = "${widget.description}".split(' ');
    initialWordLimit = widget.wordLimits ?? 25;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              showMore = !showMore;
            });
          },
          child: Text(
            "${widget.description}".truncateWithEllipsis(
                showMore ? words.length : initialWordLimit),
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontFamily: "UberRegular", color: AppColors.grayDark),
          ),
        ),
        if (words.length >= initialWordLimit && widget.showIsMore)
          GestureDetector(
            onTap: () {
              setState(() {
                showMore = !showMore;
              });
            },
            child: Text(
              showMore ? "See less" : "See more",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.black),
            ),
          ),
      ],
    );
  }
}
