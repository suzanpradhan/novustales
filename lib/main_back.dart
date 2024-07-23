import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as fr;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:storyv2/old/providers/auth_view_model.dart';
import 'package:storyv2/old/providers/category_view_model.dart';
import 'package:storyv2/old/providers/coin_view_model.dart';
import 'package:storyv2/old/providers/comment_view_model.dart';
import 'package:storyv2/old/providers/common_view_model.dart';
import 'package:storyv2/old/providers/for_you_view_model.dart';
import 'package:storyv2/old/providers/location_provider.dart';
import 'package:storyv2/old/providers/pinned_view_model.dart';
import 'package:storyv2/old/providers/story_view_model.dart';
import 'package:storyv2/old/providers/view_story_model.dart';
import 'package:storyv2/old/routes/route_name.dart';
import 'package:storyv2/old/routes/router_generator.dart';
import 'package:storyv2/old/screens/add_post/widgets/camera_screen.dart';
import 'package:storyv2/old/screens/premium/providers/war_view_model.dart';
import 'package:storyv2/old/screens/test_view_model.dart';

import 'firebase_options.dart';
import 'old/config/preference_utils.dart';
import 'old/constants/app_color.dart';
import 'old/helper/notification_service.dart';
import 'old/screens/premium/utils/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  LocalNotificationService.initialize();
  await PreferenceUtils.init();

  cameras = await availableCameras();

  runApp(const fr.ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CommonViewModel>(
            create: (_) => CommonViewModel()),
        ChangeNotifierProvider<CoinViewModel>(create: (_) => CoinViewModel()),
        ChangeNotifierProvider<LocationProvider>(
            create: (_) => LocationProvider()),
        ChangeNotifierProvider<PinnedViewModel>(
            create: (_) => PinnedViewModel()),
        ChangeNotifierProvider<ViewStoryModel>(create: (_) => ViewStoryModel()),
        ChangeNotifierProvider<CommentViewModel>(
            create: (_) => CommentViewModel()),
        ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
        ChangeNotifierProvider<StoryViewModel>(create: (_) => StoryViewModel()),
        ChangeNotifierProvider<CategoryViewModel>(
            create: (_) => CategoryViewModel()),
        ChangeNotifierProvider<TestViewModel>(create: (_) => TestViewModel()),
        ChangeNotifierProvider<WarViewModel>(create: (_) => WarViewModel()),
        ChangeNotifierProvider<ForYouViewModel>(
            create: (_) => ForYouViewModel()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375.0, 812.0),
        minTextAdapt: true,
        splitScreenMode: true,
        child: OverlaySupport.global(
          child: OverlayKit(
            child: LayoutBuilder(builder: (context, constraint) {
              sCon.init(constraint);
              return MaterialApp(
                title: 'Story',
                theme: ThemeData(
                  scaffoldBackgroundColor: bgColor,
                  appBarTheme: const AppBarTheme(
                    color: bgColor,
                    foregroundColor: bgColor,
                    centerTitle: true,
                    iconTheme: IconThemeData(color: black),
                    elevation: 0,
                    systemOverlayStyle: SystemUiOverlayStyle.light,
                  ),
                  fontFamily: "Inter",
                ),
                debugShowCheckedModeBanner: false,
                navigatorKey: RouteGenerator.navigatorKey,
                initialRoute: routeSplash,
                onGenerateRoute: RouteGenerator.generateRoute,
              );
            }),
          ),
        ),
      ),
    );
  }
}
