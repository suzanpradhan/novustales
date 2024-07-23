import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../constants/app_color.dart';
import '../../../model/response/group.dart';
import '../../chat_convo/controller/chat_convo_controller.dart';
import '../../chat_convo/inner_screen.dart';

class GroupChatScreen extends ConsumerWidget {
  String senderId;
  GroupChatScreen({super.key, required this.senderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<List<Group>>(
        stream: ref.watch(chatControllerProvider).chatGroups(senderId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CupertinoActivityIndicator();
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var chatGroups = snapshot.data!;

              chatGroups.sort((a, b) => b.timeSent.compareTo(a.timeSent));

              var groupData = chatGroups[index];

              // var groupData = snapshot.data![index];

              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InnerScreen(
                            uid: groupData.groupId.toString(),
                            isGroupChat: true,
                            groupName: groupData.name ?? "",
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        title: Text(
                          groupData.name,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            groupData.lastMessage,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            groupData.groupPic,
                          ),
                          radius: 30,
                        ),
                        trailing: Text(
                          DateFormat.Hm().format(groupData.timeSent),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Divider(color: grey_600, indent: 85),
                ],
              );
            },
          );
        });
  }
}
