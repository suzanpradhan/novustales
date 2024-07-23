import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/app_image.dart';

import '../../../config/api_response_config.dart';
import '../../../model/response/friend_request_response.dart';
import '../../../model/response/user_response.dart';
import '../../../providers/common_view_model.dart';
import '../widget/single_user_request.dart';

class ChatRequestScreen extends StatefulWidget {
  static const String routeName = "/chat-request";
  const ChatRequestScreen({Key? key}) : super(key: key);

  @override
  State<ChatRequestScreen> createState() => _ChatRequestScreenState();
}

class _ChatRequestScreenState extends State<ChatRequestScreen> {
  late CommonViewModel commonViewModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      commonViewModel = Provider.of<CommonViewModel>(context, listen: false);
      // commonViewModel.fetchFriendRequest();
    });

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
    if (user != null) {
      // commonViewModel.fetchMyFriendList(user!.id.toString());
    }
  }

  bool isloading = false;
  bool rejectIsLoading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonViewModel>(builder: (context, common, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            // automaticallyImplyLeading: false,
            title: Column(
              children: [
                Container(
                  height: 2,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Color(0xFF204051),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                const Text(
                  'Chat Requests',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(25),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Container(
                  //   height: 2,
                  //   width: 60,
                  //   decoration: BoxDecoration(
                  //     color: Color(0xFF204051),
                  //     borderRadius: BorderRadius.circular(1),
                  //   ),
                  // ),
                  // Text(
                  //   'Chat Requests',
                  //   style: TextStyle(
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
                  // SizedBox(height: 25),
                  // isError(common.friendRequestApiResponse)
                  //     ? Center(
                  //         child:
                  //             Text("Something went wrong. Please try again later."))
                  //     :
                  isLoading(common.friendRequestApiResponse)
                      ? Center(child: CircularProgressIndicator())
                      : common.friendRequest.isEmpty
                          ? Center(child: Text("No request found"))
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: common.friendRequest.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                FriendRequestResponse datas =
                                    common.friendRequest[index];
                                return SingleUserRequest(
                                  rejectIsLoading: rejectIsLoading,
                                  datas: datas,
                                  index: index,
                                  isloading: isloading,
                                  user: user,
                                );
                              })
                ],
              ),
            ),
          ));
    });
  }
}
