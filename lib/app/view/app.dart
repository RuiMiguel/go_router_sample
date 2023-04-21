import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_sample/app/cubit/auth_cubit.dart';
import 'package:go_router_sample/app/navigation/router.dart';
import 'package:go_router_sample/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final authStatus = context.select((AuthCubit cubit) => cubit.state.status);

    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: authStatus == AuthStatus.authenticated
          ? RoutingNavigator.mainRouter
          : RoutingNavigator.onBoardingRouter(authStatus),
      title: 'Go router',
    );
  }
}
