import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';

import '../constants/message_enum.dart';
import 'display_text_image.dart';

class SenderMessageCard extends StatelessWidget {
  const SenderMessageCard({
    Key? key,
    required this.senderId,
    required this.message,
    required this.date,
    required this.type,
    required this.onRightSwipe,
    required this.repliedText,
    required this.username,
    required this.repliedMessageType,
  }) : super(key: key);
  final String message;
  final String senderId;
  final String date;
  final MessageEnum type;
  final VoidCallback onRightSwipe;
  final String repliedText;
  final String username;
  final MessageEnum repliedMessageType;

  @override
  Widget build(BuildContext context) {
    final isReplying = repliedText.isNotEmpty;

    print("USERNAME:::$senderId");

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20, // Adjust the size as needed
          backgroundImage: NetworkImage(
              "https://toppng.com/uploads/preview/circled-user-icon-user-pro-icon-11553397069rpnu1bqqup.png"), // Provide the avatar URL
        ),
        SizedBox(width: 10),
        Expanded(
          child: SwipeTo(
            onRightSwipe: (value) {
              onRightSwipe();
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width - 45,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        username,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                    Card(
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      // color: Color.fromRGBO(37, 45, 49, 1),
                      color: Color(0xffF9F9F9),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Stack(
                        children: [
                          Padding(
                            padding: type == MessageEnum.text
                                ? const EdgeInsets.only(
                                    left: 10,
                                    right: 30,
                                    top: 5,
                                    bottom: 20,
                                  )
                                : const EdgeInsets.only(
                                    left: 5,
                                    top: 5,
                                    right: 5,
                                    bottom: 25,
                                  ),
                            child: Column(
                              children: [
                                if (isReplying) ...[
                                  Text(
                                    username,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(19, 28, 33, 1)
                                          .withOpacity(0.5),
                                      // color: Color(0xffF9F9F9),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(
                                          5,
                                        ),
                                      ),
                                    ),
                                    child: DisplayTextImageGIF(
                                      isSender: false,
                                      message: repliedText,
                                      type: repliedMessageType,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                                DisplayTextImageGIF(
                                  isSender: false,
                                  message: message,
                                  type: type,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 2,
                            right: 10,
                            child: Text(
                              date,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
