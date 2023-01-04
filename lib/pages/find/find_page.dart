import 'package:MallApp/pages/book/book_main.dart';
import 'package:MallApp/utils/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../components/icon.dart';
import '../../styles/colors.dart';
import '../../utils/date_util.dart';

class FindPage extends StatelessWidget {
  const FindPage({Key? key}) : super(key: key);

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
                  _buildTop(),
                  _buildRead(),
                  _buildBottomMenu(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildTop() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Row(
        // 底线对齐
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "发现精彩",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Spacer(),
          BackgroundIcon('assets/images/commission/search.png'),
        ],
      ),
    );
  }

  _buildBottomMenu(context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                _buildBottomMenuItem(1, "资讯", "去阅读", () => {}),
                SizedBox(width: 20),
                _buildBottomMenuItem(2, "小剧场", "去观看", () => {}),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                _buildBottomMenuItem(3, "小说", "去阅读", () => {
                  MyNavigator.push(BookMainPage())
                }),
                SizedBox(width: 20),
                _buildBottomMenuItem(4, "营销中心", "去查看", () => {}),
              ],
            ),
          ],
        ));
  }

  _buildRead() {
    return Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 32, top: 14, right: 32, bottom: 10),
              // 顶部红色圆角
              decoration: BoxDecoration(
                color: Color(0xFFEA776E),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Image.asset(
                      "assets/images/find/read.png",
                      width: 30,
                      height: 30,
                    ),
                  ),
                  SizedBox(width: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("今日阅读", style: TextStyle(color: Colors.white, fontSize: 16)),
                      SizedBox(height: 4),
                      Text(DateUtil.formatDate(DateTime.now(), format: 'yyyy/MM/dd'),
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ],
                  ),
                  Spacer(),
                  Text(
                    "查看明细",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20,right: 16,bottom: 20),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    child: Column(
                      children: [
                        //分数
                        _buildDoughnutChart(),
                        //阅读值
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1, //阴影范围
                                spreadRadius: 2, //阴影浓度
                                color: Color(0x10000000), //阴影颜色
                              ),
                            ],
                          ),
                          child: Text(
                            "阅读值",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        // 看视频参与分佣
                        _buildCommissionItem(
                            "assets/images/find/video.png", "看视频参与分佣", "观看激励视频,获得阅\n读值,参与分佣.", () => {}),
                        // 分割线
                        Container(
                          height: 1,
                          color: Color(0xFFE5E5E5),
                          margin: EdgeInsets.symmetric(vertical: 8),
                        ),
                        // 阅读资讯参与分佣
                        _buildCommissionItem("assets/images/find/news.png", "阅读资讯参与分佣", "阅读资讯,获得阅读值,\n参与分佣.", () => {}),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  _buildBottomMenuItem(index, title, action, onTap) {
    Color background = Color(0xFFe6f4fe);
    switch (index) {
      case 1:
        background = Color(0xFFe6f4fe);
        break;
      case 2:
        background = Color(0xFFd4d6f7);
        break;
      case 3:
        background = Color(0xFFfdf6ce);
        break;
      case 4:
        background = Color(0xFFfaebe8);
        break;
    }

    double itemWidth = (ScreenUtil().screenWidth - 16 * 2 - 16 * 2 - 20) / 2;

    return Container(
      width: itemWidth,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Image.asset(
              "assets/images/find/menu$index.png",
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(90, 30),
              primary: Colors.white,
              onPrimary: Colors.black,
              onSurface: Colors.grey,
              splashFactory: NoSplash.splashFactory,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              shadowColor: Colors.transparent,
            ),
            onPressed: () {
              onTap();
            },
            child: Text(action),
          )
        ],
      ),
    );
  }

  _buildCommissionItem(String icon, String title, String desc, Map Function() onTap) {
    return Container(
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 28,
            height: 28,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              Text(
                desc,
                style: TextStyle(fontSize: 10, color: Color(0xFFAFAFAF)),
              ),
            ],
          ),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(54, 22),
              primary: Color(0xFFEA776E),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              shadowColor: Colors.transparent,
            ),
            onPressed: () {
              onTap();
            },
            child: Text(
              "去观看",
              style: TextStyle(fontSize: 10),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDoughnutChart() {
    return Stack(
      children: [
        Container(
          height: 120,
          child: SfCircularChart(
            tooltipBehavior: TooltipBehavior(
              enable: false,
            ),
            palette: <Color>[
              Color(0xFFEA574B),
              Color(0xFFF5F5F5),
            ],
            series: <CircularSeries>[
              DoughnutSeries<int, String>(
                dataSource: [40, 60],
                xValueMapper: (int data, _) => data.toString(),
                yValueMapper: (int data, _) => data / 100,
                dataLabelSettings: DataLabelSettings(isVisible: false),
                // pointColorMapper: (_MonthStatistics data, _) => data.color,
                innerRadius: "75%",
                radius: "100%",
              )
            ],
          ),
        ),
        Positioned(
          left: 36,
          top: 36,
          child: Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFa4a7da),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              "40",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
