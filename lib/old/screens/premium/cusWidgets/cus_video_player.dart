import 'package:flutter/material.dart';
import 'package:storyv2/old/constants/app_color.dart';
import 'package:storyv2/old/screens/premium/cusWidgets/circular_loading.dart';
import 'package:video_player/video_player.dart';

class CusVideoPlayer extends StatefulWidget {
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final VideoPlayerController controller;
  final bool looping;
  final bool showButton;

  const CusVideoPlayer({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    required this.controller,
    this.looping = true,
    this.showButton = false,
  });

  @override
  State<CusVideoPlayer> createState() => _CusVideoPlayerState();
}

class _CusVideoPlayerState extends State<CusVideoPlayer> {
  late final VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    controller.setLooping(widget.looping);
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Loading(color: white, cupertino: true);
    IconData playIconData = Icons.play_arrow_rounded;

    if (controller.value.isInitialized) child = VideoPlayer(controller);
    if (widget.borderRadius != null) {
      child = ClipRRect(borderRadius: widget.borderRadius!, child: child);
    }
    if (controller.value.isInitialized && widget.showButton) {
      child = Stack(
        children: [
          child,
          Positioned(
            bottom: 0,
            right: 0,
            child: StatefulBuilder(builder: (context, playIconState) {
              return IconButton(
                onPressed: () {
                  bool playing = controller.value.isPlaying;
                  playing ? controller.pause() : controller.play();
                  playIconState(() {
                    playing
                        ? playIconData = Icons.play_arrow_rounded
                        : playIconData = Icons.pause_rounded;
                  });
                },
                icon: Icon(playIconData, color: white, size: 35),
              );
            }),
          ),
        ],
      );
    }

    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: child,
    );
  }
}
