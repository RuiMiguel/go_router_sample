import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({
    this.editable = false,
    super.key,
  });

  final bool editable;

  @override
  Widget build(BuildContext context) {
    return editable
        ? const Center(
            child: Text('Edit password'),
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('RESET PASSWORD'),
              centerTitle: true,
            ),
            body: Container(),
          );
  }
}
