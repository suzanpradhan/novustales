import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../blocs/get_categories/get_categories_bloc.dart';
import '../blocs/search_stories/search_stories_bloc.dart';

class SearchCategoriesWidget extends StatelessWidget {
  const SearchCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchStoriesBloc, SearchStoriesState>(
      builder: (context, searchState) {
        return BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
          builder: (context, state) {
            return state.mapOrNull(
                  success: (value) {
                    return Gapper.screenPadding(
                      child: Wrap(
                          runAlignment: WrapAlignment.spaceBetween,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          runSpacing: UIConstants.padding,
                          spacing: UIConstants.minPadding,
                          children: value.categories
                              .map((item) => GestureDetector(
                                    onTap: () {
                                      context.read<SearchStoriesBloc>().add(
                                          SearchStoriesEvent
                                              .registerCategoryName(
                                                  categoryName: item.name));
                                      // selectedCategories = [
                                      //   ...selectedCategories,
                                      //   item.id
                                      // ];
                                      // setState(() {});
                                      // log(selectedCategories.toString());
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              (UIConstants.minPadding + 24))),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5, sigmaY: 5),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: UIConstants.minPadding,
                                              horizontal:
                                                  UIConstants.maxPadding),
                                          decoration: BoxDecoration(
                                            color: searchState.categoryNames
                                                            .value !=
                                                        null &&
                                                    searchState
                                                        .categoryNames.value!
                                                        .contains(item.id)
                                                ? AppColors.white
                                                : null,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    (UIConstants.minPadding +
                                                        24))),
                                            border: Border.all(
                                                color: AppColors.border
                                                    .withOpacity(0.2)),
                                          ),
                                          child: Text(
                                            item.name,
                                            style: TextStyle(
                                                color: AppColors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList()),
                    );
                  },
                ) ??
                SizedBox();
          },
        );
      },
    );
  }
}
