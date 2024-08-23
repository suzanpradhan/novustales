import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storyv2/core/constants/app_colors.dart';
import 'package:storyv2/core/presentation/ui/spacer.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_near_me_tales/get_near_me_tales_bloc.dart';

import '../../../../core/constants/ui_constants.dart';
import '../widgets/tale_card_widget.dart';

class NearMePage extends StatelessWidget {
  final ScrollController scrollController;
  const NearMePage({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        BlocBuilder<GetNearMeTalesBloc, GetNearMeTalesState>(
          builder: (context, state) {
            return state.whenOrNull(
                  success: (tales) {
                    if (tales.isEmpty) {
                      return SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Gapper.vmxGap(),
                            Text(
                              "No results",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: AppColors.grayDark),
                            ),
                          ],
                        ),
                      );
                    }
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
                        "No results",
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
