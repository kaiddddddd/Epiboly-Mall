import 'package:flutter/material.dart';

// author：kd
// describe：

class BackgroundIcon extends StatelessWidget {
  final String asset;

  BackgroundIcon(this.asset);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Image.asset(
          asset,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
