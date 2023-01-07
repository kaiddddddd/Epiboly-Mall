import 'package:flutter/material.dart';

import '../../../styles/colors.dart';

// author：kd
// describe：

class MyCardView extends StatelessWidget {
  final Widget? child;

  final title;

  MyCardView({this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          child ?? Container(),
        ],
      ),
    );
  }
}
