// import 'package:flutter/material.dart';
// import 'package:storyv2/screens/profile/widgets/video_player_widget.dart';
//
// import '../../model/response/story_response.dart';
//
// class TrendingSingleCategoryStoryScreen extends StatefulWidget {
//   static const String routeName = "/single-category-screen";
//   List<Story> story;
//   TrendingSingleCategoryStoryScreen({Key? key, required this.story})
//       : super(key: key);
//
//   @override
//   TrendingSingleCategoryStoryScreenState createState() =>
//       TrendingSingleCategoryStoryScreenState();
// }
//
// class TrendingSingleCategoryStoryScreenState
//     extends State<TrendingSingleCategoryStoryScreen>
//     with SingleTickerProviderStateMixin {
//   TabController? _tabController;
//   @override
//   void initState() {
//     super.initState();
//
//     _tabController = TabController(length: widget.story.length, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _tabController?.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(child: getBody()),
//     );
//   }
//
//   Widget getBody() {
//     var size = MediaQuery.of(context).size;
//     return RotatedBox(
//       quarterTurns: 1,
//       child: TabBarView(
//         controller: _tabController,
//         children: List.generate(widget.story.length, (index) {
//           return VideoPlayerItem(
//             id: widget.story[index].id.toString(),
//             media: widget.story[index].media,
//             size: size,
//             name: widget.story[index].userDetails?.name,
//             caption: widget.story[index].title,
//             profileImg: widget.story[index].userDetails?.avatar,
//             views: widget.story[index].views.toString(),
//             userId: widget.story[index].userDetails!.id.toString(),
//           );
//         }),
//       ),
//     );
//   }
// }
