import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/screens/test_view_model.dart';
import 'package:video_player/video_player.dart';

class TestScreen extends StatefulWidget {
  dynamic data;
  TestScreen({Key? key, this.data}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TestViewModel>(
        builder: (context, viewModel, child) {
          return PageView.builder(
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              final url = widget.data[index]['media_urls'];
              final preloadedContent = viewModel.getPreloadedContent(url);

              if (preloadedContent == null) {
                // Initiate preloading
                viewModel.preload(url);
                return CircularProgressIndicator(); // Or any other placeholder widget
              }

              // Use preloadedContent to display images or videos
              if (preloadedContent is VideoPlayerController) {
                return VideoPlayer(preloadedContent);
              } else if (preloadedContent is ImageProvider) {
                return Image(image: preloadedContent);
              } else {
                // Handle other types of preloaded content
                return Placeholder(); // Or any other suitable widget
              }
            },
          );
        },
      ),
    );
  }
}
