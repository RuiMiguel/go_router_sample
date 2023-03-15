import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.push(
                '/home/wrong',
              ),
              child: const Text('Wrong'),
            ),
            ElevatedButton(
              onPressed: () => context.push(
                '/home/detail/vgv',
              ),
              child: const Text('Go to details'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
