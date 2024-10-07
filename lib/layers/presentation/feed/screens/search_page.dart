import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pull_to_refresh_plus/pull_to_refresh_plus.dart';
import 'package:storyv2/layers/presentation/feed/screens/story_page.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../blocs/search_stories/search_stories_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _pageController.addListener(() {
      log("current page: ${_pageController.page} ${context.read<SearchStoriesBloc>().state.filterData?.length}");
      if (context.read<SearchStoriesBloc>().state.filterData != null &&
          (_pageController.page ==
              context.read<SearchStoriesBloc>().state.filterData!.length - 2) &&
          context.read<SearchStoriesBloc>().state.hasMoreData) {
        // context.read<SearchStoriesBloc>().state.filterData.length -2
        context
            .read<SearchStoriesBloc>()
            .add(const SearchStoriesEvent.paginate());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //   return BlocProvider.value(
    // value: context.read<SearchStoriesBloc>()
    //   ..add(SearchStoriesEvent.attempt()),

    return BlocProvider.value(
      value: context.read<SearchStoriesBloc>()
        ..add(SearchStoriesEvent.attempt()),
      child: BlocBuilder<SearchStoriesBloc, SearchStoriesState>(
          builder: (context, state) {
        return SmartRefresher(
            controller: _refreshController,
            enablePullUp:
                !context.read<SearchStoriesBloc>().state.status.isInitial &&
                    state.filterData != null &&
                    state.filterData!.isNotEmpty,
            enablePullDown: false,
            onLoading: () {
              if (!context.read<SearchStoriesBloc>().state.status.isInitial &&
                  context.read<SearchStoriesBloc>().state.hasMoreData) {
                context
                    .read<SearchStoriesBloc>()
                    .add(const SearchStoriesEvent.paginate());
              }
              _refreshController.loadComplete();
            },
            footer: CustomFooter(
              builder: (context, mode) {
                if (mode == LoadStatus.idle || mode == LoadStatus.canLoading) {
                  return const Center(
                    child: CupertinoActivityIndicator(
                      color: AppColors.gray,
                      radius: 14,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              physics: BouncingScrollPhysics(),
              itemCount: state.filterData?.length,
              itemBuilder: (context, index) {
                if (state.filterData != null && state.filterData!.isNotEmpty) {
                  return StoryPage(
                    key: GlobalKey(debugLabel: index.toString()),
                    story: state.filterData![index],
                  );
                } else if (state.status.isInProgress) {
                  return Gapper.vGap();
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            constraints: const BoxConstraints(maxWidth: 80),
                            child: Image.asset(
                              Assets.noProfile,
                              fit: BoxFit.contain,
                            )),
                        Gapper.vGap(),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 260),
                          child: Text(
                            "No results found",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Gapper.vmGap(),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 260),
                          child: Text(
                            "We couldn't find bikes you were looking for.",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ));
      }),
    );
  }
}
