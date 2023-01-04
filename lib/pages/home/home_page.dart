import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/head_swiper.dart';
import '../../components/icon.dart';
import '../../styles/colors.dart';
import '../../utils/my_navigator.dart';
import '../goods/goods_list_page.dart';
import '../main/components/goods_list.dart';

// author：kd
// describe：
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                  SizedBox(height: 12),
                  HeadSwiper(
                    bannerList: [
                      "http://img.alicdn.com/imgextra/i3/115/O1CN01PsvX9s1Cii2Pvi3WM_!!115-0-luban.jpg",
                      "https://gw.alicdn.com/imgextra/i3/43/O1CN01ZPUEId1CBjWPLKzea_!!43-0-lubanu.jpg",
                      "https://gw.alicdn.com/imgextra/i2/41/O1CN01yCNeuw1CAojHBeUyC_!!41-0-lubanu.jpg"
                    ],
                  ),
                  SizedBox(height: 8),
                  _buildNewMessage(),
                  _buildLingZhiMenu(),
                  SizedBox(height: 25),
                  _buildHuodongMenu(),
                  _buildTodayHot(),
                  SizedBox(height: 22),
                  GoodsList(title: "精选商品")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildTopMenu() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Row(
        children: [
          Text(
            "騰泰堂",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Spacer(),
          // 搜索
          Container(
            width: ScreenUtil().screenWidth * 3 / 5 - 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
            child: Image.asset("assets/images/home/search.png", width: 19),
          ),
          SizedBox(width: 12),
          BackgroundIcon('assets/images/home/shop_cart.png'),
        ],
      ),
    );
  }

  //灵芝菜单
  _buildLingZhiMenu() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          _buildLingZhiMenuItem('assets/images/home/home4.png', '騰泰堂自營'),
          SizedBox(width: 12),
          _buildLingZhiMenuItem('assets/images/home/home5.png', '初级灵芝'),
          SizedBox(width: 12),
          _buildLingZhiMenuItem('assets/images/home/home6.png', '中级灵芝'),
          SizedBox(width: 12),
          _buildLingZhiMenuItem('assets/images/home/home7.png', '高级灵芝'),
        ],
      ),
    );
  }

  _buildLingZhiMenuItem(String icon, String title) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Image.asset(
              icon,
              width: 40,
              height: 40,
            ),
            SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _buildHuodongMenu() {
    double height = 230;
    return Container(
      height: height,
      child: Row(
        children: [
          Expanded(
            child: _buildHuodongMenuItem(
              1,
              height,
              'assets/images/home/home1.png',
              '騰泰堂自營',
              '超值性价比值得你来购',
              () => {
                MyNavigator.push(
                  GoodsPage(type: GoodsType.ZHI_DE),
                )
              },
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                _buildHuodongMenuItem(
                  2,
                  (height - 8) / 2,
                  'assets/images/home/home2.png',
                  '商城热销',
                  '商城热销榜',
                  () => {
                    MyNavigator.push(
                      GoodsPage(type: GoodsType.ER_XIAO),
                    )
                  },
                ),
                SizedBox(height: 8),
                _buildHuodongMenuItem(
                  3,
                  (height - 8) / 2,
                  'assets/images/home/home3.png',
                  '精选品质',
                  '精选品质 质量保障',
                  () => {
                    MyNavigator.push(
                      GoodsPage(type: GoodsType.JING_XUAN),
                    )
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHuodongMenuItem(
      int index, double height, String icon, String title, String desc, GestureTapCallback? onTap) {
    Color color;
    switch (index) {
      case 1:
        color = Color(0xFFFBE569);
        break;
      case 2:
        color = Color(0xFFFB6F69);
        break;
      case 3:
        color = Color(0xFFA4A7DE);
        break;
      default:
        color = Color(0xFFFBE569);
    }
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              icon,
              width: index == 1 ? 200 : 190,
            ),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
                  SizedBox(height: 2),
                  Text(desc, style: TextStyle(color: AppColors.primaryGreyText, fontSize: 12)),
                  SizedBox(height: 2),
                  //按钮 Go
                  Container(
                    width: 60,
                    height: 20,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Go",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodayHot() {
    return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "今日爆款",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 86,
                  height: 26,
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.only(left: 12, top: 3),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/home/home8.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Text("每10分钟刷新", style: TextStyle(color: Colors.white, fontSize: 10)),
                ),
                Spacer(),
                Text(
                  "更多",
                  style: TextStyle(color: AppColors.primaryGreyText),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: AppColors.primaryGreyText,
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _buildTodayHotItem();
                },
              ),
            ),
          ],
        ));
  }

  Widget _buildTodayHotItem() {
    return Container(
      width: (ScreenUtil().screenWidth - 16 * 2 - 10 * 2 - 20 * 3) / 4,
      margin: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              'assets/images/home/test1.png',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "灵芝胶囊",
          ),
          SizedBox(height: 4),
          Text(
            "¥ 1000",
            style: TextStyle(color: AppColors.priceColor, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildNewMessage() {
    return Container(
      height: 41,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          SizedBox(width: 4),
          BackgroundIcon("assets/images/home/message.png"),
          SizedBox(width: 2),
          Expanded(
            child: Text(
              "【新品上市】騰泰堂自營",
              style: TextStyle(fontSize: 14, color: Color(0xFF717171)),
            ),
          ),
          SizedBox(width: 10),
          Text(
            "1/12",
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
