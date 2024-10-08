import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/providers/coin_view_model.dart';
import 'package:storyv2/old/providers/comment_view_model.dart';
import 'package:storyv2/old/providers/common_view_model.dart';
import 'package:storyv2/old/providers/for_you_view_model.dart';
import 'package:storyv2/old/screens/trending/components/side_bar.dart';
import 'package:storyv2/old/screens/trending/components/video_detail.dart';
import 'package:storyv2/old/screens/trending/trending_screen.dart';
import 'package:video_player/video_player.dart';

import '../config/api_response_config.dart';

class ForYouScreen extends StatefulWidget {
  const ForYouScreen({super.key});

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen>
    with AutomaticKeepAliveClientMixin {
  bool isPressed = false;

  late ForYouViewModel _forYouViewModel;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _forYouViewModel = Provider.of<ForYouViewModel>(context, listen: false);
    });
    super.initState();
  }

  void onPageChanged(int index) {
    _forYouViewModel.updateIsVideoPaused(false);
    _forYouViewModel.updateActiveIndex(index);

    _forYouViewModel.updateIsVideoMuted(true);

    // Play video for the current index if applicable
    _playVideoForIndex(index);

    // Preload next video if applicable
    _preloadNextVideo(index);

    // Load more stories if at the end of the list
    _loadMoreIfNeeded(index);
  }

  void _playVideoForIndex(int index) {
    if (_forYouViewModel.forYou[index]['media_url'] != null) {
      String mediaUrl = _forYouViewModel.forYou[index]['media_url'];

      // Check if the media URL ends with a video file extension
      if (mediaUrl.endsWith('.mp4')) {
        dynamic preloadedContent =
            _forYouViewModel.getPreloadedContent(mediaUrl);
        if (preloadedContent is VideoPlayerController) {
          // Start playing the video
          preloadedContent.seekTo(Duration.zero);
          preloadedContent.play();
        }
      }
    }
  }

  void _preloadNextVideo(int index) {
    if (index + 1 < _forYouViewModel.forYou.length) {
      String nextMediaUrl = _forYouViewModel.forYou[index + 1]['media_url'];
      if (nextMediaUrl.isNotEmpty) {
        _forYouViewModel.preload(nextMediaUrl, context);
      }
    }
  }

  void _loadMoreIfNeeded(int index) {
    var trendingLength =
        _forYouViewModel.forYou == null ? 0 : _forYouViewModel.forYou.length;
    if (index == (trendingLength - 3)) {
      loadMore();
    }
  }

  Future<void> loadMore() async {
    if (_forYouViewModel.nextUrl != "") {
      Uri url = Uri.parse(_forYouViewModel.nextUrl);
      await _forYouViewModel
          .loadMoreForYou("${url.path.substring(1)}?${url.query}");
      print("${url.path.substring(1)}?${url.query}");
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _forYouViewModel = Provider.of<ForYouViewModel>(context, listen: false);
      if (_forYouViewModel.forYou.isNotEmpty) {
        _playVideoForIndex(0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer4<CommonViewModel, ForYouViewModel, CoinViewModel,
            CommentViewModel>(
        builder: (context, common, story, coinApi, commentApi, child) {
      return PageView.builder(
        itemCount: story.forYou.length,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          final mediaItem = story.forYou[index];
          final preloadedContent = story.getPreloadedContent(
              mediaItem['media_url'] ?? "https://i.stack.imgur.com/Q3vyk.png");

          if (common.pagecontroller.page != 0) {
            preloadedContent.pause();
          } else if (preloadedContent != null) {
            if (!preloadedContent.value.isPlaying) {
              preloadedContent.play();
            }
          }
          return isLoading(story.storyForYouApiResponse)
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
                            story.forYou[index]["user_details"]["id"]
                                .toString());
                      },
                      onLongPressStart: (LongPressStartDetails details) {
                        story.updateIsLongPressed(true);
                      },
                      onLongPressEnd: (LongPressEndDetails details) {
                        story.updateIsLongPressed(false);
                      },
                      child: GestureDetector(
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
                                      preloadedContent is VideoPlayerController)
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
                                            backgroundColor: Colors.transparent,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Center(
                                      child: Image(
                                        image: NetworkImage(
                                          mediaItem != null &&
                                                  mediaItem['media_url'] != null
                                              ? "https://brain.novutales.com${mediaItem['media_url']}"
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
                                    height: MediaQuery.of(context).size.height /
                                        1.2,
                                    child:
                                        VideoDetail(data: story.forYou[index]),
                                  )),
                              Expanded(
                                  child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 2.5,
                                child: SideBar(
                                    storyId:
                                        story.forYou[index]['id'].toString()),
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
      );
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
