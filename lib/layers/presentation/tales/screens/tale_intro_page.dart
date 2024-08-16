import 'package:flutter/material.dart';
import 'package:storyv2/layers/domain/entities/tale_entity.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/presentation/ui/spacer.dart';

class TaleIntroPage extends StatelessWidget {
  final TaleEntity tale;
  final ScrollController scrollController;
  const TaleIntroPage({super.key, required this.tale, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: scrollController,
        child: Gapper.screenPadding(
          child: Column(
            children: [
              Gapper.vGap(),
              ClipRRect(
                borderRadius: BorderRadius.circular(UIConstants.borderRadius),
                child: Image.network(
                  tale.thumbnail!,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Gapper.vmGap(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tale.title ?? "--",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        if (tale.categoryName != null)
                          Text(
                            tale.categoryName!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        Gapper.vmGap(),
                        if (tale.createdBy != null)
                          Row(
                            children: [
                              if (tale.createdBy!.avatar != null)
                                Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(tale.createdBy!.avatar!),
                                          fit: BoxFit.cover)),
                                ),
                              Padding(
                                padding: const EdgeInsets.only(left: UIConstants.xminPadding),
                                child: Text((tale.createdBy?.firstName != null &&
                                        tale.createdBy?.lastName != null)
                                    ? "${tale.createdBy!.firstName} ${tale.createdBy?.lastName}"
                                    : (tale.createdBy?.nickName ?? "--")),
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                  if (tale.distance != null)
                    Column(
                      children: [
                        Container(
                          height: 58,
                          width: 58,
                          padding: EdgeInsets.symmetric(horizontal: UIConstants.minPadding),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.purpleAccent.withOpacity(0.4),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: Offset(0, 3))
                              ],
                              color: AppColors.purpleAccent,
                              borderRadius: BorderRadius.circular(UIConstants.borderRadius)),
                          child: (tale.distance! <= 1.00)
                              ? Center(
                                  child: Text(
                                  "Join",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                ))
                              : Transform.rotate(
                                  angle: 45 * (3.14159265359 / 180),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 6),
                                    child: Icon(
                                      Icons.navigation_rounded,
                                      color: AppColors.white,
                                      size: 34,
                                    ),
                                  ),
                                ),
                        ),
                        Gapper.vxmGap(),
                        Text(
                          "${tale.distance?.toStringAsFixed(2).toString() ?? "10+"} km",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                ],
              ),
              Gapper.vmGap(),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(UIConstants.minBorderRadius),
                        color: AppColors.purpleAccent.withOpacity(0.1)),
                    width: 110,
                    height: 90,
                    padding: EdgeInsets.all(UIConstants.minPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "1224",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Daily visit",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Gapper.hmGap(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(UIConstants.minBorderRadius),
                        color: AppColors.purpleAccent.withOpacity(0.1)),
                    width: 110,
                    height: 90,
                    padding: EdgeInsets.all(UIConstants.minPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "42k",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Followers",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Gapper.hmGap(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(UIConstants.minBorderRadius),
                        color: AppColors.purpleAccent.withOpacity(0.1)),
                    width: 110,
                    height: 90,
                    padding: EdgeInsets.all(UIConstants.minPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "12 Aug",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Started on",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Gapper.vmGap(),
              if (tale.description != null) Text(tale.description!)
            ],
          ),
        ));
  }
}
