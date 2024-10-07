import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storyv2/core/helpers/extensions.dart';
import 'package:storyv2/layers/domain/entities/tale_entity.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_tale_intro/get_tale_intro_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';

class TaleCardWidget extends StatelessWidget {
  final TaleEntity taleEntity;
  const TaleCardWidget({super.key, required this.taleEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (taleEntity.thumbnail != null)
          InkWell(
            onTap: () {
              context
                  .read<GetTaleIntroBloc>()
                  .add(GetTaleIntroEvent.request(tale: taleEntity));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(UIConstants.borderRadius),
              child: Image.network(
                taleEntity.thumbnail!,
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
        SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taleEntity.title ?? "--",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  if (taleEntity.categoryName != null)
                    Text(
                      taleEntity.categoryName!.capitalize(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                ],
              ),
            ),
            if (taleEntity.distance != null)
              Container(
                height: 34,
                margin: EdgeInsets.only(top: 4),
                padding:
                    EdgeInsets.symmetric(horizontal: UIConstants.minPadding),
                decoration: BoxDecoration(
                    color: AppColors.dark,
                    borderRadius:
                        BorderRadius.circular(UIConstants.minBorderRadius)),
                child: Row(
                  children: [
                    Icon(
                      Icons.directions,
                      color: AppColors.white,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "${taleEntity.distance?.toStringAsFixed(2).toString() ?? "10+"} km",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              )
          ],
        )
      ],
    );
  }
}
