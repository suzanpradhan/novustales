import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../constants/app_colors.dart';
import '../blocs/internet_checker/internet_checker_bloc.dart';

class InternetStatusBar extends StatefulWidget {
  const InternetStatusBar({super.key});

  @override
  State<InternetStatusBar> createState() => _InternetStatusBarState();
}

class _InternetStatusBarState extends State<InternetStatusBar> {
  bool isBackOnline = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCheckerBloc, InternetCheckerState>(
      listener: (context, state) {
        if (state.status == InternetStatus.connected && isBackOnline == false) {
          Timer(const Duration(seconds: 2), () {
            setState(() {
              isBackOnline = true;
            });
          });
        } else if (state.status == InternetStatus.disconnected) {
          isBackOnline = false;
        }
      },
      child: BlocBuilder<InternetCheckerBloc, InternetCheckerState>(
        builder: (context, state) {
          if (!isBackOnline) {
            return Material(
              child: MediaQuery.withClampedTextScaling(
                maxScaleFactor: 1.5,
                child: DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.white, fontSize: 12),
                  child: Container(
                    width: double.maxFinite,
                    height: 28,
                    decoration: BoxDecoration(
                        color: state.status == InternetStatus.connected
                            ? Colors.green
                            : Colors.redAccent),
                    child: Center(
                      child: Text(state.status == InternetStatus.connected
                          ? "Back Online"
                          : "No Internet Connection"),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
