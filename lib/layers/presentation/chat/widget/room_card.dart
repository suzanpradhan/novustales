import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storyv2/core/constants/ui_constants.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../../../../core/presentation/widgets/image_widget.dart';
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
                child: ImageWidget(
                  imageUrl: room.receiverUser?.avatar,
                  placeholderColor: AppColors.white,
                  placeholder: (room.receiverUser?.avatar == null ||
                          room.receiverUser!.avatar!.isEmpty)
                      ? Image.asset(
                          Assets.noProfile,
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
              ),
              Gapper.hmGap(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      room.receiverUser?.name ?? '',
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
