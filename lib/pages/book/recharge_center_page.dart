import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/button.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:MallApp/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/pay_method.dart';
import 'components/my_card_view.dart';

class RechargeCenterPage extends BasePage {
  @override
  BaseState<BasePage> createState() {
    return _RechargeCenterPageState();
  }
}

class _RechargeCenterPageState extends BaseState {
  @override
  MyTitle pageTitle() {
    return MyTitle(
      title: '充值中心',
    );
  }

  @override
  Widget pageBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 14),
            _balance(),
            SizedBox(height: 22),
            _rechargeMoney(),
            SizedBox(height: 18),
            _rechargePayMethod(),
          ],
        ),
      ),
    );
  }

  _balance() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 22),
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "我的书币",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "0",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "我的书券",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "0",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _rechargeMoney() {
    return MyCardView(
      title: "请选择充值金额",
      child: Container(
        child: Wrap(
          runSpacing: 14,
          spacing: 14,
          children: [
            _rechargeMoneyItem(isSelect: true),
            _rechargeMoneyItem(),
            _rechargeMoneyItem(),
            _rechargeMoneyItem(),
          ],
        ),
      ),
    );
  }

  _rechargeMoneyItem({bool isSelect = false}) {
    double itemWidth = (MediaQuery.of(context).size.width - 16 * 2 - 16 * 2 - 14) / 2;
    return Container(
      width: itemWidth,
      child: Stack(
        children: [
          Container(
            width: itemWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: isSelect ? AppColors.recharge_bg : AppColors.white,
                width: 6,
              ),
            ),
            child: Container(
                padding: EdgeInsets.only(top: 14, bottom: 26),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFFCCCCCC),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "充1元",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "100书币+900书币",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "额外送100书券",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.orange,
                      ),
                    ),
                  ],
                )),
          ),
          isSelect
              ? Positioned(
                  child: Image.asset(
                    "assets/images/book/checked.png",
                    width: 12,
                  ),
                  left: 10,
                  top: 10,
                )
              : Container(),
        ],
      ),
    );
  }

  _rechargePayMethod() {
    return MyCardView(
      title: "请选择支付方式",
      child: Container(
        child: Column(
          children: [
            PayMethodSelector(),
            SizedBox(height: 10),
            BottomButton(
              handleOk: () => {},
              text: "立即充值",
              bgColor: Color(0xFFd96152),
            )
          ],
        ),
      ),
    );
  }
}
