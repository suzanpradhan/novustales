import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ViewFullVideoPlayerScreen extends StatefulWidget {
  const ViewFullVideoPlayerScreen(
      {Key? key,
      required this.videoPath,
      required this.controller,
      required this.initializeVideoPlayerFuture})
      : super(key: key);

  final String videoPath;
  final VideoPlayerController controller;
  final Future<void> initializeVideoPlayerFuture;

  @override
  _ViewFullVideoPlayerScreenState createState() =>
      _ViewFullVideoPlayerScreenState();
}

class _ViewFullVideoPlayerScreenState extends State<ViewFullVideoPlayerScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 200,
              child: FutureBuilder(
                future: widget.initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: widget.controller.value.aspectRatio,
                      child: VideoPlayer(widget.controller),
                    );
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    ));
                  }
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              if (widget.controller.value.isPlaying) {
                widget.controller.pause();
              } else {
                widget.controller.play();
              }
            });
          },
          child: Icon(
            widget.controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ));
  }
}


