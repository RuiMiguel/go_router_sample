import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/app/cubit/auth_cubit.dart';
import 'package:go_router_sample/app/navigation/go_router_observer.dart';
import 'package:go_router_sample/app_settings/app_settings.dart';
import 'package:go_router_sample/details/details_page.dart';
import 'package:go_router_sample/error/error_page.dart';
import 'package:go_router_sample/favorites/favorites_page.dart';
import 'package:go_router_sample/home/home_page.dart';
import 'package:go_router_sample/login/login_page.dart';
import 'package:go_router_sample/news/news_page.dart';
import 'package:go_router_sample/profile/profile_page.dart';
import 'package:go_router_sample/reset_password/reset_password_page.dart';
import 'package:go_router_sample/settings/settings_page.dart';
import 'package:go_router_sample/sign_up/sign_up_page.dart';
import 'package:go_router_sample/splash/splash_page.dart';
import 'package:go_router_sample/theme/modal_page.dart';
import 'package:go_router_sample/theme/theme_page.dart';

class RoutingNavigator {
  static final onBoardingNavigatorKey = GlobalKey<NavigatorState>();
  static final mainNavigatorKey = GlobalKey<NavigatorState>();
  static final homeNavigatorKey = GlobalKey<NavigatorState>();
  static final settingsNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter onBoardingRouter(AuthStatus authStatus) => GoRouter(
        navigatorKey: onBoardingNavigatorKey,
        initialLocation: '/login',
        routes: [
          GoRoute(
            name: 'login',
            path: '/login',
            builder: (context, state) => const LoginPage(),
            redirect: (context, state) {
              if (authStatus == AuthStatus.initial) {
                return '/splash';
              } else {
                return null;
              }
            },
          ),
          GoRoute(
            name: 'splash',
            path: '/splash',
            builder: (context, state) => const SplashPage(),
          ),
          GoRoute(
            name: 'signUp',
            path: '/signUp',
            builder: (context, state) => const SignUpPage(),
          ),
          GoRoute(
            name: 'passwordReset',
            path: '/passwordReset',
            builder: (context, state) => const ResetPasswordPage(),
          ),
        ],
        debugLogDiagnostics: true,
        observers: [GoRouterObserver()],
      );

  static GoRouter mainRouter = GoRouter(
    navigatorKey: mainNavigatorKey,
    initialLocation: '/home',
    routes: [
      ShellRoute(
        navigatorKey: homeNavigatorKey,
        builder: (context, state, child) {
          return HomePage(child: child);
        },
        routes: [
          GoRoute(
            name: 'home',
            path: '/home',
            parentNavigatorKey: homeNavigatorKey,
            builder: (context, state) => const NewsPage(),
            routes: [
              GoRoute(
                name: 'details',
                path: 'details/:id',
                parentNavigatorKey: mainNavigatorKey,
                builder: (context, state) =>
                    DetailsPage(id: state.params['id'] ?? ''),
              ),
            ],
          ),
          GoRoute(
            name: 'favorites',
            path: '/favorites',
            parentNavigatorKey: homeNavigatorKey,
            builder: (context, state) => const FavoritesPage(),
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: settingsNavigatorKey,
        builder: (context, state, child) {
          return SettingsPage(child: child);
        },
        routes: [
          GoRoute(
            name: 'settings',
            path: '/settings',
            parentNavigatorKey: settingsNavigatorKey,
            builder: (context, state) => const AppSettingsPage(),
          ),
          GoRoute(
            name: 'profileEdit',
            path: '/profile',
            parentNavigatorKey: settingsNavigatorKey,
            builder: (context, state) => const ProfilePage(),
            routes: [
              GoRoute(
                name: 'resetPassword',
                path: 'resetPassword',
                builder: (context, state) => ResetPasswordPage(
                  editable: (state.queryParams['editable'] ?? 'false')
                          .toLowerCase() ==
                      'true',
                ),
              ),
            ],
          ),
          GoRoute(
            name: 'themeSetup',
            path: '/theme',
            parentNavigatorKey: settingsNavigatorKey,
            builder: (context, state) => const ThemePage(),
            routes: [
              GoRoute(
                path: 'modal',
                parentNavigatorKey: mainNavigatorKey,
                pageBuilder: (context, state) => const MaterialPage(
                  fullscreenDialog: true,
                  child: ModalPage(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
    debugLogDiagnostics: true,
    observers: [
      GoRouterObserver(),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}
