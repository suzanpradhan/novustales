import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storyv2/core/presentation/widgets/image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../core/constants/app_colors.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../../../domain/entities/chat/message_entity.dart';
import '../../me/bloc/profile_bloc/get_profile_bloc.dart';

class TextingBox extends StatefulWidget {
  const TextingBox(
      {super.key,
      required this.message,
      this.name,
      this.profileImage,
      this.createdAt});

  final MessageEntity message;
  final String? profileImage;
  final String? createdAt;

  final String? name;

  @override
  State<TextingBox> createState() => _TextingBoxState();
}

class _TextingBoxState extends State<TextingBox> {
  bool showCreatedAt = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileBloc, GetProfileState>(
        builder: (context, state) {
      return state.whenOrNull(
            success: (userSession) {
              if (userSession.uuid == widget.message.profileId) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  textDirection: TextDirection.rtl,
                  children: [
                    Flexible(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => setState(() {
                              showCreatedAt = !showCreatedAt;
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(
                                      4.0), // No rounding on top-left
                                  topRight: Radius.circular(
                                      4.0), // Rounded top-right corner
                                  bottomLeft: Radius.circular(
                                      12.0), // Rounded bottom-left corner
                                  bottomRight: Radius.circular(
                                      6.0), // Rounded bottom-right corner
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 10.0),
                                child: Text(
                                  widget.message.content ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                ),
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            height: showCreatedAt ? null : 0,
                            // clipBehavior: Clip.hardEdge,
                            child: Text(
                              overflow: TextOverflow.clip,
                              widget.createdAt != null
                                  ? timeago
                                      .format(DateTime.parse(widget.createdAt!))
                                  : "",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox())
                  ],
                );
              } else {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        if (widget.name != null) Gapper.v2xmGap(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: SizedBox(
                            width: 32,
                            height: 32,
                            child: ImageWidget(
                              imageUrl: widget.profileImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gapper.h2xmGap(),
                    Flexible(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.name != null)
                            Text(
                              widget.name!,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          if (widget.name != null) Gapper.v2xmGap(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                showCreatedAt = showCreatedAt ? false : true;
                              });
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.greyAccent,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      4.0), // No rounding on top-left
                                  topRight: Radius.circular(
                                      6.0), // Rounded top-right corner
                                  bottomLeft: Radius.circular(
                                      6.0), // Rounded bottom-left corner
                                  bottomRight: Radius.circular(
                                      12.0), // Rounded bottom-right corner
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 10.0),
                                child: Text(
                                  widget.message.content ?? "",
                                  style: Theme.of(context).textTheme.bodySmall!,
                                ),
                              ),
                            ),
                          ),
                          if (widget.createdAt != null && showCreatedAt)
                            Text(
                              timeago.format(DateTime.parse(widget.createdAt!)),
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          if (widget.createdAt != null && showCreatedAt)
                            Gapper.v2xmGap(),
                        ],
                      ),
                    ),
                    const Expanded(flex: 1, child: SizedBox())
                  ],
                );
              }
            },
          ) ??
          const SizedBox();
    });
  }
}
