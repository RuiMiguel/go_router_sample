import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIGN UP'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: context.pop,
          child: const Text('Go to Login'),
        ),
      ),
    );
  }
}
