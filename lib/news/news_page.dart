import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random().nextInt(100);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Go to detail $random'),
          onPressed: () => context.push('/home/details/$random'),
        ),
      ),
    );
  }
}
