import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/button.dart';
import 'package:MallApp/components/pay_method.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:MallApp/pages/book/components/book_item.dart';
import 'package:MallApp/pages/book/my_recharge_page.dart';
import 'package:MallApp/utils/my_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../components/head_swiper.dart';
import '../../components/my_search.dart';
import '../../styles/colors.dart';
import '../book/components/gradient_background.dart';

class TheaterPage extends BasePage {
  @override
  BaseState<BasePage> createState() {
    return _TheaterPageState();
  }
}

class _TheaterPageState extends BaseState {
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
                  Color(0xff1e1a2e),
                  Color(0xFFf5f5f5),
                ],
              ),
              Column(
                children: [
                  MyTitle(
                    title: '小剧场',
                    theme: TitleTheme.white,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Column(
                      children: [
                        MySearch(
                          bgColor: Color(0xfff6f5f8),
                          hint: "请输入商品名称",
                          textColor: Colors.white,
                        ),
                        SizedBox(height: 12),
                        HeadSwiper(
                          bannerList: ['assets/images/book/banner1.png'],
                        ),
                        SizedBox(height: 28),
                        _buildCenterMenu(),
                        SizedBox(height: 28),
                        _buildZhuanQu(),
                        SizedBox(height: 28),
                        _buildAllFilm(),
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

  _buildCenterMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildMenuItem('assets/images/find/theater1.png', "充值记录", () => {MyNavigator.push(MyRechargePage())}),
        _buildMenuItem('assets/images/find/theater2.png', "超值会员", () {
          showMemberDialog();
        }),
        _buildMenuItem('assets/images/find/theater3.png', "币种余额", () => {}),
      ],
    );
  }

  _buildMenuItem(image, title, onTap) {
    double itemWidth = (MediaQuery.of(context).size.width - 32 - 14 * 2) / 3;
    return GestureDetector(
      onTap: onTap,
      child: Expanded(
        child: Container(
          width: itemWidth,
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 24,
                height: 24,
              ),
              SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildZhuanQu() {
    double bookWidth = (MediaQuery.of(context).size.width - 32 - 14) / 3;
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "营销值专区剧场",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "解锁免费好剧",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFA5A5A5),
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              "更多",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.black,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: AppColors.gray,
            ),
          ],
        ),
        SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BookItem(isDesc: false, bookWidth: bookWidth),
            SizedBox(width: 7),
            BookItem(isDesc: false, bookWidth: bookWidth),
            SizedBox(width: 7),
            BookItem(isDesc: false, bookWidth: bookWidth),
          ],
        ),
      ],
    );
  }

  _buildAllFilm() {
    double bookWidth = (MediaQuery.of(context).size.width - 32 - 14) / 3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "全部剧集",
          style: TextStyle(
            fontSize: 18,
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 18),
        Container(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 7,
              mainAxisSpacing: 7,
              childAspectRatio: 0.6,
            ),
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return BookItem(
                isDesc: false,
                bookWidth: bookWidth,
              );
            },
            itemCount: 6,
          ),
        ),
      ],
    );
  }

  _buildMember() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 28, horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("超值会员", style: TextStyle(fontSize: 18, color: AppColors.black, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text("年卡会员可解锁全部付费剧集", style: TextStyle(fontSize: 14, color: Color(0xFFA8A8A8))),
          SizedBox(height: 28),
          Text("充值方式", style: TextStyle(fontSize: 18, color: AppColors.black, fontWeight: FontWeight.bold)),
          PayMethodSelector(),
          SizedBox(height: 20),
          BottomButton(handleOk: () => {}, text: "确认支付￥365.00", bgColor: Color(0xffea574c)),
          SizedBox(height: 12),
          Align(
              alignment: Alignment.center,
              child: Text("温馨提示：虚拟产品不退不换，请谨慎充值", style: TextStyle(fontSize: 12, color: Color(0xFFA58757)))),
        ],
      ),
    );
  }

  void showMemberDialog() {
    SmartDialog.show(
        alignment: Alignment.bottomCenter,
        builder: (context) {
          return _buildMember();
        });
  }
}
