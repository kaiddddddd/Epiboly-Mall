import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class FenLeiPage extends BasePage {
  @override
  BaseState<BasePage> createState() {
    return _FenLeiPageState();
  }
}

class _FenLeiPageState extends BaseState {
  @override
  MyTitle pageTitle() {
    return MyTitle(
      title: '阅读小说',
    );
  }

  @override
  rootView(BuildContext context) {
    return  Material(
      child: Container(
        color: AppColors.primaryBackground,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
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
              ),
              MyTitle(
                title: '内购专区',
              ),
            ],
          ),
        ),
      ),
    );
  }

}
