import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:storyv2/layers/presentation/feed/screens/home_screen.dart';

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

final GoRouter router = GoRouter(
    navigatorKey: _rootKey,
    initialLocation: SPLASH_ROUTE,
    routerNeglect: true,
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
      GoRoute(
        path: TEST_ROUTE,
        pageBuilder: (context, state) {
          return MaterialPage(key: state.pageKey, child: const HomeScreen());
          // return MaterialPage(key: state.pageKey, child: const TestScreen());
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
