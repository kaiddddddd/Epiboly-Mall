import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:MallApp/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectCommodityPage extends BasePage {
  @override
  BaseState createState() {
    return _SelectCommodityPageState();
  }
}

class _SelectCommodityPageState extends BaseState with SingleTickerProviderStateMixin {
  int selectIndex = -1;

  @override
  MyTitle pageTitle() {
    return MyTitle(
      title: '选择商品',
    );
  }

  @override
  Widget pageBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _buildGoodList()),
        _buildBottomBar(),
      ],
    );
  }

  _buildGoodList() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
              ),
              child: Text("值得购推广", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            SizedBox(height: 10),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: 6,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(height: 12, color: Colors.transparent);
              },
              itemBuilder: (BuildContext context, int index) {
                return _buildItem(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildBottomBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text("所需金额", style: TextStyle(color: Colors.black, fontSize: 14)),
              SizedBox(height: 10),
              Text("0.00", style: TextStyle(color: AppColors.priceColor, fontSize: 16)),
              SizedBox(height: 10),
            ],
          ),
          TextButton(
              onPressed: () {},
              child: Text("确定", style: TextStyle(color: Colors.white, fontSize: 16)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 60, vertical: 10)),
              )),
        ],
      ),
    );
  }

  _buildItem(index) {
    bool isSelect = selectIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (index == selectIndex) {
            selectIndex = -1;
          } else {
            selectIndex = index;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        alignment: Alignment.center,
        child: Row(
          children: [
            isSelect
                ? Image.asset("assets/images/goods/check_on.png", width: 20)
                : Image.asset("assets/images/goods/check_off.png", width: 20),
            SizedBox(width: 10),
            ClipRRect(
                child: Image.asset("assets/images/home/test4.png", width: 80), borderRadius: BorderRadius.circular(10)),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("酒芝靈是「騰泰堂」鹿角靈芝系列產品之一，成份是鹿角靈芝及", style: TextStyle(fontSize: 14, color: Colors.black)),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("￥9999.00", style: TextStyle(fontSize: 14, color: AppColors.priceColor)),
                      Text("销量2343", style: TextStyle(fontSize: 14, color: Color(0xFFB7B7B7))),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
