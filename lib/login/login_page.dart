import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/app/cubit/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuthCubit>();
    final authState = cubit.state.status;

    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: cubit.logIn,
            child: const Text('Login'),
          ),
          const SizedBox(height: 5),
          if (authState == AuthStatus.authenticating)
            const CircularProgressIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => context.push('/signUp'),
                child: const Text('Sign Up'),
              ),
              const SizedBox(width: 5),
              ElevatedButton(
                onPressed: () => context.push('/passwordReset'),
                child: const Text('Reset Password'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
