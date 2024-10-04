import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/layers/domain/entities/tale_entity.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../../../../core/presentation/widgets/count_info_card_widget.dart';

class TaleDetailScreen extends StatefulWidget {
  final TaleEntity tale;
  const TaleDetailScreen({super.key, required this.tale});

  @override
  State<TaleDetailScreen> createState() => _TaleDetailScreenState();
}

class _TaleDetailScreenState extends State<TaleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBarCustom(
      //   isTransparent: true,
      //   iconBgColor: AppColors.white.withOpacity(.3),
      // ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.white,
            automaticallyImplyLeading: false,
            toolbarHeight: 60,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.white.withOpacity(.3)),
                  child: GestureDetector(
                    onTap: () {
                      // Define your action here
                      context.pop();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(UIConstants.x2minPadding),
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.dark,
                        size: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
            elevation: 0,
            pinned: true,
            centerTitle: false,
            expandedHeight: 450.0,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [StretchMode.zoomBackground],
              background: Stack(
                children: [
                  ClipRRect(
                    child: Image.network(
                      widget.tale.thumbnail!,
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Colors.white.withOpacity(0),
                          Colors.white
                        ])),
                  )
                ],
              ),
            ),
          ),
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            pinned: true,
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(-10.0), child: SizedBox()),
            flexibleSpace: Container(
              color: AppColors.darkShade,
            ),
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Column(
          //         children: [
          //           Gapper.screenPadding(
          //             child: Container(
          //               color: AppColors.greyWhite,
          //               height: 200,
          //               width: MediaQuery.of(context).size.width,
          //             ),
          //           ),
          //           Gapper.vGap(),
          //         ],
          //       );
          //     },
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Gapper.screenPadding(
              child: Column(
                children: [
                  Gapper.cardPadding(
                    child: Container(
                      width: double.maxFinite,
                      color: AppColors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "BoomTown Fair\n",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontFamily: "SatoshiMedium",
                                    color: AppColors.dark,
                                  ),
                              children: [
                                TextSpan(
                                  text: "Music and Festival",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontFamily: "SatoshiRegular",
                                        color: AppColors.dark.withOpacity(.8),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Gapper.v2xmGap(),
                          Row(
                            children: [
                              Container(
                                width:
                                    25, // Image size (should be slightly smaller than the outer border)
                                height: 25,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child:
                                    Image.asset(Assets.test, fit: BoxFit.cover),
                              ),
                              Gapper.h2xmGap(),
                              Text("Niwesh Shrestha")
                            ],
                          ),
                          Gapper.vGap(),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: double.maxFinite,
                                  height: 190,
                                  child: CountInfoCardWidget(
                                    text1: Text(
                                      "1124",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                            fontFamily: "SatoshiBold",
                                            color:
                                                AppColors.dark.withOpacity(.8),
                                          ),
                                    ),
                                    text2: Text(
                                      "Daily Visit",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontFamily: "SatoshiMedium",
                                            color:
                                                AppColors.dark.withOpacity(.8),
                                          ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
