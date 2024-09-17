import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/layers/presentation/chat/widget/chat_image_widget.dart';

import '../../../../core/presentation/ui/spacer.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../domain/entities/chat/room_entity.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    super.key,
    required this.room,
  });

  final RoomEntity room;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(SINGLE_CHAT_ROUTE, extra: room);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: UIConstants.padding),
        width: double.maxFinite,
        child: SizedBox(
          width: double.maxFinite,
          child: Row(
            children: [
              Container(
                height: 64,
                width: 64,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ChatImageWidget(
                    imageUrls: room.receiverUser
                            ?.map((e) => e.avatar ?? '')
                            .toList() ??
                        []),
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
                      style: TextStyle(
                        fontFamily: 'RalewayRegular',
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${room.lastMessage}' ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'RalewayRegular',
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Text(
                          "2:22pm",
                          style: TextStyle(
                            fontFamily: 'RalewayRegular',
                            fontSize: 10,
                          ),
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
    );
  }
}
