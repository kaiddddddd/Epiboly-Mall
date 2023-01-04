import 'package:flutter/material.dart';

import '../styles/colors.dart';

// author：kd
// describe：

class BackgroundContainer extends StatelessWidget {
  final List<Widget> children;
  final String bgAsset;
  final double? bgHeight;

  BackgroundContainer({required this.children, required this.bgAsset, this.bgHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: Material(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.infinity,
                height: bgHeight ?? 500,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage(bgAsset), fit: BoxFit.cover)),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
            )
          ],
        ),
      ),
    );
  }
}
