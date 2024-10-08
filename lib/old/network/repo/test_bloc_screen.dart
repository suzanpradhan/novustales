import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:storyv2/old/model/story_response.dart';
import 'package:storyv2/old/network/repo/test_bloc.dart';

import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    feedBloc.getFeeds();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<StResponse>(
          stream: feedBloc.subject.stream,
          builder: (context, AsyncSnapshot<StResponse> snapshot) {
            if (snapshot.hasData) {
              return _buildFeedWidget(snapshot.data!);
            } else if (snapshot.hasError) {
              return buildErrorWidget("Error");
            } else {
              return CupertinoActivityIndicator();
            }
          },
        ));
  }

  Widget _buildFeedWidget(StResponse data) {
    List<dynamic> feeds = data.results!;
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: feeds.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                VideoWidget(
                    url: "https://brain.novutales.com" +
                        feeds[index]['media_url']),
                // Container(
                //   padding: const EdgeInsets.all(10.0),
                //   decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //       colors: [
                //         Colors.black,
                //         Colors.transparent,
                //         Colors.transparent,
                //         Colors.black.withOpacity(0.15)
                //       ],
                //       begin: Alignment.topCenter,
                //       end: Alignment.bottomCenter,
                //       stops: const [0, 0, 0.6, 1],
                //     ),
                //   ),
                // ),
                // Positioned(
                //   left: 12.0,
                //   bottom: 32.0,
                //   child: SafeArea(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Row(
                //             children: [
                //               Container(
                //                 height: 40.0,
                //                 width: 40.0,
                //                 decoration: BoxDecoration(
                //                     border:
                //                     Border.all(width: 1.0, color: Colors.white),
                //                     shape: BoxShape.circle,
                //                     image: DecorationImage(
                //                         image: NetworkImage(feeds[index].image),
                //                         fit: BoxFit.cover)),
                //               ),
                //               const SizedBox(
                //                 width: 5.0,
                //               ),
                //               Text(
                //                 feeds[index].user.name,
                //                 style: const TextStyle(
                //                     fontSize: 16.0, color: Colors.white),
                //               ),
                //               const SizedBox(
                //                 width: 5.0,
                //               )
                //             ],
                //           ),
                //           const SizedBox(
                //             height: 12.0,
                //           ),
                //           Text(
                //             feeds[index].user.url,
                //             style: const TextStyle(color: Colors.white),
                //           )
                //         ],
                //       )),
                // ),
                // Positioned(
                //     right: 12.0,
                //     bottom: 50.0,
                //     child: Column(
                //       children: [
                //         const SizedBox(
                //           height: 20.0,
                //         ),
                //         IconButton(
                //             onPressed: () {},
                //             icon: const Icon(Ionicons.heart_outline,
                //                 size: 35.0, color: Colors.white)),
                //         const SizedBox(
                //           height: 10.0,
                //         ),
                //         IconButton(
                //             onPressed: () {},
                //             icon: const Icon(Ionicons.chatbubble_outline,
                //                 size: 30.0, color: Colors.white)),
                //         const SizedBox(
                //           height: 10.0,
                //         ),
                //         IconButton(
                //             onPressed: () {},
                //             icon: const Icon(Ionicons.paper_plane_outline,
                //                 size: 30.0, color: Colors.white))
                //       ],
                //     ))
              ],
            ),
          );
        });
  }
}

class VideoWidget extends StatefulWidget {
  final String url;

  const VideoWidget({super.key, required this.url});

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    print(widget.url);
    videoPlayerController = VideoPlayerController.network(widget.url);

    _initializeVideoPlayerFuture = videoPlayerController.initialize().then((_) {
      setState(() {});
    });
    videoPlayerController.setLooping(true);
    videoPlayerController.play();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return videoPlayerController.value.isInitialized
              ? SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: videoPlayerController.value.size.width,
                      height: videoPlayerController.value.size.height,
                      child: VideoPlayer(videoPlayerController),
                    ),
                  ),
                )
              : Container();
        } else {
          return Container();
        }
      },
    );
  }
}

Widget buildErrorWidget(String error) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      SizedBox(height: 140.0, width: 140.0, child: Icon(Icons.error)),
      const SizedBox(
        height: 25.0,
      ),
      Text(
        error,
        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
