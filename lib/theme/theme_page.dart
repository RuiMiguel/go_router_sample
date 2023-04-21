import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Theme section'),
            ElevatedButton(
              child: const Text('Go to modal'),
              onPressed: () => context.push('/theme/modal'),
            ),
          ],
        ),
      ),
    );
  }
}
