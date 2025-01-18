import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:storyv2/core/constants/ui_constants.dart';
import 'package:storyv2/core/presentation/ui/novus_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/presentation/ui/spacer.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/usecases/usecase.dart';
import '../../auth/bloc/logout_bloc.dart';
import '../../me/bloc/profile_bloc/get_profile_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.taleBackground,
      appBar: AppBar(
        backgroundColor: AppColors.taleBackground,
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: "UberBold",
                color: AppColors.black,
              ),
        ),
      ),
      body: BlocListener<LogoutBloc, LogoutState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (value) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('You have been logged out!'),
                ),
              );
              context.pushReplacement(LOGIN_ROUTE);
              // context.read<AppBloc>().add(const AppEvent.checkAuthetication());
            },
          );
        },
        child: Gapper.screenPadding(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(UIConstants.borderRadius),
                ),
                child: Gapper.cardPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How you use the app",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Gapper.vmGap(),
                      BlocBuilder<GetProfileBloc, GetProfileState>(
                        builder: (context, state) {
                          return state.mapOrNull(
                                success: (value) {
                                  return Material(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(
                                        UIConstants.borderRadius),
                                    child: InkWell(
                                      onTap: () {
                                        context.push(EDIT_PROFILE_SCREEN_ROUTE,
                                            extra: value.me);
                                      },
                                      borderRadius: BorderRadius.circular(
                                          UIConstants.borderRadius),
                                      child: Gapper.cardMinPadding(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(NovusIcons.profile, size: 20),
                                            Gapper.hGap(),
                                            Expanded(
                                              child: Text(
                                                "Edit profile",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ),
                                            Icon(NovusIcons.arrowLeft, size: 20)
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ) ??
                              SizedBox();
                        },
                      ),
                      Gapper.v2xmGap(),
                      Material(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.circular(UIConstants.borderRadius),
                        child: InkWell(
                          onTap: () {},
                          borderRadius:
                              BorderRadius.circular(UIConstants.borderRadius),
                          child: Gapper.cardMinPadding(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.analytics,
                                  size: 20,
                                ),
                                Gapper.hGap(),
                                Expanded(
                                  child: Text(
                                    "Your Activity",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                                // Icon(Icons.keyboard_arrow_right_outlined),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gapper.vmxGap(),
              Material(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(UIConstants.borderRadius),
                child: InkWell(
                  onTap: () {
                    context
                        .read<LogoutBloc>()
                        .add(LogoutEvent.attempt(NoParams()));
                  },
                  splashColor: AppColors.blueAccent.withOpacity(.2),
                  borderRadius: BorderRadius.circular(UIConstants.borderRadius),
                  child: Gapper.cardPadding(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          color: AppColors.blueAccent,
                          size: 20,
                        ),
                        Gapper.hGap(),
                        Expanded(
                          child: Text(
                            "Logout",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
