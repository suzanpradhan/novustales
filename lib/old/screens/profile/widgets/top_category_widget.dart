// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../constants/app_color.dart';
// import '../../../constants/font_weight.dart';
// import '../../../constants/text_style.dart';
// import '../../../providers/category_view_model.dart';
// import '../../../providers/story_view_model.dart';
//
// class TopCategoryWidget extends StatelessWidget {
//   static const String routeName = "/user-category";
//
//   const TopCategoryWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer2<CategoryViewModel, StoryViewModel >(builder: (context, data, story, child) {
//       return GridView.builder(
//         physics: NeverScrollableScrollPhysics(),
//         padding: EdgeInsets.only(bottom: 50),
//         shrinkWrap: true,
//         itemCount: story.allCategory.results!.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           childAspectRatio: 1,
//         ),
//         itemBuilder: (BuildContext context, int index) {
//           final category = story.allCategory.results![index];
//           return InkWell(
//             onTap: () {
//               // Navigator.pushNamed(context, CategoryDetailsScreen.routeName,
//               //     arguments: category.name.toString());
//             },
//             child: Stack(
//               alignment: Alignment.bottomLeft,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: CachedNetworkImage(
//                     fit: BoxFit.cover,
//                     height: double.maxFinite,
//                     imageUrl: "${category.image}",
//                     width: double.infinity,
//                     placeholder: (context, url) =>
//                         Center(child: CircularProgressIndicator()),
//                     errorWidget: (context, url, error) => Center(
//                       child: Icon(Icons.error_outline),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     gradient: LinearGradient(
//                       colors: [
//                         Colors.black.withOpacity(.05),
//                         Colors.black.withOpacity(.15)
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(5),
//                   padding: EdgeInsets.all(5),
//                   child: Text(
//                     category.name.toString(),
//                     style: bR16W3.copyWith(
//                       overflow: TextOverflow.ellipsis,
//                       fontSize: 15,
//                       fontWeight: kW5,
//                       color: white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     });
//   }
// }
