import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as fr;
import 'package:storyv2/old/helper/custom_loader.dart';
import 'package:storyv2/old/helper/overlay_notification.dart';
import '../../../helper/chat_utils.dart';
import '../../../providers/common_view_model.dart';
import 'controller/group_controller.dart';

class CreateChatGroupScreen extends fr.ConsumerStatefulWidget {
  String senderId;
  static const String routeName = "/groupScreen";
  CreateChatGroupScreen({super.key, required this.senderId});

  @override
  fr.ConsumerState<CreateChatGroupScreen> createState() =>
      _CreateChatGroupScreenState();
}

class _CreateChatGroupScreenState
    extends fr.ConsumerState<CreateChatGroupScreen> {
  TextEditingController groupNameController = TextEditingController();
  List<String> selectedFriends = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();
  File? image;
  bool isLoading = false; // Add a loading indicator state

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  void beginConversation() async {
    customLoadStart();
    setState(() {
      isLoading = true; // Set loading state to true
    });

    if (groupNameController.text.trim().isNotEmpty && image != null) {
      try {
        // Perform your group creation operation here
        ref.read(groupControllerProvider).createGroup(
              context,
              groupNameController.text.trim(),
              image!,
              selectedFriends,
              widget.senderId,
            );

        // Set loading state to false on success
        setState(() {
          isLoading = false;
        });
      } catch (error) {
        // Set loading state to false on error
        setState(() {
          isLoading = false;
        });
        customLoadStop();
        // Handle the error as needed
        print('Error creating group: $error');
      }
    } else {
      // Set loading state to false if validation fails
      showTopOverlayNotificationError(title: "Any of one field can't be empty");
      setState(() {
        isLoading = false;
      });
      customLoadStop();
    }
  }

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
                'Create Group',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    image == null
                        ? const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png',
                            ),
                            radius: 64,
                          )
                        : CircleAvatar(
                            backgroundImage: FileImage(
                              image!,
                            ),
                            radius: 64,
                          ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(
                          Icons.add_a_photo,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: groupNameController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Group Name',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Members",
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      common.acceptRequestFriendList.friends == null
                          ? const Text("No Friends")
                          : MultiSelectBottomSheetField<String>(
                              decoration: const BoxDecoration(
                                color: Color(0xffE5E5E5),
                              ),
                              key: _multiSelectKey,
                              initialChildSize: 0.7,
                              maxChildSize: 0.95,
                              title: const Text("Select Group Members"),
                              items: common.acceptRequestFriendList.friends!
                                  .map<MultiSelectItem<String>>((e) =>
                                      MultiSelectItem(e.id.toString(),
                                          e.fullName.toString()))
                                  .toList(),
                              searchable: true,
                              validator: (values) {
                                if (values == null || values.isEmpty) {
                                  return "Required";
                                }
                                return null;
                              },
                              onConfirm: (values) {
                                setState(() {
                                  selectedFriends = values;
                                });
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
                            ),
                    ],
                  ),
                ),

                // DropdownButtonFormField(
                //   isExpanded: true,
                //   decoration: const InputDecoration(
                //     border: InputBorder.none,
                //     fillColor: Color(0xffE5E5E5),
                //     filled: true,
                //   ),
                //   icon: const Icon(Icons.arrow_drop_down_outlined),
                //   items: [].map((pt) {
                //     return DropdownMenuItem(
                //       value: pt.examSlug,
                //       child: Text(
                //         pt.examTitle.toString(),
                //         softWrap: true,
                //         overflow: TextOverflow.ellipsis,
                //       ),
                //     );
                //   }).toList(),
                //   onChanged: (newVal) {},
                // ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: isLoading ? null : beginConversation,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 14),
                    decoration: BoxDecoration(
                        color: const Color(0xff3FA3FF),
                        borderRadius: BorderRadius.circular(20)),
                    child: isLoading == true
                        ? CircularProgressIndicator() // Show loading indicator
                        : Text(
                            "Begin Conversation",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
