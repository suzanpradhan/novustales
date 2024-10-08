import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/app_image.dart';

import '../../../config/preference_utils.dart';
import '../../../constants/app_color.dart';
import '../../../model/response/user_response.dart';
import '../group/create_group_screen.dart';
import '../request/chat_request_screen.dart';
import 'group_chat.dart';
import 'one_to_one_chat_screen.dart';

class ChatBoxScreen extends StatefulWidget {
  const ChatBoxScreen({super.key});

  @override
  State<ChatBoxScreen> createState() => _ChatBoxScreenState();
}

class _ChatBoxScreenState extends State<ChatBoxScreen> {
  int selectedIndex = 0;
  UserResponse? user;
  SharedPreferences sharedPreferences = PreferenceUtils.instance;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    String? userData = sharedPreferences.getString('user');
    Map<String, dynamic> userMap = json.decode(userData!);
    UserResponse userD = UserResponse.fromJson(userMap);
    setState(() {
      user = userD;
    });
  }

  final pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void pageChanged(int index) {
    setState(() {
      // bottomSelectedIndex = index;
      print("INDEX:::: $index");
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 10), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: kPrimaryColor,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            // isExtended: true,
            backgroundColor: Color(0xff3FA3FF),
            onPressed: () {
              Navigator.pushNamed(context, CreateChatGroupScreen.routeName,
                  arguments: "${user?.id}");
            },
            child: Icon(Icons.group),
          ),
          appBar: AppBar(
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
                Text(
                  'Chat Box',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            actions: [
              InkWell(
                onTap: () {
                  print("Chat Request");
                  Navigator.pushNamed(context, ChatRequestScreen.routeName);
                },
                child: Container(
                    padding: EdgeInsets.all(5),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Image.asset(kUserAdd,
                        fit: BoxFit.contain, height: 25, width: 25)),
              ),
              SizedBox(width: 10),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          pageChanged(0);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 35, vertical: 12),
                          decoration: BoxDecoration(
                            color: selectedIndex == 0
                                ? Color(0xff3FA3FF)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            "DMs",
                            style: TextStyle(
                              color: selectedIndex == 0
                                  ? Colors.white
                                  : Color(0xFF204051),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          pageChanged(1);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                          decoration: BoxDecoration(
                            color: selectedIndex == 1
                                ? Color(0xff3FA3FF)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            "Interest Groups",
                            style: TextStyle(
                              color: selectedIndex == 1
                                  ? Colors.white
                                  : Color(0xFF204051),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: PageView(
                    pageSnapping: false,
                    controller: pageController,
                    physics: ScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                      pageChanged(index);
                    },
                    children: [
                      OneToOneChatScreen(),
                      GroupChatScreen(
                        senderId: "${user?.id ?? ""}",
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
