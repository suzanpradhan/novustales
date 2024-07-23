import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:provider/provider.dart' as provider;
import '../../config/preference_utils.dart';
import '../../constants/app_color.dart';
import '../../providers/auth_view_model.dart';
import '../chat/group/group_detail.dart';
import 'components/bottom_chat_field.dart';
import 'components/chat_list.dart';

class InnerScreen extends ConsumerStatefulWidget {
  String uid;
  bool isGroupChat;
  String? groupName;
  InnerScreen(
      {super.key,
      this.groupName,
      required this.uid,
      required this.isGroupChat});

  @override
  ConsumerState<InnerScreen> createState() => _InnerScreenState();
}

class _InnerScreenState extends ConsumerState<InnerScreen> {
  String userData = "";
  final sharedPreferences = PreferenceUtils.instance;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> requestNotificationPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
  }

  @override
  void initState() {
    // TODO: implement initState
    _firebaseMessaging.subscribeToTopic(widget.uid).then((value) {
      print("subscribed");
    });

    super.initState();
  }

  // void makeCall(WidgetRef ref, BuildContext context) {
  //   ref.read(callControllerProvider).makeCall(
  //     context,
  //     name,
  //     widget.uid,
  //     profilePic,
  //     widget.isGroupChat,
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // actions: [
        //   widget.isGroupChat == true
        //       ? StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        //           stream: FirebaseFirestore.instance
        //               .collection('groups')
        //               .doc(widget.uid)
        //               .snapshots(),
        //           builder: (context, snapshot) {
        //             if (snapshot.hasData) {
        //               Map<String, dynamic> datas =
        //                   snapshot.data?.data() as Map<String, dynamic>;
        //
        //               return Row(
        //                 children: [
        //                   ZegoSendCallInvitationButton(
        //                       timeoutSeconds: 60,
        //                       iconSize: Size.fromRadius(20),
        //                       buttonSize: Size.fromRadius(20),
        //                       isVideoCall: false,
        //                       resourceID: "zegouikit_call",
        //                       invitees: widget.isGroupChat == false
        //                           ? [
        //                               ZegoUIKitUser(
        //                                 id: widget.uid,
        //                                 name: widget.uid,
        //                               ),
        //                             ]
        //                           : [
        //                               for (var a in datas['membersUid'])
        //                                 ZegoUIKitUser(
        //                                   id: a,
        //                                   name: a,
        //                                 ),
        //                             ]),
        //                   const SizedBox(
        //                     width: 20,
        //                   ),
        //                   // video call button
        //                   ZegoSendCallInvitationButton(
        //                       timeoutSeconds: 60,
        //                       isVideoCall: true,
        //                       iconSize: Size.fromRadius(20),
        //                       buttonSize: Size.fromRadius(20),
        //                       resourceID: "zegouikit_call",
        //                       invitees: widget.isGroupChat == false
        //                           ? [
        //                               ZegoUIKitUser(
        //                                 id: widget.uid,
        //                                 name: widget.uid,
        //                               ),
        //                             ]
        //                           : [
        //                               for (var a in datas['membersUid'])
        //                                 ZegoUIKitUser(
        //                                   id: a,
        //                                   name: a,
        //                                 ),
        //                             ]),
        //                 ],
        //               );
        //             } else {
        //               return CupertinoActivityIndicator();
        //             }
        //           },
        //         )
        //       : Row(
        //           children: [
        //             ZegoSendCallInvitationButton(
        //                 timeoutSeconds: 60,
        //                 iconSize: Size.fromRadius(20),
        //                 buttonSize: Size.fromRadius(20),
        //                 isVideoCall: false,
        //                 resourceID: "zegouikit_call",
        //                 invitees: [
        //                   ZegoUIKitUser(
        //                     id: widget.uid,
        //                     name: widget.uid,
        //                   ),
        //                 ]),
        //             const SizedBox(
        //               width: 20,
        //             ),
        //             // video call button
        //             ZegoSendCallInvitationButton(
        //               timeoutSeconds: 60,
        //               isVideoCall: true,
        //               iconSize: Size.fromRadius(20),
        //               buttonSize: Size.fromRadius(20),
        //               resourceID: "zegouikit_call",
        //               invitees: [
        //                 ZegoUIKitUser(
        //                   id: widget.uid,
        //                   name: widget.uid,
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //   widget.isGroupChat
        //       ? IconButton(
        //           onPressed: () {
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) =>
        //                       GroupDetailScreen(groupId: widget.uid),
        //                 ));
        //           },
        //           icon: const Icon(Icons.more_vert))
        //       : const SizedBox(),
        // ],
        title: widget.isGroupChat == true
            ? StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('groups')
                    .doc(widget.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Map<String, dynamic> datas =
                        snapshot.data?.data() as Map<String, dynamic>;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.groupName.toString(),
                          style: TextStyle(color: black),
                        ),
                        Text(
                          "${datas['membersUid'].length} participants",
                          style: TextStyle(color: black, fontSize: 14),
                        )
                      ],
                    );
                  } else {
                    return CupertinoActivityIndicator();
                  }
                },
              )
            : StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('uid', isEqualTo: widget.uid) // Filter by uid
                    .snapshots(),
                builder: (context, snapshot) {
                  print('i am group::: ${snapshot.data?.docs}');
                  if (snapshot.hasData) {
                    Map<String, dynamic> userData =
                        snapshot.data?.docs[0].data() as Map<String, dynamic>;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userData['name'],
                          style: TextStyle(
                              color: Color(0xff204051),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          userData['isOnline'] == true ? 'online' : 'offline',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xff204051),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return CupertinoActivityIndicator();
                  }
                },
              ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatList(
              recieverUserId: widget.uid,
              isGroupChat: widget.isGroupChat,
            ),
          ),
          BottomChatField(
            senderId:
                provider.Provider.of<AuthViewModel>(context, listen: false)
                    .userData['id']
                    .toString(),
            recieverUserId: widget.uid,
            isGroupChat: widget.isGroupChat,
          ),
        ],
      ),
    );
  }
}
