import 'package:flutter/material.dart';

import '../../../../core/presentation/ui/spacer.dart';

class Emojiinputfield extends StatefulWidget {
  const Emojiinputfield({super.key});

  @override
  State<Emojiinputfield> createState() => _EmojiinputfieldState();
}

class _EmojiinputfieldState extends State<Emojiinputfield> {
  final TextEditingController _commentController = TextEditingController();

  void _addEmojiToComment(String emoji) {
    // Appends the selected emoji to the current comment text
    setState(() {
      _commentController.text += emoji;
    });
    // Moves the cursor to the end of the text
    _commentController.selection = TextSelection.fromPosition(
      TextPosition(offset: _commentController.text.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gapper.v2xmGap(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildEmojiButton("❤️"),
            _buildEmojiButton("🙌"),
            _buildEmojiButton("👏"),
            _buildEmojiButton("🔥"),
            _buildEmojiButton("😢"),
            _buildEmojiButton("😮"),
            _buildEmojiButton("😂"),
            _buildEmojiButton("😍"),
          ],
        ),
        // Input Field
        Container(
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  // controller: _commentController,
                  keyboardType: TextInputType.text,
                  onEditingComplete: () => {},
                  cursorColor: Colors.black,
                  style: Theme.of(context).textTheme.bodyMedium,

                  decoration: InputDecoration(
                      isCollapsed: true,
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      hintText: "Add a Comment",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).colorScheme.onPrimary),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.send, color: Colors.blue),
                onPressed: () {
                  // // Handle comment submission
                  // print("Comment: ${_commentController.text}");
                  // _commentController.clear();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildEmojiButton(String emoji) {
    return GestureDetector(
      onTap: () => _addEmojiToComment(emoji),
      child: Text(
        emoji,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
