import 'package:MallApp/pages/activity/baoyou_page.dart';
import 'package:MallApp/pages/activity/waimai_page.dart';
import 'package:MallApp/pages/commission/store/category_page_provider.dart';
import 'package:MallApp/utils/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/head_swiper.dart';
import '../../components/icon.dart';
import '../../styles/colors.dart';
import '../activity/Internal_purchase_page.dart';
import '../activity/discount_page.dart';
import '../activity/hot_page.dart';
import '../activity/taxi_page.dart';
import '../activity/turntable_page.dart';
import '../main/components/goods_list.dart';
import 'components/category_menu.dart';

// author：kd
// describe：购物返佣

class BackCommissionPage extends StatelessWidget {
  const BackCommissionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CommissionProvider(),
      child: BackCommission(),
    );
  }
}

class BackCommission extends StatefulWidget {
  const BackCommission({Key? key}) : super(key: key);

  @override
  State<BackCommission> createState() => _BackCommissionState();
}

class _BackCommissionState extends State<BackCommission> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.infinity,
                height: 400,
                // 从上到下渐变
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFffdbd9),
                      Color(0xFFf5f5f5),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildTopMenu(),
                  SizedBox(height: 24),
                  CategoryMenu(
                    onTap: (int index) {
                      final comState = Provider.of<CommissionProvider>(context, listen: false);

                      setState(() {
                        comState.setCategorySelectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(height: 12),
                  HeadSwiper(
                    bannerList: [
                      "http://img.alicdn.com/imgextra/i3/115/O1CN01PsvX9s1Cii2Pvi3WM_!!115-0-luban.jpg",
                      "https://gw.alicdn.com/imgextra/i3/43/O1CN01ZPUEId1CBjWPLKzea_!!43-0-lubanu.jpg",
                      "https://gw.alicdn.com/imgextra/i2/41/O1CN01yCNeuw1CAojHBeUyC_!!41-0-lubanu.jpg",
                    ],
                  ),
                  _buildCenterMenu(),
                  SizedBox(height: 24),
                  GoodsList()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildTopMenu() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Row(
        // 底线对齐
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "購物返佣",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 10),
          Text(
            "省心還省錢",
            style: TextStyle(fontSize: 14),
          ),
          Spacer(),
          SizedBox(width: 12),
          BackgroundIcon('assets/images/commission/search.png'),
        ],
      ),
    );
  }

  _buildCenterMenu() {
    return Container(
        margin: EdgeInsets.only(top: 14),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCenterMenuItem(
                  'assets/images/commission/menu1.png',
                  '热卖榜单',
                  () => {MyNavigator.push(HotPage())},
                ),
                SizedBox(width: 12),
                _buildCenterMenuItem(
                  'assets/images/commission/menu2.png',
                  '包邮专场',
                  () => {MyNavigator.push(BaoYouPage())},
                ),
                SizedBox(width: 12),
                _buildCenterMenuItem(
                  'assets/images/commission/menu3.png',
                  '内购清单',
                  () => {MyNavigator.push(InternalPurchasePage())},
                ),
                SizedBox(width: 12),
                _buildCenterMenuItem(
                  'assets/images/commission/menu4.png',
                  '品牌清仓',
                  () => {MyNavigator.push(DiscountPage())},
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCenterMenuItem(
                  'assets/images/commission/menu5.png',
                  '幸运转盘',
                  () => {MyNavigator.push(TurntablePage())},
                ),
                SizedBox(width: 12),
                _buildCenterMenuItem(
                  'assets/images/commission/menu6.png',
                  '购物返现',
                  () => {MyNavigator.push(TurntablePage())},
                ),
                SizedBox(width: 12),
                _buildCenterMenuItem(
                  'assets/images/commission/menu7.png',
                  '打车返利',
                  () => {MyNavigator.push(TaxiPage())},
                ),
                SizedBox(width: 12),
                _buildCenterMenuItem(
                  'assets/images/commission/menu8.png',
                  '外卖优惠券',
                  () => {MyNavigator.push(WaiMaiPage())},
                ),
              ],
            ),
          ],
        ));
  }

  _buildCenterMenuItem(String icon, String title, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 70,
              height: 70,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 14, color: AppColors.primaryGreyText1),
            ),
          ],
        ),
      ),
    );
  }
}
