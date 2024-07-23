import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/app_colors.dart';
import 'core/routes/router_builder.dart';
import 'firebase_options.dart';
import 'utils/bloc_observer.dart';
import 'utils/dependencies_injection.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    Bloc.observer = TitsBlocObserver();
    await serviceLocator();

    // Initialize firebase in Flutter App
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    return SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    ).then((_) => runApp(const MyApp()));
  }, (error, stackTrace) async {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tit-Tit',
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(scaffoldBackgroundColor: AppColors.black),
      debugShowCheckedModeBanner: false,
      themeAnimationDuration: const Duration(seconds: 3),
      builder: (context, child) => ScrollConfiguration(
          behavior: NoOverScrollBehavior(), child: child ?? Placeholder()),
      routerConfig: router,
    );
  }
}

class NoOverScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
