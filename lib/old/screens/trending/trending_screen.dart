import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:overlay_lottie/overlay_lottie.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/helper/overlay_notification.dart';
import 'package:storyv2/old/providers/comment_view_model.dart';
import 'package:storyv2/old/providers/common_view_model.dart';
import 'package:storyv2/old/providers/pinned_view_model.dart';
import 'package:storyv2/old/screens/trending/components/side_bar.dart';
import 'package:storyv2/old/screens/trending/components/trending_app_bar.dart';
import 'package:video_player/video_player.dart';

import '../../config/api_response_config.dart';
import '../../providers/coin_view_model.dart';
import '../../providers/common_view_model.dart';
import '../../providers/story_view_model.dart';
import '../foryou_screen.dart';
import 'components/video_detail.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen>
    with AutomaticKeepAliveClientMixin {
  late StoryViewModel _storyViewModel;
  late CommentViewModel commentViewModel;

  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _storyViewModel = Provider.of<StoryViewModel>(context, listen: false);
      commentViewModel = Provider.of<CommentViewModel>(context, listen: false);

      _timer = Timer.periodic(
          const Duration(seconds: 1), _storyViewModel.updateTime);
    });

    super.initState();
  }

  @override
  void dispose() {
    print('Dispose method called'); // Add a debug statement
    _timer.cancel();
    _storyViewModel.postUserInteraction();
    // _storyViewModel.dispose();
    super.dispose();
  }

  bool isPaused = false;

  final bool _showAdmiredMessage = false;

  void onPageChanged(int index) {
    try {
      commentViewModel.changedStoryId(
          _storyViewModel.storyPerCategory[index]['id'].toString());
    } catch (e) {}
    _storyViewModel.updateIsVideoPaused(false);
    _storyViewModel.updateIsVideoMuted(true);
    _storyViewModel.updateActiveIndex(index);

    // Stop video playback for the previous index
    // _stopVideoPlayback();

    // Reset the timer and update the current video index
    _storyViewModel.resetTimeSpent();

    // Play video for the current index if applicable
    _playVideoForIndex(index);

    // Preload next video if applicable
    _preloadNextVideo(index);

    // Load more stories if at the end of the list
    _loadMoreIfNeeded(index);
  }

  void _playVideoForIndex(int index) {
    print('Playing video for index: $index');
    if (_storyViewModel.storyPerCategory[index]['media_urls'] != null) {
      String mediaUrl = _storyViewModel.storyPerCategory[index]['media_urls'];
      print('Media URL for index $index: $mediaUrl');

      // Check if the media URL ends with a video file extension
      if (mediaUrl.endsWith('.mp4')) {
        dynamic preloadedContent =
            _storyViewModel.getPreloadedContent(mediaUrl);
        if (preloadedContent is VideoPlayerController) {
          print('Preloaded content found for index $index');
          // Start playing the video
          preloadedContent.seekTo(Duration.zero);
          preloadedContent.play();
        } else {
          print('Preloaded content is not a VideoPlayerController');
        }
      } else {
        print('Media URL does not end with .mp4: $mediaUrl');
      }
    } else {
      print('Media URL is null for index: $index');
    }
  }

  void _preloadNextVideo(int index) {
    if (index + 1 < _storyViewModel.storyPerCategory.length) {
      String nextMediaUrl =
          _storyViewModel.storyPerCategory[index + 1]['media_urls'];
      if (nextMediaUrl.isNotEmpty) {
        _storyViewModel.preload(nextMediaUrl, context);
      }
    }
  }

  void _loadMoreIfNeeded(int index) {
    print("loaded more");
    var trendingLength = _storyViewModel.storyPerCategory == null
        ? 0
        : _storyViewModel.storyPerCategory.length;
    if (index == (trendingLength - 3)) {
      loadMore();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _storyViewModel = Provider.of<StoryViewModel>(context, listen: false);
      if (_storyViewModel.storyPerCategory.isNotEmpty) {
        _playVideoForIndex(0);
      }
    });
  }

  Future<void> loadMore() async {
    if (_storyViewModel.nextUrl != "") {
      Uri url = Uri.parse(_storyViewModel.nextUrl);
      await _storyViewModel
          .loadMoreTrendingStory("${url.path.substring(1)}?${url.query}");
      print("${url.path.substring(1)}?${url.query}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100), child: TrendingAppBar()),
      body: Consumer5<CommonViewModel, StoryViewModel, CommentViewModel,
              CoinViewModel, PinnedViewModel>(
          builder:
              (context, common, story, commentApi, coinApi, pinApi, child) {
        return PageView(
          controller: story.baseController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            PageView.builder(
              itemCount: story.storyPerCategory.length,
              controller: story.pageController,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              onPageChanged: onPageChanged,
              itemBuilder: (context, index) {
                final mediaItem = story.storyPerCategory[index];
                final preloadedContent = story.getPreloadedContent(
                    mediaItem['media_urls'] ??
                        "https://i.stack.imgur.com/Q3vyk.png");
                if (common.pagecontroller.page != 0) {
                  preloadedContent.pause();
                } else if (preloadedContent != null) {
                  if (!preloadedContent.value.isPlaying) {
                    preloadedContent.play();
                  }
                }

                return isLoading(story.trendingStoryAccToCatApiResponse)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          GestureDetector(
                            onDoubleTap: () async {
                              await coinApi.transferCoinU(
                                  1,
                                  story.storyPerCategory[index]["user_details"]
                                          ["id"]
                                      .toString());
                            },
                            onLongPressStart: (LongPressStartDetails details) {
                              story.updateIsLongPressed(true);
                            },
                            onLongPressEnd: (LongPressEndDetails details) {
                              story.updateIsLongPressed(false);
                            },
                            onTap: () {
                              if (preloadedContent != null &&
                                  preloadedContent is VideoPlayerController) {
                                if (preloadedContent.value.volume == 0.0) {
                                  preloadedContent.setVolume(1.0);
                                  story.updateIsVideoMuted(true);
                                } else {
                                  preloadedContent.setVolume(0.0);
                                  story.updateIsVideoMuted(false);
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
                                                child: SizedBox.expand(
                                              child: FittedBox(
                                                fit: BoxFit.cover,
                                                child: SizedBox(
                                                    width: preloadedContent
                                                        .value.size.width,
                                                    height: preloadedContent
                                                        .value.size.height,
                                                    child: VideoPlayerWidget(
                                                      preloadedContent:
                                                          preloadedContent,
                                                    )),
                                              ),
                                            )),
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
                                AnimatedOpacity(
                                  opacity: pinApi.admiredUserBool ? 1.0 : 0.0,
                                  duration: const Duration(milliseconds: 300),
                                  child: Center(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        "Admired ${pinApi.admiredUsername.toString()}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                if (!story.isVideoMuted)
                                  const Center(
                                    child: Icon(Icons.volume_mute,
                                        size: 64, color: Colors.white),
                                  ),
                              ],
                            ),
                          ),
                          story.isLongPressed
                              ? const SizedBox()
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              1.2,
                                          child: VideoDetail(
                                              data: story
                                                  .storyPerCategory[index]),
                                        )),
                                    Expanded(
                                        child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.8,
                                      child: SideBar(
                                        storyId: story.storyPerCategory[index]
                                                ['id']
                                            .toString(),
                                        userId: story.storyPerCategory[index]
                                                ["user_details"]["id"]
                                            .toString(),
                                      ),
                                    )),
                                  ],
                                ),
                          if (coinApi.showLottie == true)
                            Positioned.fill(
                              child: Container(
                                color: Colors.black.withOpacity(0.5),
                                child: Center(
                                  child: LottieBuilder.asset(
                                      "assets/Animation-coin.json"),
                                ),
                              ),
                            ),
                        ],
                      );
              },
            ),
            const ForYouScreen(),
          ],
        );
      }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class VideoPlayerWidget extends StatefulWidget {
  final preloadedContent;
  const VideoPlayerWidget({super.key, this.preloadedContent});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  @override
  void dispose() {
    // TODO: implement dispose
    widget.preloadedContent.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(widget.preloadedContent);
  }
}
