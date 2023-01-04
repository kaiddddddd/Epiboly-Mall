import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../components/title_bar.dart';

class WaiMaiPage extends BasePage {
  @override
  BaseState createState() {
    return _WaiMaiPageState();
  }
}

class _WaiMaiPageState extends BaseState {
  @override
  MyTitle pageTitle() {
    return MyTitle(
      title: '外卖优惠券',
      bgColor: Colors.transparent,
    );
  }

  @override
  Widget pageBody(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 20),
          Image.asset(
            'assets/images/activity/wm_top.png',
            width: 200,
            height: 200,
          ),
          _buildBottom(),
        ],
      ),
    );
  }

  _buildBottom() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.only(left: 20, right: 20, top: 32, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Column(
        children: [
          _buildProcess(),
          SizedBox(height: 26),
          _buildCoupon(),
        ],
      ),
    );
  }

  _buildProcess() {
    return Container(
      margin: EdgeInsets.only(bottom: 20,top: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildProcessItem('assets/images/activity/dc1.png', '先领券'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Image.asset("assets/images/activity/process_arrow.png", width: 20),
          ),
          _buildProcessItem('assets/images/activity/dc2.png', '在下单'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Image.asset("assets/images/activity/process_arrow.png", width: 20),
          ),
          _buildProcessItem('assets/images/activity/dc3.png', '拿返利'),
        ],
      ),
    );
  }

  _buildProcessItem(String img, String title) {
    return Column(
      children: [
        Image.asset(
          img,
          width: 40,
          height: 40,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }

  _buildCoupon() {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      alignment: Alignment.center,
      height: 186,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/activity/wm_bg.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      padding: EdgeInsets.only(top: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 1, vertical: 4),
                decoration: BoxDecoration(
                  color: Color(0xfffceceb),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "最\n高",
                  style: TextStyle(fontSize: 12, color: Color(0xFFFD4841)),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "88",
                style: TextStyle(fontSize: 28, color: Color(0xFFFD4841)),
              ),
              Text(
                "元",
                style: TextStyle(fontSize: 28, color: Color(0xFF939393)),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            child: Text("免费领取",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                )),
          ),
        ],
      ),
    );
  }
}
