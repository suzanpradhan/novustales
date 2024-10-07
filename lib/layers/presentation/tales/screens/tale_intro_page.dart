import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:storyv2/core/routes/app_routes.dart';
import 'package:storyv2/layers/domain/entities/tale_entity.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/ui_constants.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../blocs/get_direction/get_direction_bloc.dart';

class TaleIntroPage extends StatelessWidget {
  final Position? currentLocation;
  final TaleEntity tale;
  final ScrollController scrollController;
  const TaleIntroPage(
      {super.key,
      this.currentLocation,
      required this.tale,
      required this.scrollController});

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
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        if (tale.categoryName != null)
                          Text(
                            tale.categoryName!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontFamily: "UberBold"),
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
                                          image: NetworkImage(
                                              tale.createdBy!.avatar!),
                                          fit: BoxFit.cover)),
                                ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: UIConstants.xminPadding),
                                child: Text((tale.createdBy?.firstName !=
                                            null &&
                                        tale.createdBy?.lastName != null)
                                    ? "${tale.createdBy!.firstName} ${tale.createdBy?.lastName}"
                                    : (tale.createdBy?.nickName ?? "--")),
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                  Gapper.hmGap(),
                  if (tale.distance != null)
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            if (tale.distance! > 1.00 &&
                                tale.latitude != null &&
                                tale.longitude != null &&
                                currentLocation != null) {
                              context.read<GetDirectionBloc>().add(
                                  GetDirectionEvent.request(
                                      origin: LatLng(currentLocation!.latitude,
                                          currentLocation!.longitude),
                                      destination: LatLng(
                                          tale.latitude!, tale.longitude!)));
                            } else {
                              context.push(TALE_DETAIL_ROUTE, extra: tale);
                            }
                          },
                          child: Container(
                            height: 58,
                            width: 58,
                            padding: EdgeInsets.symmetric(
                                horizontal: UIConstants.minPadding),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.purpleAccent
                                          .withOpacity(0.4),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                      offset: Offset(0, 3))
                                ],
                                color: AppColors.purpleAccent,
                                borderRadius: BorderRadius.circular(
                                    UIConstants.borderRadius)),
                            child: (tale.distance! <= 1.00)
                                ? Center(
                                    child: Text(
                                    "Join",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
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
                        ),
                        Gapper.vxmGap(),
                        Text(
                          "${tale.distance?.toStringAsFixed(2).toString() ?? "10+"} km",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: AppColors.black,
                                  fontFamily: "UberBold"),
                        ),
                      ],
                    )
                ],
              ),
              Gapper.vmGap(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              UIConstants.minBorderRadius),
                          color: AppColors.purpleAccent.withOpacity(0.1)),
                      width: double.maxFinite,
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
                                .titleLarge
                                ?.copyWith(fontSize: 24),
                          ),
                          Text(
                            "Daily visit",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gapper.hmGap(),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              UIConstants.minBorderRadius),
                          color: AppColors.purpleAccent.withOpacity(0.1)),
                      width: double.maxFinite,
                      height: 90,
                      padding: EdgeInsets.all(UIConstants.minPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tale.followers.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: 24),
                          ),
                          Text(
                            "Followers",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gapper.hmGap(),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              UIConstants.minBorderRadius),
                          color: AppColors.purpleAccent.withOpacity(0.1)),
                      width: double.maxFinite,
                      height: 90,
                      padding: EdgeInsets.all(UIConstants.minPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tale.created_at == null
                                ? "--"
                                : DateFormat("d MMM").format(tale.created_at!),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontSize: 24),
                          ),
                          Text(
                            "Started on",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Gapper.vmGap(),
              if (tale.description != null)
                Text(
                  tale.description!,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
            ],
          ),
        ));
  }
}
