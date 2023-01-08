import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/button.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:MallApp/utils/my_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../book/components/gradient_background.dart';
import 'marke_advertise_page.dart';

class MarkeCenterPage extends BasePage {
  @override
  BaseState createState() {
    return _MarkeCenterPageState();
  }
}

class _MarkeCenterPageState extends BaseState {
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
                  Color(0xffe9574c),
                  Color(0xFFf5f5f5),
                ],
              ),
              Column(
                children: [
                  MyTitle(
                    title: '营销中心',
                    theme: TitleTheme.white,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Column(
                      children: [
                        _buildMyValue(),
                        SizedBox(height: 10),
                        _buildStep(),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildMyValue() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '我的营销值（点）',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '0',
                style: TextStyle(fontSize: 28, color: Colors.black),
              ),
            ],
          ),
          TextButton(
              onPressed: () {},
              child: Text("去充值", style: TextStyle(color: Colors.white, fontSize: 16)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.red),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(Size(100, 32)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 20, vertical: 0)),
              )),
        ],
      ),
    );
  }

  _buildStep() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          Text(
            '值得购资源位',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '低门槛投放',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              Text(
                '低推广成本',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              Text(
                '广告持续在线',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFE6E6E6), width: 1),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              children: [
                Text("简单3步，轻松投放"),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/find/35.png',
                          width: 68,
                          height: 147,
                        ),
                        SizedBox(height: 10),
                        Text(
                          '1.注册账号',
                          style: TextStyle(fontSize: 14, color: Color(0xFF8E8E8E)),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/find/35_1.png',
                          width: 68,
                          height: 147,
                        ),
                        SizedBox(height: 10),
                        Text(
                          '2.充值营销值',
                          style: TextStyle(fontSize: 14, color: Color(0xFF8E8E8E)),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/find/35_2.png',
                          width: 68,
                          height: 147,
                        ),
                        SizedBox(height: 10),
                        Text(
                          '3.投放广告',
                          style: TextStyle(fontSize: 14, color: Color(0xFF8E8E8E)),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          BottomButton(
              handleOk: () {
                MyNavigator.push(AdvertisePage());
              },
              text: "立即投放")
        ],
      ),
    );
  }
}
