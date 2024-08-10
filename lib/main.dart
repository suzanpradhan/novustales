import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storyv2/core/presentation/blocs/internet_checker/internet_checker_bloc.dart';
import 'package:storyv2/layers/presentation/auth/login/login_bloc.dart';
import 'package:storyv2/layers/presentation/auth/register/register_bloc.dart';
import 'package:storyv2/layers/presentation/bootstrap/app_bloc/app_bloc.dart';
import 'package:storyv2/layers/presentation/feed/blocs/for_you_story/for_you_story_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_near_me_tales/get_near_me_tales_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_popular_tales/get_popular_tales_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/search_tales/search_tales_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<InternetCheckerBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<AppBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<LoginBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<RegisterBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<GetPopularTalesBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<GetNearMeTalesBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SearchTalesBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<ForYouStoryBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'NovuTales',
        themeMode: ThemeMode.light,
        darkTheme: ThemeData(scaffoldBackgroundColor: AppColors.black),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                    color: AppColors.black,
                    fontFamily: "SatoshiRegular",
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            primaryColor: AppColors.red,
            dividerColor: Colors.transparent,
            expansionTileTheme: const ExpansionTileThemeData(
                backgroundColor: Colors.white,
                iconColor: Colors.black,
                collapsedIconColor: Colors.black),
            sliderTheme: SliderThemeData(
                activeTrackColor: AppColors.grayDark,
                inactiveTrackColor: AppColors.whiteShade,
                thumbColor: AppColors.gray,
                tickMarkShape:
                    const RoundSliderTickMarkShape(tickMarkRadius: 0),
                activeTickMarkColor: Colors.transparent,
                showValueIndicator: ShowValueIndicator.always,
                // trackShape: EdgeToEdgeTrackShape(),
                // rangeTrackShape: EdgeToEdgeRangeTrackShape(),
                trackHeight: 2,
                minThumbSeparation: 300),
            bottomSheetTheme:
                const BottomSheetThemeData(surfaceTintColor: Colors.white),
            colorScheme: ColorScheme(
              brightness: Brightness.light,
              onSurface: AppColors.dark,
              primary: AppColors.white,
              secondary: AppColors.whiteShade,
              surface: AppColors.white,
              onPrimary: AppColors.grayDark,
              onSecondary: AppColors.dark,
              tertiary: AppColors.gray,
              onTertiary: AppColors.gray,
              primaryContainer: AppColors.white,
              secondaryContainer: AppColors.white,
              outline: AppColors.gray,
              outlineVariant: AppColors.gray,
              inversePrimary: AppColors.white,
              onSecondaryContainer: AppColors.gray,
              onErrorContainer: AppColors.red,
              errorContainer: AppColors.red.withOpacity(0.1),
              onError: AppColors.red.withOpacity(0.5),
              error: AppColors.red,
            ),
            useMaterial3: true,
            inputDecorationTheme:
                const InputDecorationTheme(focusColor: AppColors.dark),
            textButtonTheme: const TextButtonThemeData(
                style: ButtonStyle(
                    padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 6, vertical: 0)),
                    overlayColor: WidgetStatePropertyAll(AppColors.whiteShade),
                    iconColor: WidgetStatePropertyAll(AppColors.black),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)))),
                    foregroundColor: WidgetStatePropertyAll(AppColors.grayDark),
                    textStyle: WidgetStatePropertyAll(TextStyle(
                        fontSize: 14,
                        fontFamily: "SatoshiRegular",
                        color: Colors.black)))),
            textTheme: const TextTheme(
              displayLarge: TextStyle(fontSize: 24, fontFamily: "RalewayBold"),
              displayMedium:
                  TextStyle(fontSize: 16, fontFamily: "SatoshiRegular"),
              displaySmall:
                  TextStyle(fontSize: 12, fontFamily: "SatoshiRegular"),
              titleMedium:
                  TextStyle(fontSize: 16, fontFamily: "SatoshiRegular"),
              bodyLarge: TextStyle(fontSize: 18, fontFamily: "SatoshiRegular"),
              bodyMedium: TextStyle(fontSize: 16, fontFamily: "SatoshiRegular"),
              bodySmall: TextStyle(fontSize: 14, fontFamily: "SatoshiRegular"),
            )),
        themeAnimationDuration: const Duration(seconds: 3),
        builder: (context, child) => ScrollConfiguration(
            behavior: NoOverScrollBehavior(), child: child ?? Placeholder()),
        routerConfig: router,
      ),
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
