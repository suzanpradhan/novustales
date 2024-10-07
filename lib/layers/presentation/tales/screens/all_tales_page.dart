import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_near_me_tales/get_near_me_tales_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_popular_tales/get_popular_tales_bloc.dart';

import '../../../../core/presentation/ui/spacer.dart';
import '../widgets/tale_card_widget.dart';

class AllTalesPage extends StatefulWidget {
  final ScrollController scrollController;
  const AllTalesPage({super.key, required this.scrollController});

  @override
  State<AllTalesPage> createState() => _AllTalesPageState();
}

class _AllTalesPageState extends State<AllTalesPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: widget.scrollController,
      slivers: [
        BlocBuilder<GetNearMeTalesBloc, GetNearMeTalesState>(
          builder: (context, state) {
            return state.whenOrNull(
                  success: (tales) {
                    if (tales.isEmpty) {
                      return SliverToBoxAdapter(
                        child: SizedBox(),
                      );
                    }
                    return SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Gapper.vGap(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: Text(
                                  "Near Me",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // context.push(viewAllRoute!);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 14.0),
                                  child: Text('View all',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ),
                              ),
                            ],
                          ),
                          Gapper.vGap(),
                          SingleChildScrollView(
                            physics: const PageScrollPhysics(),
                            controller: PageController(
                              initialPage: 0,
                              viewportFraction: 0.8,
                            ),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(tales.length, (index) {
                                return SizedBox(
                                  width: tales.length == 1
                                      ? MediaQuery.of(context).size.width
                                      : MediaQuery.of(context).size.width * 0.8,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: UIConstants.screenPadding,
                                        right: index == tales.length - 1
                                            ? UIConstants.screenPadding
                                            : 0),
                                    child: TaleCardWidget(
                                      taleEntity: tales[index],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ) ??
                SliverToBoxAdapter(
                  child: SizedBox(),
                );
          },
        ),
        BlocBuilder<GetPopularTalesBloc, GetPopularTalesState>(
          builder: (context, state) {
            return state.whenOrNull(
                  success: (tales) {
                    return SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Gapper.vGap(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: Text(
                                  "Popular",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // context.push(viewAllRoute!);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 14.0),
                                  child: Text('View all',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                ),
                              ),
                            ],
                          ),
                          Gapper.vGap(),
                          SingleChildScrollView(
                            physics: const PageScrollPhysics(),
                            controller: PageController(
                              initialPage: 0,
                              viewportFraction: 0.8,
                            ),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(tales.length, (index) {
                                return SizedBox(
                                  width: tales.length == 1
                                      ? MediaQuery.of(context).size.width -
                                          UIConstants.screenPadding
                                      : MediaQuery.of(context).size.width * 0.8,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: UIConstants.screenPadding,
                                        right: index == tales.length - 1
                                            ? UIConstants.screenPadding
                                            : 0),
                                    child: TaleCardWidget(
                                      taleEntity: tales[index],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ) ??
                SliverToBoxAdapter(
                  child: SizedBox(),
                );
          },
        ),
        BlocBuilder<GetPopularTalesBloc, GetPopularTalesState>(
          builder: (context, state) {
            return state.whenOrNull(
                  success: (tales) {
                    return SliverList.builder(
                      itemCount: tales.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.fromLTRB(
                                UIConstants.screenPadding,
                                UIConstants.padding,
                                UIConstants.screenPadding,
                                0),
                            child: TaleCardWidget(
                              taleEntity: tales[index],
                            ));
                      },
                    );
                  },
                ) ??
                SliverToBoxAdapter(
                  child: SizedBox(),
                );
          },
        ),
        SliverToBoxAdapter(
          child: Gapper.vGap(),
        )
      ],
    );
  }
}
