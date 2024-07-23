import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../layers/presentation/auth/screens/login_screen.dart';
import '../../layers/presentation/auth/screens/register_screen.dart';
import '../../layers/presentation/bootstrap/screens/splash_screen.dart';
import '../../layers/presentation/bootstrap/screens/welcome_screen.dart';
import '../../layers/presentation/feed/screens/feed_screen.dart';
import '../../layers/presentation/tales/screens/tales_screen.dart';
import '../presentation/widgets/home_wrapper_widget.dart';
import 'app_routes.dart';

class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 100),
          transitionsBuilder: (context, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                end: Offset.zero,
                begin: const Offset(1.0, 0.0),
              ).animate(animation),
              child: child,
            );
          },
        );
}

class NoTransition extends CustomTransitionPage<void> {
  NoTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 0),
          transitionsBuilder: (context, animation, __, child) {
            return child;
          },
        );
}

final _rootKey = GlobalKey<NavigatorState>();

final _homeShellNavigatorKey = GlobalKey<NavigatorState>();
final _searchShellNavigatorKey = GlobalKey<NavigatorState>();
final _chatShellNavigatorKey = GlobalKey<NavigatorState>();
final _meShellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
    navigatorKey: _rootKey,
    initialLocation: WELCOME_ROUTE,
    routerNeglect: true,
    // redirect: (context, state) async {
    //   bool isGuest = sl.get<UserSessionBloc>().state.mapOrNull(
    //         success: (value) {
    //           return value.userSession.isGuestUser;
    //         },
    //       ) ??
    //       false;
    //   log("here:$isGuest");
    //   // bool isGuest =
    //   //     (await SecureStorageMixin().getValue(SecureStorageKeys.isGuest)) ==
    //   //         "true";
    //   if (isGuest) {
    //     if (state.matchedLocation != SPLASH_ROUTE &&
    //         state.matchedLocation != REGISTER_ROUTE &&
    //         state.matchedLocation != ON_BOARDING_ROUTE &&
    //         state.matchedLocation != WELCOME_ROUTE &&
    //         state.matchedLocation != FORGOT_PASSWORD_ROUTE &&
    //         state.matchedLocation != OTP_VERIFICATION_ROUTE &&
    //         state.matchedLocation != RESET_PASSWORD_ROUTE &&
    //         state.matchedLocation != HOME_ROUTE &&
    //         state.matchedLocation != SEARCH_ROUTE) {
    //       return WELCOME_ROUTE;
    //     }
    //   }

    //   return null;
    // },
    // redirect: (context, state) async {
    //   context.read<AppBloc>().state.whenOrNull(
    //     clearedSession: () {
    //       return SPLASH_ROUTE;
    //     },
    //   );s
    //   if (state.matchedLocation == SPLASH_ROUTE ||
    //       state.matchedLocation == ON_BOARDING_ROUTE ||
    //       state.matchedLocation == FORGOT_PASSWORD_ROUTE ||
    //       state.matchedLocation == OTP_VERIFICATION_ROUTE ||
    //       state.matchedLocation == RESET_PASSWORD_ROUTE) {
    //     return null;
    //   }
    //   final bool isLoginPage = state.matchedLocation == LOGIN_ROUTE ||
    //       state.matchedLocation == REGISTER_ROUTE;
    //   return null;
    // },
    routes: [
      GoRoute(
        path: SPLASH_ROUTE,
        pageBuilder: (context, state) {
          return MaterialPage(key: state.pageKey, child: const SplashScreen());
        },
      ),
      GoRoute(
        path: WELCOME_ROUTE,
        pageBuilder: (context, state) {
          return MaterialPage(key: state.pageKey, child: const WelcomeScreen());
        },
      ),
      GoRoute(
        path: LOGIN_ROUTE,
        pageBuilder: (context, state) {
          return MaterialPage(key: state.pageKey, child: const LoginScreen());
        },
      ),
      GoRoute(
        path: REGISTER_ROUTE,
        pageBuilder: (context, state) {
          return MaterialPage(
              key: state.pageKey, child: const RegisterScreen());
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeWrapperWidget(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(navigatorKey: _homeShellNavigatorKey, routes: [
            GoRoute(
              path: HOME_ROUTE,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    key: state.pageKey,
                    child:
                        const KeepAlive(keepAlive: true, child: FeedScreen()));
              },
            ),
          ]),
          StatefulShellBranch(navigatorKey: _searchShellNavigatorKey, routes: [
            GoRoute(
              path: TALES_ROUTE,
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                    child: KeepAlive(keepAlive: true, child: TalesScreen()));
              },
            ),
          ]),
        ],
      ),
    ]);
