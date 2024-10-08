import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_time/story_page_view/story_page_view.dart';
import 'package:video_player/video_player.dart';

import '../../providers/view_story_model.dart';
import '../../constants/app_color.dart';
import '../../model/response/user_response.dart';

class UserStoryScreen extends StatefulWidget {
  final dynamic story;
  const UserStoryScreen({super.key, required this.story});

  @override
  UserStoryScreenState createState() => UserStoryScreenState();
}

class UserStoryScreenState extends State<UserStoryScreen> {
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;
  VideoPlayerController? _videoController;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
      IndicatorAnimationCommand(resume: true),
    );
  }

  @override
  void dispose() {
    indicatorAnimationController.dispose();
    if (_videoController != null) {
      _videoController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ViewStoryModel provider = Provider.of<ViewStoryModel>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: StoryPageView(
          initialPage: 0,
          onStoryIndexChanged: (int newStoryIndex) {
            indicatorAnimationController.value = IndicatorAnimationCommand(
              duration: Duration(seconds: 10),
            );
          },
          itemBuilder: (context, pageIndex, storyIndex) {
            bool isVideo = !["jpeg", "png", "jpg"]
                .contains(widget.story.media!.split(".").last);

            if (isVideo) {
              _videoController = VideoPlayerController.network(
                  "https://brain.novutales.com${widget.story.media}")
                ..addListener(() {})
                ..initialize().then((_) {
                  _videoController!.play();

                  indicatorAnimationController.value =
                      IndicatorAnimationCommand(
                    duration: _videoController!.value.duration,
                  );
                });
            }

            provider.viewStory(widget.story.id.toString());

            return GestureDetector(
              onVerticalDragDown: (DragDownDetails value) {
                Navigator.of(context).pop();
              },
              child: SizedBox(
                height: height,
                width: width,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(color: Colors.black),
                    ),
                    if ([
                      "jpeg",
                      "png",
                      "jpg"
                    ].contains(widget.story.media.toString().split(".").last))
                      CachedNetworkImage(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        fit: BoxFit.fitWidth,
                        imageUrl:
                            "https://brain.novutales.com${widget.story.media}",
                        placeholder: (context, url) => Center(
                            child: CupertinoActivityIndicator(color: white)),
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 40,
                        ),
                      )
                    else
                      Center(
                        child: AspectRatio(
                          aspectRatio: _videoController!.value.aspectRatio,
                          child: VideoPlayer(_videoController!),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 44, left: 8),
                      child: Row(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://brain.novutales.com${widget.story.userDetails!.avatar.toString()}"),
                                fit: BoxFit.cover,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            widget.story.userDetails!.name.toString(),
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          gestureItemBuilder: (context, pageIndex, storyIndex) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      color: Colors.white,
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            );
          },
          indicatorAnimationController: indicatorAnimationController,
          initialStoryIndex: (pageIndex) {
            return pageIndex;
          },
          pageLength: 1,
          storyLength: (int pageIndex) {
            return 1;
          },
          onPageLimitReached: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
