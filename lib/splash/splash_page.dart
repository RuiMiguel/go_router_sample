import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_sample/app/cubit/auth_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future<void>.delayed(const Duration(seconds: 3));
      cubit.logOut();
    });

    return const Scaffold(
      body: Center(
        child: Text('SPLASH LOADING...'),
      ),
    );
  }
}
