import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:MallApp/pages/book/components/my_card_view.dart';
import 'package:MallApp/pages/find/select_commodity_page.dart';
import 'package:MallApp/utils/my_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../book/components/gradient_background.dart';

class AdvertisePage extends BasePage {
  @override
  BaseState createState() {
    return _AdvertisePageState();
  }
}

class _AdvertisePageState extends BaseState {
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
                    title: '投放广告',
                    theme: TitleTheme.white,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Column(
                      children: [_buildCardBody()],
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

  _buildCardBody() {
    return MyCardView(
      title: "选择投放广告类型",
      child: Column(
        children: [
          //分割线
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          _buildCardItem("值得购"),
          _buildCardItem("商城热销"),
          _buildCardItem("精选品质"),
        ],
      ),
    );
  }

  _buildCardItem(String title) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                title,
                style: TextStyle(fontSize: 16, color: Color(0xFF969696)),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                MyNavigator.push(SelectCommodityPage());
              },
              child: Text(
                "去投放",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.priceColor),
                minimumSize: MaterialStateProperty.all(Size(80,28)),
                padding: MaterialStateProperty.all(EdgeInsets.only(left: 10, right: 10)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                ),
              )),
        ],
      ),
    );
  }
}
