import 'package:go_router/go_router.dart';
import 'package:go_router_sample/detail/detail_page.dart';
import 'package:go_router_sample/error/error_page.dart';
import 'package:go_router_sample/home/home_page.dart';
import 'package:go_router_sample/login/login_page.dart';

final GoRouter router = GoRouter(
  errorBuilder: (context, state) => const ErrorPage(),
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: 'root',
      path: '/',
      redirect: (context, state) {
        final userIsNotLoggedIn =
            state.queryParams['logged']?.toLowerCase() != 'true';
        if (userIsNotLoggedIn) {
          return '/login';
        }
        return '/home';
      },
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: 'home',
      path: '/home',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          name: 'detail',
          path: 'detail/:name',
          builder: (context, state) => DetailPage(
            name: state.params['name']!,
          ),
        ),
      ],
    ),
  ],
);
