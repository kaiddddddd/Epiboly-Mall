import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../book/components/gradient_background.dart';

class BalancePagePage extends BasePage {
  @override
  BaseState<BasePage> createState() {
    return _KbBalancePagePageState();
  }
}

class _KbBalancePagePageState extends BaseState {
  @override
  rootView(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.primaryBackground,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              GradientBackground(
                colors: [
                  Color(0xff1e1a2e),
                  Color(0xFFf5f5f5),
                ],
              ),
              Column(
                children: [
                  MyTitle(
                    title: '余额',
                    theme: TitleTheme.white,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: _buildBalance(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildBalance() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 28, bottom: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Text("K币余额: 0个", style: TextStyle(fontSize: 16, color: Color(0xff333333))),
          SizedBox(height: 7),
          Text("K币可用于解锁付费剧集", style: TextStyle(fontSize: 14, color: Color(0xff8E8E8E))),
          SizedBox(height: 25),
          _buildButton()
        ],
      ),
    );
  }

  _buildButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 200,
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: Color(0xffea574b),
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: Text("充值",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
      ),
    );
  }
}
