import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../utils/Toast.dart';

class InviteFriends extends BasePage {
  @override
  BaseState createState() {
    return _InviteFriendsState();
  }
}

class _InviteFriendsState extends BaseState {
  @override
  Widget? rootView(BuildContext context) {
    return Material(
        child: Stack(
          children: [
          Image.asset(
          "assets/images/my/yaoqing_bg.png",
          fit: BoxFit.cover,
          width: double.infinity,
          height: 550,
        ),
        Positioned(
          bottom: 0,
          top: 0,
          left: 0,
          right: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyTitle(
                bgColor: Colors.transparent,
                theme: TitleTheme.white,
              ),
              _buildBottom()
            ],
          ),
        ),
        Positioned(left: 0, right: 0, top: 50 ,child: _buildTitle())],
    )
    ,
    );
  }

  _buildBottom() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(vertical: 26, horizontal: 36),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, -2),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset("assets/images/my/yaoqing1.png", width: 66, height: 66),
                  SizedBox(height: 12),
                  Text("分享链接", style: TextStyle(fontSize: 14, color: Color(0xFF343434))),
                ],
              ),
              Column(
                children: [
                  Image.asset("assets/images/my/yaoqing2.png", width: 66, height: 66),
                  SizedBox(height: 12),
                  Text("分享海报", style: TextStyle(fontSize: 14, color: Color(0xFF343434))),
                ],
              ),
              Column(
                children: [
                  Image.asset("assets/images/my/yaoqing3.png", width: 66, height: 66),
                  SizedBox(height: 12),
                  Text("保存海报", style: TextStyle(fontSize: 14, color: Color(0xFF343434))),
                ],
              )
            ],
          ),
          SizedBox(height: 16),
          Image.asset("assets/images/my/qrcode.png", width: 133, height: 133),
          SizedBox(height: 26),
          TextButton(
              onPressed: () {
                Toast.show("保存成功");
              },
              child: Text(
                "保存二维码",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.priceColor),
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 36)),
                padding: MaterialStateProperty.all(EdgeInsets.only(left: 10, right: 10)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                ),
              )),
        ],
      ),
    );
  }

  _buildTitle() {
    return Column(
      children: [
        Text("邀请好友", style: TextStyle(fontSize: 26, color: Colors.white,fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text("领取购物优惠券", style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold)),
      ],
    );
  }
}
