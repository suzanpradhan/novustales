import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/presentation/ui/spacer.dart';
import 'package:storyv2/layers/presentation/tales/blocs/search_tales/search_tales_bloc.dart';

import '../../../../core/constants/ui_constants.dart';
import '../widgets/tale_card_widget.dart';

class FilteredTalesPage extends StatelessWidget {
  final ScrollController scrollController;
  final String tabKey;
  const FilteredTalesPage({super.key, required this.scrollController, required this.tabKey});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        BlocBuilder<SearchTalesBloc, SearchTalesState>(
          builder: (context, state) {
            return state.whenOrNull(
                  success: (tales) {
                    return SliverList.builder(
                      itemCount: tales.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.fromLTRB(UIConstants.screenPadding,
                                UIConstants.padding, UIConstants.screenPadding, 0),
                            child: TaleCardWidget(
                              taleEntity: tales[index],
                            ));
                      },
                    );
                  },
                ) ??
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Gapper.vmxGap(),
                      Text(
                        "Search for tales...",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.grayDark),
                      ),
                    ],
                  ),
                );
          },
        )
      ],
    );
  }
}
