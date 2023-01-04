import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/title_bar.dart';
import '../../styles/colors.dart';
import '../main/components/goods_list.dart';

/// 折扣专区
class DiscountPage extends StatefulWidget {
  const DiscountPage({Key? key}) : super(key: key);

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  List<Map<String, dynamic>> _couponData = [
    {
      "use": false,
      "value": "10",
      "desc": "满199使用",
    },
    {
      "use": false,
      "value": "30",
      "desc": "满399使用",
    },
    {
      "use": false,
      "value": "50",
      "desc": "满599使用",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        // 背景图片
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/activity/bg_pinpai.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyTitle(bgColor: Colors.transparent),
              SizedBox(height: 200),
              _buildCouponList(),
              Padding(
                padding: EdgeInsets.all(16),
                child: GoodsList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildCouponList() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xfff5d3d1),
            borderRadius: BorderRadius.circular(20),
            //边框
            border: Border.all(width: 12, color: Color(0xfff5d3d1)),
          ),
          child: Container(
            height: 190,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: _couponData.length,
              separatorBuilder: (BuildContext context, int index) {
                return VerticalDivider(
                  width: 2,
                  indent: 50,
                  endIndent: 50,
                  color: Color(0xFFE6E6E6),
                );
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return _buildCouponItem(index);
              },
            ),
          ),
        ),
        Positioned(
          child: Container(
            alignment: Alignment.center,
            child: Container(
              width: 183,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/activity/title.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text("先领券 在购物", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        )
      ],
    );
  }

  _buildCouponItem(int index) {
    var item = _couponData[index];
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  "¥",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              Text(
                "${item['value']}",
                style: TextStyle(
                  fontSize: 52,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Text(
            item['desc'],
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF8E8E8E),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.purple,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "立即领取",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
