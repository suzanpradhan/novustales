import 'package:flutter/material.dart';
import 'package:storyv2/layers/data/near_me_mocks.dart';

class StoryViewScreen extends StatefulWidget {
  final NearMeItem nearMeItem;
  const StoryViewScreen({super.key, required this.nearMeItem});

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.network(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            widget.nearMeItem.thumbnail,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              foregroundColor: Colors.white,
              title: Text(widget.nearMeItem.title),
              centerTitle: false,
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Colors.black.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
