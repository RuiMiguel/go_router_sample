import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen - $id'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Details for screen $id'),
      ),
    );
  }
}
