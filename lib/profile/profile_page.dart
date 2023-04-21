import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to reset password'),
          onPressed: () => context.push('/profile/resetPassword?editable=true'),
        ),
      ),
    );
  }
}
