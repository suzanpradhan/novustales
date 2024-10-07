import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/layers/presentation/chat/widget/chat_image_widget.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../core/presentation/ui/spacer.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../domain/entities/chat/room_entity.dart';
import '../blocs/chat_rooms/chat_rooms_bloc.dart';
import '../blocs/read_message/read_message_bloc.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    super.key,
    required this.room,
  });

  final RoomEntity room;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReadMessageBloc, ReadMessageState>(
      listener: (context, state) {
        state.mapOrNull(
          success: (value) =>
              context.read<ChatRoomsBloc>().add(ChatRoomsEvent.attempted()),
        );
      },
      child: InkWell(
        onTap: () {
          context.push(SINGLE_CHAT_ROUTE, extra: room);
          if (room.read ?? false) return;
          context.read<ReadMessageBloc>().add(
              ReadMessageEvent.readMessage(senderId: "", roomId: room.uuid));
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: UIConstants.xminPadding,
              horizontal: UIConstants.x2minPadding),
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(UIConstants.minBorderRadius)),
              color: room.read ?? false
                  ? AppColors.white
                  : AppColors.purpleAccent.withOpacity(0.1)),
          child: SizedBox(
            width: double.maxFinite,
            child: Row(
              children: [
                Container(
                  height: 64,
                  width: 64,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: AppColors.greyAccent.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: ChatImageWidget(
                      imageUrls: (room.receiverUser
                                  ?.map((e) => e.avatar ?? '')
                                  .toList() ??
                              [])
                          .where((image) => image.isNotEmpty)
                          .toList()),
                ),
                Gapper.hmGap(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        room.receiverUser?.length == 1
                            ? room.receiverUser?.first.name ?? "-"
                            : room.name ?? "-",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${room.lastMessage}' ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          Text(
                            room.lastMessageTime != null
                                ? timeago.format(
                                    DateTime.parse(room.lastMessageTime!))
                                : '',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
