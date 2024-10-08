import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as provider;
import '../../../constants/app_image.dart';

import '../../../constants/message_enum.dart';
import '../../../helper/chat_utils.dart';
import '../../../model/response/user_firebase_model.dart';
import '../../../providers/auth_view_model.dart';
import '../../../providers/common_provider.dart';
import '../../../widgets/message_reply_preview.dart';
import '../controller/chat_convo_controller.dart';

class BottomChatField extends ConsumerStatefulWidget {
  final String recieverUserId;
  final bool isGroupChat;
  String senderId;
  BottomChatField({
    super.key,
    required this.recieverUserId,
    required this.senderId,
    required this.isGroupChat,
  });

  @override
  ConsumerState<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends ConsumerState<BottomChatField> {
  final TextEditingController _messageController = TextEditingController();
  // FlutterSoundRecorder? _soundRecorder;
  bool isRecorderInit = false;
  BuildContext? _context;
  bool isShowEmojiContainer = false;
  bool isRecording = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    setState(() {
      _context = context;
    });
  }

  void sendTextMessage() async {
    final user = await getUserDataFromFirebase(
        provider.Provider.of<AuthViewModel>(_context!, listen: false)
            .userData['id']
            .toString());

    ref.read(chatControllerProvider).sendTextMessage(
        _context!,
        _messageController.text.trim(),
        widget.recieverUserId,
        provider.Provider.of<AuthViewModel>(_context!, listen: false)
            .userData['id']
            .toString(),
        widget.isGroupChat,
        user!);
    setState(() {
      _messageController.text = '';
    });
  }

  Future<UserFirebaseModel?> getUserDataFromFirebase(String uid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (documentSnapshot.exists) {
        // User data found, create a UserFirebaseModel instance
        return UserFirebaseModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>);
      } else {
        // User data not found
        return null;
      }
    } catch (e) {
      // Handle any errors here
      print('Error fetching user data from Firebase: $e');
      return null;
    }
  }

  void sendFileMessage(
    File file,
    MessageEnum messageEnum,
  ) async {
    final user = await getUserDataFromFirebase(
        provider.Provider.of<AuthViewModel>(_context!, listen: false)
            .userData['id']
            .toString());

    ref.read(chatControllerProvider).sendFileMessage(
        _context!,
        file,
        widget.recieverUserId,
        provider.Provider.of<AuthViewModel>(_context!, listen: false)
            .userData['id']
            .toString(),
        messageEnum,
        widget.isGroupChat,
        user!);
  }

  void selectImage() async {
    File? image = await pickImageFromGallery(context);
    if (image != null) {
      sendFileMessage(image, MessageEnum.image);
    }
  }

  // void selectVideo() async {
  //   File? video = await pickVideoFromGallery(context);
  //   if (video != null) {
  //     sendFileMessage(video, MessageEnum.video);
  //   }
  // }

  void hideEmojiContainer() {
    setState(() {
      isShowEmojiContainer = false;
    });
  }

  void showEmojiContainer() {
    setState(() {
      isShowEmojiContainer = true;
    });
  }

  void showKeyboard() => focusNode.requestFocus();
  void hideKeyboard() => focusNode.unfocus();

  void toggleEmojiKeyboardContainer() {
    if (isShowEmojiContainer) {
      showKeyboard();
      hideEmojiContainer();
    } else {
      hideKeyboard();
      showEmojiContainer();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();

    isRecorderInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final messageReply = ref.watch(messageReplyProvider);
    final isShowMessageReply = messageReply != null;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: Column(
        children: [
          isShowMessageReply ? const MessageReplyPreview() : const SizedBox(),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  // height: 100,
                  child: TextFormField(
                    // maxLines: null,
                    // maxLength: 500,
                    focusNode: focusNode,
                    controller: _messageController,
                    decoration: InputDecoration(
                      filled: true,
                      suffixIcon: SizedBox(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: selectImage,
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      hintText: 'Type a message!',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 0,
                  right: 2,
                  left: 2,
                ),
                child: CircleAvatar(
                  backgroundColor: const Color(0xFF3FA3FF),
                  radius: 20,
                  child: GestureDetector(
                      onTap: sendTextMessage, child: Image.asset(kSend)
                      // Icon(
                      //   Icons.send,
                      //   color: Colors.white,
                      // ),
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
