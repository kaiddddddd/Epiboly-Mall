import 'package:MallApp/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/title_bar.dart';

class TurntablePage extends StatelessWidget {
  const TurntablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(

        // 背景图片
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/activity/bg_zhuanpan.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyTitle(
              title: '内购专区',
              bgColor: Colors.transparent,
              theme: TitleTheme.white,
            ),
            _buildDescription()
          ],
        ),
      ),
    );
  }

  _buildDescription() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // 4圆角
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: Text("抽奖说明", style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
          SizedBox(height: 10),
          Text(
            "1.每天可抽奖一次、2.抽奖结果以系统为准、3.奖品将在活动结束后7个工作日内发放、1.每天可抽奖一次、2.抽奖结果以系统为准、3.奖品将在活动结束后7个工作日内发放、1.每天可抽奖一次、2.抽奖结果以系统为准、3.奖品将在活动结束后7个工作日内发放、",
            style: TextStyle(color: Color(0xFF4E4E4E), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
