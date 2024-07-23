import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/helper/overlay_notification.dart';

import '../../../model/response/friend_request_response.dart';
import '../../../model/response/user_response.dart';
import '../../../network/repo/message_repoistory.dart';
import '../../../providers/common_view_model.dart';

class SingleUserRequest extends StatefulWidget {
  bool isloading;
  bool rejectIsLoading;
  FriendRequestResponse datas;
  int index;
  UserResponse? user;

  SingleUserRequest(
      {super.key,
      required this.isloading,
      required this.rejectIsLoading,
      required this.datas,
      required this.index,
      required this.user});

  @override
  State<SingleUserRequest> createState() => _SingleUserRequestState();
}

class _SingleUserRequestState extends State<SingleUserRequest> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CommonViewModel>(builder: (context, common, child) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage: Image.network(
                      "https://brain.novutales.com${widget.datas.fromUser!.avatar.toString()}",
                      fit: BoxFit.fill,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ).image,
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.datas.fromUser != null ||
                                widget.datas.fromUser!.nickName != ""
                            ? widget.datas.fromUser!.nickName.toString()
                            : "N/A",
                        style: const TextStyle(
                          color: Colors.black,
                          // color: Color(0xFF204051),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        "Wants to initiate communication with you",
                        style: TextStyle(
                          color: Color(0xFF204051),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: widget.isloading == true
                                  ? () {}
                                  : () async {
                                      try {
                                        setState(() {
                                          widget.isloading = true;
                                        });
                                        FriendRequestResponse response =
                                            await MessageRepository()
                                                .acceptRequestRepot(
                                                    widget.datas.id != null
                                                        ? widget.datas.id
                                                            .toString()
                                                        : "");
                                        if (context.mounted) {
                                          setState(() {
                                            widget.isloading = false;
                                          });
                                          common.fetchFriendRequest();
                                          if (widget.user != null) {
                                            // common.fetchMyFriendList(
                                            //     widget.user!.id.toString());
                                            common
                                                .fetchAcceptRequestFriendList();
                                          }

                                          showTopOverlayNotification(
                                              title:
                                                  "Request Accepted Successfully");
                                        } else {
                                          setState(() {
                                            widget.isloading = false;
                                          });
                                          showTopOverlayNotificationError(
                                              title:
                                                  response.detail.toString());
                                        }
                                      } catch (e) {
                                        setState(() {
                                          widget.isloading = false;
                                        });

                                        showTopOverlayNotificationError(
                                            title:
                                                "Something went wrong. Please try again later.");
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Color(0xFFF5F5F5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: widget.isloading == true
                                  ? Center(
                                      child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator()))
                                  : Text("Accept",
                                      style:
                                          TextStyle(color: Color(0xff3FA3FF))),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: widget.rejectIsLoading == true
                                  ? () {}
                                  : () async {
                                      try {
                                        setState(() {
                                          widget.rejectIsLoading = true;
                                        });
                                        FriendRequestResponse response =
                                            await MessageRepository()
                                                .rejectRequestRepo(
                                                    widget.datas.id != null
                                                        ? widget.datas.id
                                                            .toString()
                                                        : "");
                                        if (response.detail ==
                                                "Request rejected successfully" &&
                                            context.mounted) {
                                          setState(() {
                                            widget.rejectIsLoading = false;
                                          });
                                          common.fetchFriendRequest();

                                          showTopOverlayNotificationError(
                                              title: "Request Rejected");
                                        } else {
                                          setState(() {
                                            widget.rejectIsLoading = false;
                                          });

                                          showTopOverlayNotificationError(
                                              title:
                                                  response.detail.toString());
                                        }
                                      } catch (e) {
                                        setState(() {
                                          widget.rejectIsLoading = false;
                                        });
                                        showTopOverlayNotificationError(
                                            title:
                                                "Something went wrong. Please try again later");
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Color(0xFFF5F5F5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: widget.rejectIsLoading == true
                                  ? Center(
                                      child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child:
                                              const CircularProgressIndicator()))
                                  : const Text(
                                      "Ignore",
                                      style:
                                          TextStyle(color: Color(0xffFF4773)),
                                    ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Color(0xff204051),
              height: 10,
            )
          ],
        ),
      );
    });
  }
}
