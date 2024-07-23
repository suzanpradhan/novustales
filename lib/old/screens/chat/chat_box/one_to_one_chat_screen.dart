import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as fr;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/api_response_config.dart';
import '../../../constants/app_image.dart';
import '../../../model/response/chat_contact.dart';
import '../../../model/response/user_response.dart';
import '../../../providers/common_view_model.dart';
import '../../chat_convo/controller/chat_convo_controller.dart';
import '../../chat_convo/inner_screen.dart';
import '../widget/conversation_list.dart';

class OneToOneChatScreen extends fr.ConsumerStatefulWidget {
  const OneToOneChatScreen({super.key});

  @override
  fr.ConsumerState<OneToOneChatScreen> createState() =>
      _OneToOneChatScreenState();
}

class _OneToOneChatScreenState extends fr.ConsumerState<OneToOneChatScreen> {
  late CommonViewModel _provider;
  Map<String, ChatContact> chatContactMap = {};

  @override
  void initState() {
    getUser();
    super.initState();
  }

  UserResponse? user;

  getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userData = sharedPreferences.getString('user');
    Map<String, dynamic> userMap = json.decode(userData!);
    UserResponse userD = UserResponse.fromJson(userMap);
    setState(() {
      user = userD;
    });
    // if (user != null) {
    //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //     _provider = Provider.of<CommonViewModel>(context, listen: false);
    //     _provider.fetchMyFriendList(user!.id.toString());
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonViewModel>(
      builder: (context, common, child) {
        print(
            "friend data response::${common.acceptRequestFriendList.friends == null || common.acceptRequestFriendList.friends!.isEmpty}");
        return isLoading(common.acceptRequestFriendListApiResponse)
            ? Center(child: CircularProgressIndicator())
            : common.acceptRequestFriendList.friends == null ||
                    common.acceptRequestFriendList.friends!.isEmpty
                ? Text("No Friends")
                : StreamBuilder<List<ChatContact>>(
                    stream: ref
                        .watch(chatControllerProvider)
                        .chatContacts("${user?.id}"),
                    builder: (context, snapshot) {
                      print("SNAPSHOT DATA::::$snapshot");
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CupertinoActivityIndicator();
                      }

                      // Populate the chatContactMap with chat contact data
                      snapshot.data?.forEach((chatContactData) {
                        chatContactMap[chatContactData.uid] = chatContactData;
                      });

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount:
                            common.acceptRequestFriendList.friends?.length,
                        itemBuilder: (context, index) {
                          var friendData =
                              common.acceptRequestFriendList.friends![index];
                          var chatContactData =
                              chatContactMap[friendData.id.toString()];

                          print(
                              "FRINED ALL LIST::::${friendData.email}::::${friendData.nickName}::${friendData.fullName}");

                          // var chatGroups = snapshot.data!;
                          //
                          // chatGroups.sort((a, b) => b.timeSent.compareTo(a.timeSent));
                          //
                          // var groupData = chatGroups[index];

                          return Container(
                            padding: EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: Colors.grey,
                            ))),
                            child: ConversationList(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InnerScreen(
                                      uid: friendData.id.toString(),
                                      isGroupChat: false,
                                      groupName: "",
                                    ),
                                  ),
                                );
                              },
                              name: friendData.fullName ?? "",
                              messageText:
                                  chatContactData?.lastMessage ?? "No message",
                              imageUrl: friendData.avatar ?? kPerson,
                              time: chatContactData?.timeSent != null
                                  ? DateFormat('hh:mm a').format(
                                      DateTime.parse(
                                          chatContactData!.timeSent.toString()),
                                    )
                                  : null,
                              isMessageRead:
                                  (index == 0 || index == 3) ? true : false,
                            ),
                          );
                        },
                      );
                    },
                  );
      },
    );
  }
}

class ChatUsers {
  String name;
  String messageText;
  String imageURL;
  String time;
  ChatUsers(
      {required this.name,
      required this.messageText,
      required this.imageURL,
      required this.time});
}
