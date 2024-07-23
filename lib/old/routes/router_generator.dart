import 'package:flutter/material.dart';
import 'package:storyv2/old/routes/route_name.dart';
import 'package:storyv2/old/screens/authentication/login/login_screen.dart';
import 'package:storyv2/old/screens/authentication/register/register_screen.dart';
import 'package:storyv2/old/screens/authentication/register/registration_success.dart';
import 'package:storyv2/old/screens/navigation/navigation.dart';
import 'package:storyv2/old/screens/onboarding/onboarding.dart';
import 'package:storyv2/old/screens/premium/add_war_post.dart';
import 'package:storyv2/old/screens/premium/battle_detailed.dart';
import 'package:storyv2/old/screens/premium/battle_detailed_video.dart';
import 'package:storyv2/old/screens/premium/battle_listing.dart';
import 'package:storyv2/old/screens/premium/battle_overview.dart';
import 'package:storyv2/old/screens/premium/community_wars.dart';
import 'package:storyv2/old/screens/premium/create_battle.dart';
import 'package:storyv2/old/screens/premium/models/submission_model.dart';
import 'package:storyv2/old/screens/premium/models/war_model.dart';
import 'package:storyv2/old/screens/premium/notifications.dart';
import 'package:storyv2/old/screens/premium/parameters/battle_detailed_video_param.dart';
import 'package:storyv2/old/screens/premium/parameters/war_param.dart';
import 'package:storyv2/old/screens/premium/pending_submissions.dart';
import 'package:storyv2/old/screens/premium/premium.dart';
import 'package:storyv2/old/screens/premium/search_user_war.dart';
import 'package:storyv2/old/screens/premium/utils/animation_routing.dart';
import 'package:storyv2/old/screens/profile/other_user_profile.dart';
import 'package:storyv2/old/screens/profile/user_profile_screen.dart';
import 'package:storyv2/old/screens/splash/splash_screen.dart';

import '../screens/chat/group/create_group_screen.dart';
import '../screens/chat/request/chat_request_screen.dart';
import '../screens/profile/edit_profile_screen.dart';

class RouteGenerator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, {Object? args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  static Future<dynamic> replacePage(String routeName, {Object? args}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: args);
  }

  static goBack() {
    return navigatorKey.currentState?.pop();
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeSplash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case routeUserProfile:
        return MaterialPageRoute(builder: (_) => const UserProfileScreen());

      case routeOtherUserProfile:
        return CustomPageRoute(
          child: OtherUserProfileScreen(id: settings.arguments as String),
          direction: AxisDirection.left,
        );

      case routeOnBoarding:
        return MaterialPageRoute(builder: (_) => const Onboarding());
      case routeLogin:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case routeRegister:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case routeRegisterSuccess:
        return MaterialPageRoute(builder: (_) => const RegistrationSuccess());
      case EditProfileScreen.routeName:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
      case routeNavigation:
        return MaterialPageRoute(builder: (_) => const Navigation());

      case routePremium:
        return MaterialPageRoute(builder: (_) => const Premium());

      case routeBattleListing:
        return MaterialPageRoute(builder: (_) => const BattleListing());

      case routeNotifications:
        return MaterialPageRoute(builder: (_) => const Notifications());

      case routeCreateBattle:
        return CustomPageRoute(
            child: CreateBattle(), direction: AxisDirection.left);

      case routeCommunityWars:
        return CustomPageRoute(
          child: CommunityWars(prm: settings.arguments as WarParam),
          direction: AxisDirection.left,
        );

      case routePendingSubmissions:
        return CustomPageRoute(
          child: PendingSubmissions(war: settings.arguments as WarModel),
          direction: AxisDirection.left,
        );

      case routeAddWarPost:
        return CustomPageRoute(
          child: AddWarPost(war: settings.arguments as WarModel),
          direction: AxisDirection.left,
        );

      case routeSearchUserWar:
        return MaterialPageRoute(builder: (_) => SearchUserWar());

      case routeBattleDetailed:
        return MaterialPageRoute(
          builder: (_) =>
              BattleDetailed(submission: settings.arguments as SubmissionModel),
        );

      case routeBattleDetailedVideo:
        return MaterialPageRoute(
            builder: (_) =>
                BattleDetailedVideo(param: settings.arguments as BDVParam));

      case routeBattleOverview:
        return MaterialPageRoute(
            builder: (_) =>
                BattleOverview(prm: settings.arguments as WarParam));
      case ChatRequestScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ChatRequestScreen());
      case CreateChatGroupScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => CreateChatGroupScreen(
                  senderId: settings.arguments as String,
                ));

      default:
        return _onPageNotFound();
    }
  }

  static Route<dynamic> _onPageNotFound() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text("Page not found")),
      ),
    );
  }
}
