import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_color.dart';
import '../../../model/response/accept_friend_list.dart';
import '../../../model/response/user_firebase_model.dart';
import '../../../model/response/user_response.dart';
import '../../../providers/common_view_model.dart';

class GroupDetailScreen extends StatefulWidget {
  String groupId;
  GroupDetailScreen({super.key, required this.groupId});

  @override
  State<GroupDetailScreen> createState() => _GroupDetailScreenState();
}

class _GroupDetailScreenState extends State<GroupDetailScreen> {
  TextEditingController groupNameController = TextEditingController();
  List<String> selectedFriends = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();
  List<String> newData = <String>[];
  late CommonViewModel _commonViewModel;
  List<MultiSelectItem<String>> friendsNotInGroupItems = [];

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _commonViewModel = Provider.of<CommonViewModel>(context, listen: false);

      // Initialize friendsNotInGroupItems with friends not in the group
      // Initialize friendsNotInGroupItems with friends not in the group
      friendsNotInGroupItems = _getFriendsNotInGroup([]);
    });
    getUser();
    super.initState();
  }

  UserResponse? userdd;

  getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userData = sharedPreferences.getString('user');
    Map<String, dynamic> userMap = json.decode(userData!);
    UserResponse userD = UserResponse.fromJson(userMap);
    setState(() {
      userdd = userD;
    });
  }

  List<MultiSelectItem<String>> _getFriendsNotInGroup(List<String> memberUids) {
    List<User> friendsNotInGroup =
        _commonViewModel.acceptRequestFriendList.friends == null
            ? []
            : _commonViewModel.acceptRequestFriendList.friends!
                .where((friend) => !memberUids.contains(friend.id.toString()))
                .toList();

    return friendsNotInGroup
        .map((friend) => MultiSelectItem<String>(
            friend.id.toString(),
            (friend.fullName == null && friend.nickName == null)
                ? "n/a"
                : friend.fullName ?? "n/a"))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CommonViewModel>(builder: (context, common, child) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: groupNameController,
                    decoration: InputDecoration(
                        hintText: 'Enter Group Name',
                        suffixIcon: Container(
                            color: Colors.greenAccent,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 5, right: 5),
                              child: Text("Update"),
                            ))),
                  ),
                  Text(
                    "Members",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('groups')
                        .doc(widget.groupId)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var datas =
                            snapshot.data?.data() as Map<String, dynamic>;
                        List<String> memberUids =
                            List<String>.from(datas['membersUid']);

                        newData.addAll(memberUids);

                        return MultiSelectBottomSheetField<String>(
                          decoration: BoxDecoration(
                            color: Color(0xffE5E5E5),
                          ),
                          key: _multiSelectKey,
                          initialChildSize: 0.7,
                          maxChildSize: 0.95,
                          title: Text("Select Group Members"),
                          items: _getFriendsNotInGroup(memberUids),
                          searchable: true,
                          validator: (values) {
                            if (values == null || values.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                          onConfirm: (values) async {
                            setState(() {
                              selectedFriends = values;

                              // Concatenate newly added and old data
                              newData = List.from(newData)
                                ..addAll(selectedFriends);

                              // Clear selectedFriends for next selection
                              // selectedFriends.clear();/

                              print(newData);
                            });
                            try {
                              // Get a reference to the Firestore document
                              DocumentReference groupRef = FirebaseFirestore
                                  .instance
                                  .collection('groups')
                                  .doc(widget.groupId);

                              // Fetch the current data
                              DocumentSnapshot groupSnapshot =
                                  await groupRef.get();

                              if (groupSnapshot.exists) {
                                // Extract the current membersUid list
                                var datas = groupSnapshot.data()
                                    as Map<String, dynamic>;
                                List<dynamic> currentMembers =
                                    datas['membersUid'];

                                // Remove the memberId from the list
                                currentMembers.addAll(selectedFriends);

                                // Update the Firestore document with the modified membersUid array
                                await groupRef
                                    .update({'membersUid': currentMembers});

                                print('Member added successfully');
                              } else {
                                print('Group document not found');
                              }
                            } catch (e) {
                              print('Error adding member: $e');
                            }
                            _multiSelectKey.currentState!.validate();
                          },
                          chipDisplay: MultiSelectChipDisplay(
                            onTap: (item) {
                              setState(() {
                                selectedFriends.remove(item);
                              });
                              _multiSelectKey.currentState!.validate();
                            },
                          ),
                        );
                      } else {
                        return CupertinoActivityIndicator();
                      }
                    },
                  ),
                ],
              ),
            ),
            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('groups')
                  .doc(widget.groupId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var datas = snapshot.data?.data() as Map<String, dynamic>;

                  print(snapshot.data?.data());
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${datas['membersUid'].length} participants",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                      FutureBuilder<List<UserFirebaseModel>>(
                        future: fetchUserDetails(
                            List<String>.from(datas['membersUid'])),
                        builder: (context, userSnapshot) {
                          if (userSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CupertinoActivityIndicator();
                          } else if (userSnapshot.hasError) {
                            return Text('Error: ${userSnapshot.error}');
                          } else {
                            var users = userSnapshot.data;

                            // Display user details here
                            return Column(
                              children: users!.map((user) {
                                return ListTile(
                                  trailing: datas['adminId'].toString() ==
                                          user.uid.toString()
                                      ? const Chip(
                                          label: Text(
                                            "Admin",
                                            style: TextStyle(color: white),
                                          ),
                                          backgroundColor: Colors.red,
                                        )
                                      : IconButton(
                                          onPressed: () async {
                                            try {
                                              // Get a reference to the Firestore document
                                              DocumentReference groupRef =
                                                  FirebaseFirestore.instance
                                                      .collection('groups')
                                                      .doc(widget.groupId);

                                              // Fetch the current data
                                              DocumentSnapshot groupSnapshot =
                                                  await groupRef.get();

                                              if (groupSnapshot.exists) {
                                                // Extract the current membersUid list
                                                var datas = groupSnapshot.data()
                                                    as Map<String, dynamic>;
                                                List<dynamic> currentMembers =
                                                    datas['membersUid'];

                                                // Remove the memberId from the list
                                                currentMembers.remove(user.uid);

                                                // Update the Firestore document with the modified membersUid array
                                                await groupRef.update({
                                                  'membersUid': currentMembers
                                                });

                                                print(
                                                    'Member removed successfully');
                                              } else {
                                                print(
                                                    'Group document not found');
                                              }
                                            } catch (e) {
                                              print(
                                                  'Error removing member: $e');
                                            }
                                          },
                                          icon: Icon(Icons.cancel,
                                              color: Colors.red)),
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(user.image ?? ""),
                                  ),
                                  title: Text(
                                    '${user.name}',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                            );
                          }
                        },
                      ),
                    ],
                  );
                } else {
                  return CupertinoActivityIndicator();
                }
              },
            )
          ],
        );
      }),
    );
  }

  void updateGroupMembers(List<String> members) async {
    try {
      // Get a reference to the Firestore document
      DocumentReference groupRef =
          FirebaseFirestore.instance.collection('groups').doc(widget.groupId);

      // Update the Firestore document with the new membersUid array
      await groupRef.update({
        'membersUid': members,
      });

      print('Group members updated successfully');
    } catch (e) {
      print('Error updating group members: $e');
    }
  }

  Future<List<UserFirebaseModel>> fetchUserDetails(List<String> userIds) async {
    try {
      List<UserFirebaseModel> users = [];
      final userCollection = FirebaseFirestore.instance.collection('users');

      for (String userId in userIds) {
        DocumentSnapshot userDoc = await userCollection.doc(userId).get();
        if (userDoc.exists) {
          Map<String, dynamic> userData =
              userDoc.data() as Map<String, dynamic>;
          // Create a User object based on your User class/model
          UserFirebaseModel user = UserFirebaseModel.fromJson(userData);
          users.add(user);
        }
      }

      return users;
    } catch (e) {
      throw Exception('Error fetching user details: $e');
    }
  }
}
