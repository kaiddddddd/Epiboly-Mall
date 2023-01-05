import 'package:flutter/material.dart';

// author：kd
// describe：

class GradientBackground extends StatelessWidget {
  const GradientBackground({Key? key}) : super(key: key);

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
            colors: [
              Color(0xFF5190f7),
              Color(0xFFf5f5f5),
            ],
          ),
        ),
      ),
    );
  }
}
