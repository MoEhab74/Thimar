import 'package:flutter/material.dart';

class SplahView extends StatelessWidget {
  const SplahView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/logo.png', width: 140, height: 140),
      ),
    );
  }
}
