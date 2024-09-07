import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:storyv2/layers/presentation/feed/screens/story_page.dart';

import '../../../../core/constants/app_colors.dart';
import '../blocs/search_stories/search_stories_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<SearchStoriesBloc>()
        ..add(SearchStoriesEvent.attempt()),
      child: BlocBuilder<SearchStoriesBloc, SearchStoriesState>(
          builder: (context, state) {
        if (state.filterData == null) {
          return Container(
            color: AppColors.black,
            child: Center(
              child: Text(
                'Failed to load',
                style: TextStyle(color: AppColors.white),
              ),
            ),
          );
        } else if (state.status.isInProgress) {
          return Container(
            color: AppColors.black,
            child: Center(
              child: Text(
                'Loading...',
                style: TextStyle(color: AppColors.white),
              ),
            ),
          );
        } else if (state.filterData!.isEmpty) {
          return Container(
            color: AppColors.black,
            child: Center(
              child: Text(
                'No stories found',
                style: TextStyle(color: AppColors.white),
              ),
            ),
          );
        } else {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.filterData?.length,
            itemBuilder: (context, index) {
              return StoryPage(
                story: state.filterData![index],
              );
            },
          );
        }
      }),
    );
  }
}
