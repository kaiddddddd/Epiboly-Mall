import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/card_container_horizontal.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:MallApp/pages/book/my_consume_page.dart';
import 'package:MallApp/pages/book/my_read_page.dart';
import 'package:MallApp/pages/book/my_recharge_page.dart';
import 'package:MallApp/pages/book/recharge_center_page.dart';
import 'package:MallApp/styles/colors.dart';
import 'package:MallApp/utils/my_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/white_button.dart';

class MyMainPage extends BasePage {
  @override
  BaseState<BasePage> createState() {
    return _MyMainPageState();
  }
}

class _MyMainPageState extends BaseState {
  @override
  MyTitle pageTitle() {
    return MyTitle(
      title: '阅读小说',
    );
  }

  @override
  Widget pageBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 25),
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage("https://pica.zhimg.com/80/v2-16c490e9238880432a9797750625f926_1440w.webp"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12),
              Text(
                "书友09903",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "账户余额",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "0书币+0书券",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                RoundedButton(
                  text: "去充值",
                  height: 31,
                  textColor: AppColors.blue,
                  onPressed: () {
                    MyNavigator.push(RechargeCenterPage());
                  },
                )
              ],
            ),
          ),
          _buildMenuList(),
        ],
      ),
    );
  }

  _buildMenuList() {
    return Container(
      margin: EdgeInsets.only(top: 28),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          _buildMenuItem(
            icon: "assets/images/book/my1.png",
            title: "充值记录",
            onPressed: () {
              MyNavigator.push(MyRechargePage());
            },
          ),
          _buildMenuItem(
            icon: "assets/images/book/my2.png",
            title: "消费记录",
            onPressed: () {
              MyNavigator.push(MyConsumePage());
            },
          ),
          _buildMenuItem(
            icon: "assets/images/book/my3.png",
            title: "阅读记录",
            onPressed: () {
              MyNavigator.push(MyReadHistoryPage(type: RecordType.read));
            },
          ),
          _buildMenuItem(
            icon: "assets/images/book/my4.png",
            title: "订阅管理",
            onPressed: () {
              MyNavigator.push(MyReadHistoryPage(type: RecordType.subscribe));
            },
          ),
          _buildMenuItem(
            icon: "assets/images/book/my5.png",
            title: "用户 ID",
            value: "123456789",
          ),
        ],
      ),
    );
  }

  _buildMenuItem({required String icon, required String title, String? value, onPressed}) {
    return CardContainerHorizontal(
      label: title,
      leftIcon: Image.asset(
        icon,
        width: 24,
        height: 23,
      ),
      content: value != null
          ? Row(children: [
              Spacer(),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ])
          : null,
      rightIcon: onPressed != null
          ? Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.gray,
            )
          : null,
      onPressed: onPressed,
    );
  }
}
