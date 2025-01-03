import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:storyv2/core/presentation/blocs/internet_checker/internet_checker_bloc.dart';
import 'package:storyv2/layers/presentation/auth/bloc/logout_bloc.dart';
import 'package:storyv2/layers/presentation/auth/login/login_bloc.dart';
import 'package:storyv2/layers/presentation/auth/register/register_bloc.dart';
import 'package:storyv2/layers/presentation/bootstrap/app_bloc/app_bloc.dart';
import 'package:storyv2/layers/presentation/chat/blocs/chat_rooms/chat_rooms_bloc.dart';
import 'package:storyv2/layers/presentation/chat/blocs/read_message/read_message_bloc.dart';
import 'package:storyv2/layers/presentation/feed/blocs/for_you_story/for_you_story_bloc.dart';
import 'package:storyv2/layers/presentation/feed/blocs/trending_story/trending_story_bloc.dart';
import 'package:storyv2/layers/presentation/me/bloc/profile_bloc/get_profile_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_direction/get_direction_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_near_me_tales/get_near_me_tales_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_popular_tales/get_popular_tales_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/get_tale_intro/get_tale_intro_bloc.dart';
import 'package:storyv2/layers/presentation/tales/blocs/search_tales/search_tales_bloc.dart';

import 'core/constants/app_colors.dart';
import 'core/routes/router_builder.dart';
import 'firebase_options.dart';
import 'layers/presentation/chat/blocs/send_message/send_message_bloc.dart';
import 'layers/presentation/feed/blocs/get_categories/get_categories_bloc.dart';
import 'layers/presentation/feed/blocs/search_stories/search_stories_bloc.dart';
import 'utils/bloc_observer.dart';
import 'utils/dependencies_injection.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await dotenv.load(fileName: ".env");

    Bloc.observer = TitsBlocObserver();
    await serviceLocator();
    Logger.level = Level.off;

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
          create: (context) => sl<GetTaleIntroBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<ForYouStoryBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<TrendingStoryBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<GetProfileBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<GetCategoriesBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SearchStoriesBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<ChatRoomsBloc>(),
        ),
        BlocProvider(
          create: (context) => ReadMessageBloc(sl()),
        ),
        BlocProvider(
          create: (context) => sl<GetDirectionBloc>(),
        ),
        BlocProvider(
          create: (context) => SendMessageBloc(sl()),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(sl()),
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
                tickMarkShape: const RoundSliderTickMarkShape(tickMarkRadius: 0),
                activeTickMarkColor: Colors.transparent,
                showValueIndicator: ShowValueIndicator.always,
                // trackShape: EdgeToEdgeTrackShape(),
                // rangeTrackShape: EdgeToEdgeRangeTrackShape(),
                trackHeight: 2,
                minThumbSeparation: 300),
            bottomSheetTheme: const BottomSheetThemeData(surfaceTintColor: Colors.white),
            colorScheme: ColorScheme(
              primary: AppColors.white,
              onPrimary: AppColors.grayDark,
              primaryContainer: AppColors.white,
              inversePrimary: AppColors.white,
              secondary: AppColors.whiteShade,
              onSecondary: AppColors.blueAccent,
              secondaryContainer: AppColors.greyWhite,
              onSecondaryContainer: AppColors.gray,
              surface: AppColors.white,
              onSurface: AppColors.dark,
              tertiary: AppColors.gray,
              onTertiary: AppColors.gray,
              outline: AppColors.gray,
              outlineVariant: AppColors.gray,
              error: AppColors.red,
              onError: AppColors.red.withOpacity(0.5),
              errorContainer: AppColors.red.withOpacity(0.1),
              onErrorContainer: AppColors.red,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
            inputDecorationTheme: const InputDecorationTheme(focusColor: AppColors.dark),
            textButtonTheme: const TextButtonThemeData(
                style: ButtonStyle(
                    padding:
                        WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 6, vertical: 0)),
                    overlayColor: WidgetStatePropertyAll(AppColors.whiteShade),
                    iconColor: WidgetStatePropertyAll(AppColors.black),
                    shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4)))),
                    foregroundColor: WidgetStatePropertyAll(AppColors.grayDark),
                    textStyle: WidgetStatePropertyAll(
                        TextStyle(fontSize: 14, fontFamily: "UberRegular", color: Colors.black)))),
            textTheme: const TextTheme(
              displayLarge: TextStyle(fontSize: 20, fontFamily: "UberBold"),
              displayMedium: TextStyle(fontSize: 24, fontFamily: "UberRegular"),
              displaySmall: TextStyle(fontSize: 24, fontFamily: "UberMedium"),
              headlineLarge: TextStyle(fontSize: 18, fontFamily: "UberBold"),
              headlineMedium: TextStyle(fontSize: 18, fontFamily: "UberRegular"),
              headlineSmall: TextStyle(fontSize: 18, fontFamily: "UberMedium"),
              titleLarge: TextStyle(fontSize: 16, fontFamily: "UberBold"),
              titleMedium: TextStyle(fontSize: 16, fontFamily: "UberRegular"),
              titleSmall: TextStyle(fontSize: 16, fontFamily: "UberMedium"),
              bodyLarge: TextStyle(fontSize: 18, fontFamily: "UberMedium"),
              bodyMedium: TextStyle(fontSize: 16, fontFamily: "UberRegular"),
              bodySmall: TextStyle(fontSize: 14, fontFamily: "UberRegular"),
              labelLarge: TextStyle(fontSize: 12, fontFamily: "UberBold"),
              labelMedium: TextStyle(fontSize: 12, fontFamily: "UberMedium"),
              labelSmall: TextStyle(fontSize: 12, fontFamily: "UberRegular"),
            )),
        themeAnimationDuration: const Duration(seconds: 3),
        builder: (context, child) =>
            ScrollConfiguration(behavior: NoOverScrollBehavior(), child: child ?? Placeholder()),
        routerConfig: router,
      ),
    );
  }
}

class NoOverScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
