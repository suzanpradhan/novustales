import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:storyv2/core/presentation/ui/novus_icons.dart';
import 'package:storyv2/layers/presentation/feed/blocs/for_you_story/for_you_story_bloc.dart';
import 'package:storyv2/layers/presentation/feed/blocs/trending_story/trending_story_bloc.dart';
import 'package:storyv2/layers/presentation/me/bloc/profile_bloc/get_profile_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_popular_tales/get_popular_tales_bloc.dart';

import '../../../layers/presentation/feed/blocs/get_categories/get_categories_bloc.dart';
import '../widgets/internet_status_widget.dart';

class HomeWrapperWidget extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const HomeWrapperWidget({super.key, required this.navigationShell});

  @override
  State<HomeWrapperWidget> createState() => HomeWrapperWidgetState();
}

class HomeWrapperWidgetState extends State<HomeWrapperWidget> {
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: context.read<GetPopularTalesBloc>()
            ..add(GetPopularTalesEvent.request()),
        ),
        BlocProvider.value(
          value: context.read<ForYouStoryBloc>()
            ..add(ForYouStoryEvent.request()),
        ),
        BlocProvider.value(
          value: context.read<TrendingStoryBloc>()
            ..add(TrendingStoryEvent.request()),
        ),

        // BlocProvider.value(
        //   value: context.read<SearchStoriesBloc>()
        //     ..add(SearchStoriesEvent.attempt()),
        // ),
        BlocProvider.value(
          value: context.read<GetCategoriesBloc>()
            ..add(GetCategoriesEvent.started()),
        ),
        BlocProvider.value(
          value: context.read<GetProfileBloc>()..add(GetProfileEvent.request()),
        ),
      ],
      child: Scaffold(
        // extendBody: true,
        // extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   leadingWidth: 100,
        //   leading: Padding(
        //     padding: const EdgeInsets.only(left: 14),
        //     child: Text("LOGO"),
        //   ),
        //   actions: const [],
        // ),
        body: Column(
          children: [
            Expanded(flex: 1, child: widget.navigationShell),
            const InternetStatusBar(),
          ],
        ),
        bottomNavigationBar: Material(
          color: Colors.white,
          shadowColor: Colors.white,
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          width: 1,
                          color: Theme.of(context)
                              .colorScheme
                              .outline
                              .withOpacity(0.4)))),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        if (widget.navigationShell.currentIndex != 0) {
                          widget.navigationShell
                              .goBranch(0, initialLocation: true);
                        }
                      },
                      icon: Icon(
                        (widget.navigationShell.currentIndex == 0)
                            ? NovusIcons.homeActive
                            : NovusIcons.home,
                        size: 22,
                        color: (widget.navigationShell.currentIndex == 0)
                            ? Colors.black
                            : Colors.grey,
                      )),
                  IconButton(
                      onPressed: () {
                        if (widget.navigationShell.currentIndex != 1) {
                          widget.navigationShell.goBranch(1);
                        }
                      },
                      icon: Icon(
                        (widget.navigationShell.currentIndex == 1)
                            ? Ionicons.planet
                            : Ionicons.planet_outline,
                        size: 25,
                        color: (widget.navigationShell.currentIndex == 1)
                            ? Colors.black
                            : Colors.grey,
                      )),
                  IconButton(
                      onPressed: () {
                        if (widget.navigationShell.currentIndex != 2) {
                          widget.navigationShell.goBranch(2);
                        }
                      },
                      icon: Icon(
                        (widget.navigationShell.currentIndex == 2)
                            ? NovusIcons.addActive
                            : NovusIcons.add,
                        size: 22,
                        color: (widget.navigationShell.currentIndex == 2)
                            ? Colors.black
                            : Colors.grey,
                      )),
                  IconButton(
                      onPressed: () {
                        if (widget.navigationShell.currentIndex != 3) {
                          widget.navigationShell.goBranch(3);
                        }
                      },
                      icon: Icon(
                        (widget.navigationShell.currentIndex == 3)
                            ? NovusIcons.messageActive
                            : NovusIcons.message,
                        size: 22,
                        color: (widget.navigationShell.currentIndex == 3)
                            ? Colors.black
                            : Colors.grey,
                      )),
                  IconButton(
                      onPressed: () {
                        if (widget.navigationShell.currentIndex != 4) {
                          widget.navigationShell.goBranch(4);
                        }
                      },
                      icon: Icon(
                        (widget.navigationShell.currentIndex == 4)
                            ? NovusIcons.profileActive
                            : NovusIcons.profile,
                        size: 22,
                        color: (widget.navigationShell.currentIndex == 4)
                            ? Colors.black
                            : Colors.grey,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
