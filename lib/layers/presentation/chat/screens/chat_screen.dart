import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../blocs/chat_rooms/chat_rooms_bloc.dart';
import '../widget/room_card.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<ChatRoomsBloc>()..add(ChatRoomsEvent.attempted()),
      child: BlocBuilder<ChatRoomsBloc, ChatRoomsState>(
        builder: (context, state) {
          return state.mapOrNull(
                success: (value) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text("Messages"),
                    ),
                    body: value.rooms.isNotEmpty
                        ? Gapper.screenPadding(
                            child: ListView.builder(
                                itemCount: value.rooms.length,
                                itemBuilder: (context, index) {
                                  final room = value.rooms[index];
                                  return RoomCard(room: room);
                                }),
                          )
                        : Container(
                            color: AppColors.black,
                            child: Center(
                              child: Text("No messages"),
                            ),
                          ),
                  );
                },
                failure: (value) => Container(
                  color: AppColors.black,
                  child: Center(
                    child: Text("Failure loading"),
                  ),
                ),
              ) ??
              SizedBox();
        },
      ),
    );
  }
}
