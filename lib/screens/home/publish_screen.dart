import 'package:flutter/material.dart';

class PublishScreen extends StatelessWidget {
  const PublishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(161, 232, 175, 1),
              Color.fromRGBO(58, 36, 73, 1),
            ],
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
            transform: GradientRotation(130 * 3.1415927 / 180),
          ),
        ),
      ),
    );
  }
}
