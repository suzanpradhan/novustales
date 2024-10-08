import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/providers/auth_view_model.dart';
import 'package:storyv2/old/providers/comment_view_model.dart';
import 'package:storyv2/old/screens/trending/components/side_bar.dart';
import 'package:storyv2/old/screens/trending/components/video_detail.dart';
import 'package:video_player/video_player.dart';

import '../../config/api_response_config.dart';

class MyStoryScreen extends StatefulWidget {
  dynamic data;
  int index;
  MyStoryScreen({super.key, this.data, required this.index});

  @override
  State<MyStoryScreen> createState() => _MyStoryScreenState();
}

class _MyStoryScreenState extends State<MyStoryScreen>
    with AutomaticKeepAliveClientMixin {
  bool isPressed = false;
  late PageController _pageController;

  late AuthViewModel _authViewModel;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: widget.index);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
      onPageChanged(widget.index);
    });

    super.initState();
  }

  void onPageChanged(int index) {
    _authViewModel.updateIsVideoPaused(false);
    _authViewModel.updateActiveIndex(index);

    // Stop video playback for the previous index if there was one
    if (_authViewModel.activeIndex != index) {
      _stopVideoPlayback();
    }

    // Play video for the current index if applicable
    _playVideoForIndex(index);

    // Preload next video if applicable
    _preloadNextVideo(index);
  }

  void _stopVideoPlayback() {
    // Stop video playback for the previous index
    if (widget.data[_authViewModel.activeIndex]['media_urls'] != null) {
      String mediaUrl = widget.data[_authViewModel.activeIndex]['media_urls'];
      dynamic preloadedContent = _authViewModel.getPreloadedContent(mediaUrl);
      if (preloadedContent is VideoPlayerController) {
        preloadedContent.pause();
      }
    }
  }

  void _playVideoForIndex(int index) {
    if (widget.data[index]['media_urls'] != null) {
      String mediaUrl = widget.data[index]['media_urls'];

      // Check if the media URL ends with a video file extension
      if (mediaUrl.endsWith('.mp4')) {
        dynamic preloadedContent = _authViewModel.getPreloadedContent(mediaUrl);
        if (preloadedContent is VideoPlayerController) {
          // Start playing the video
          preloadedContent.seekTo(Duration.zero);
          preloadedContent.play();
        }
      }
    }
  }

  void _preloadNextVideo(int index) {
    if (index + 1 < widget.data.length) {
      String nextMediaUrl = widget.data[index + 1]['media_urls'];
      if (nextMediaUrl.isNotEmpty) {
        _authViewModel.preload(nextMediaUrl, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Consumer2<AuthViewModel, CommentViewModel>(
          builder: (context, story, commentApi, child) {
        return PageView.builder(
          controller: _pageController,
          itemCount: widget.data.length,
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          onPageChanged: onPageChanged,
          itemBuilder: (context, index) {
            final mediaItem = widget.data[index];
            final preloadedContent = story.getPreloadedContent(
                mediaItem['media_urls'] ??
                    "https://i.stack.imgur.com/Q3vyk.png");

            return isLoading(story.userDataApiResponse)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      GestureDetector(
                        onLongPressStart: (LongPressStartDetails details) {
                          setState(() {
                            isPressed = true;
                          });
                        },
                        onLongPressEnd: (LongPressEndDetails details) {
                          setState(() {
                            isPressed = false;
                          });
                        },
                        child: GestureDetector(
                          onTap: () {
                            if (preloadedContent != null &&
                                preloadedContent is VideoPlayerController) {
                              if (preloadedContent.value.isPlaying) {
                                preloadedContent.pause();
                                story.updateIsVideoPaused(true);
                              } else {
                                preloadedContent.play();

                                story.updateIsVideoPaused(false);
                              }
                            }
                          },
                          child: Stack(
                            children: [
                              Container(
                                color: Colors.black12,
                                child: (preloadedContent != null &&
                                        preloadedContent
                                            is VideoPlayerController)
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Expanded(
                                            child: AspectRatio(
                                              aspectRatio: preloadedContent
                                                  .value.aspectRatio,
                                              child:
                                                  VideoPlayer(preloadedContent),
                                            ),
                                          ),
                                          VideoProgressIndicator(
                                            preloadedContent,
                                            allowScrubbing: true,
                                            colors: const VideoProgressColors(
                                              playedColor: storyBrown,
                                              bufferedColor: Colors.grey,
                                              backgroundColor:
                                                  Colors.transparent,
                                            ),
                                          ),
                                        ],
                                      )
                                    : Center(
                                        child: Image(
                                          image: NetworkImage(
                                            mediaItem != null &&
                                                    mediaItem['media_urls'] !=
                                                        null
                                                ? "https://brain.novutales.com${mediaItem['media_urls']}"
                                                : "https://i.stack.imgur.com/Q3vyk.png",
                                          ),
                                        ),
                                      ),
                              ),
                              if (story.isVideoPaused)
                                const Center(
                                  child: Icon(Icons.pause,
                                      size: 64, color: Colors.white),
                                ),
                            ],
                          ),
                        ),
                      ),
                      isPressed
                          ? const SizedBox()
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1.2,
                                      child:
                                          VideoDetail(data: widget.data[index]),
                                    )),
                                Expanded(
                                    child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 2.5,
                                  child: SideBar(
                                      storyId:
                                          widget.data[index]['id'].toString()),
                                )),
                              ],
                            )
                    ],
                  );
          },
        );
      }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
