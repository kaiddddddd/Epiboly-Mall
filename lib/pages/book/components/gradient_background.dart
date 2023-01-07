import 'package:flutter/material.dart';

// author：kd
// describe：

class GradientBackground extends StatelessWidget {
  final List<Color>? colors;

  GradientBackground({this.colors});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        width: double.infinity,
        height: 400,
        // 从上到下渐变
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: colors ??
                [
                  Color(0xFF5190f7),
                  Color(0xFFf5f5f5),
                ],
          ),
        ),
      ),
    );
  }
}
