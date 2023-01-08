import 'package:MallApp/styles/colors.dart';
import 'package:MallApp/utils/my_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/icon.dart';
import 'my_order_page.dart';

class MyPage extends StatelessWidget {
  var screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        color: AppColors.primaryBackground,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/images/my/bg1.png'), fit: BoxFit.cover)),
              ),
            ),
            Column(
              children: [
                _buildTop(),
                _buildVip(),
                _buildMyOrder(),
                SizedBox(height: 16),
                _buildCommission(),
                SizedBox(height: 16),
                _buildMyFunction(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return Stack(
      children: [
        Row(
          children: [
            // 圆形头像
            Container(
              margin: EdgeInsets.only(left: 30, top: 103),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                // 边框
                border: Border.all(color: Color(0xffffdfda), width: 8),
                image: DecorationImage(image: AssetImage('assets/images/my/avatar.png'), fit: BoxFit.cover),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 103, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "腾泰堂终极用户",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.fromLTRB(12, 3, 12, 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      'assets/images/my/vip.png',
                      width: 61,
                      height: 19,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          right: 20,
          top: 50,
          child: BackgroundIcon('assets/images/my/page1.png'),
        ),
      ],
    );
  }

  Widget _buildVip() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 16, right: 16),
      width: double.infinity,
      padding: EdgeInsets.only(left: 31, top: 8, right: 31, bottom: 20),
      decoration: BoxDecoration(
        color: Color(0xFFA4A7DE),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(37),
          topRight: Radius.circular(37),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/my/page3.png',
                width: 30,
                height: 30,
              ),
              SizedBox(width: 3),
              Text("VIP", style: TextStyle(color: Colors.white, fontSize: 24))
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: Color(0xFFb3b6e4),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "提升用户等级,解锁更多权益",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 4),
                  Text(
                    "激活粉丝返佣及阅读值加成权益",
                    style: TextStyle(color: Color(0xFFE8E8E8), fontSize: 12),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFB6F69),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                child: Center(
                  child: Text(
                    "去解锁",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMyOrder() {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "我的订单",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMyOrderItem(
                  "assets/images/my/order1.png",
                  "待付款",
                  () => {
                        MyNavigator.push(MyOrderPage(
                          orderStatus: "1",
                        ))
                      }),
              _buildMyOrderItem(
                  "assets/images/my/order2.png",
                  "待发货",
                  () => {
                        MyNavigator.push(MyOrderPage(
                          orderStatus: "2",
                        ))
                      }),
              _buildMyOrderItem(
                  "assets/images/my/order3.png",
                  "待收货",
                  () => {
                        MyNavigator.push(MyOrderPage(
                          orderStatus: "3",
                        ))
                      }),
              _buildMyOrderItem(
                  "assets/images/my/order4.png",
                  "我的售后",
                  () => {
                        MyNavigator.push(MyOrderPage(
                          orderStatus: "4",
                        ))
                      }),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMyOrderItem(String img, String title, Function() onTap) {
    int padding = 16;
    int space = 8;
    var widget = (screenWidth - padding * 2 - space * 3) / 4;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: widget,
        padding: EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
          // 圆角22
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2, //阴影范围
              spreadRadius: 4, //阴影浓度
              color: Color(0xFFFBFBFB), //阴影颜色
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              img,
              width: 52,
              height: 52,
            ),
            SizedBox(height: 16),
            Text(title)
          ],
        ),
      ),
    );
  }

  Widget _buildCommission() {
    return Container(
      padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "购物返佣",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMyCommissionItem("assets/images/my/shop1.png", "我的收益", () => {}),
              _buildMyCommissionItem("assets/images/my/shop2.png", "订单明细", () => {}),
              _buildMyCommissionItem("assets/images/my/shop3.png", "收益排行", () => {}),
              _buildMyCommissionItem("assets/images/my/shop4.png", "云发单", () => {}),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMyCommissionItem(String img, String title, Function() onTap) {
    int padding = 16;
    int space = 8;
    var widget = (screenWidth - padding * 2 - space * 3) / 4;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: widget,
        child: Column(
          children: [
            Image.asset(
              img,
              width: 32,
              height: 32,
            ),
            SizedBox(height: 2),
            Text(title)
          ],
        ),
      ),
    );
  }

  Widget _buildMyFunction() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(26), topRight: Radius.circular(26)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "我的功能",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMyFunctionItem("assets/images/my/gn1.png", "我的会员", () => {}),
              _buildMyFunctionItem("assets/images/my/gn2.png", "分享值", () => {}),
              _buildMyFunctionItem("assets/images/my/gn3.png", "购物值", () => {}),
              _buildMyFunctionItem("assets/images/my/gn4.png", "商品收藏", () => {}),
              _buildMyFunctionItem("assets/images/my/gn5.png", "收货地址", () => {}),
              _buildMyFunctionItem("assets/images/my/gn6.png", "邀请好友", () => {}),
              _buildMyFunctionItem("assets/images/my/gn7.png", "退出登录", () => {}),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMyFunctionItem(String img, String title, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Image.asset(
              img,
              width: 20,
              height: 20,
            ),
            SizedBox(width: 12),
            Text(title),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black)
          ],
        ),
      ),
    );
  }
}
