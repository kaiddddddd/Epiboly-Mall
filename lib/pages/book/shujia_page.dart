import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/my_search.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:MallApp/pages/book/components/book_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:underline_indicator/underline_indicator.dart';

import '../../components/card_container_horizontal.dart';
import '../../components/head_swiper.dart';
import '../../styles/colors.dart';
import 'components/gradient_background.dart';

class ShuJiaPage extends BasePage {
  @override
  BaseState<BasePage> createState() {
    return _ShuJiaPageState();
  }
}

class _ShuJiaPageState extends BaseState with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List tabs = ["男生", "女生", "精选"];

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  rootView(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.primaryBackground,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              GradientBackground(),
              Column(
                children: [
                  MyTitle(
                    title: '阅读小说',
                  ),
                  MySearch(),
                  HeadSwiper(
                    bannerList: [
                      "http://img.alicdn.com/imgextra/i3/115/O1CN01PsvX9s1Cii2Pvi3WM_!!115-0-luban.jpg",
                      "https://gw.alicdn.com/imgextra/i3/43/O1CN01ZPUEId1CBjWPLKzea_!!43-0-lubanu.jpg",
                      "https://gw.alicdn.com/imgextra/i2/41/O1CN01yCNeuw1CAojHBeUyC_!!41-0-lubanu.jpg"
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Column(children: [
                      // 热门推荐
                      _buildHotRecommend(),
                      // 排行榜
                      _buildRankingList(),
                    ]),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildHotRecommend() {
    return Column(
      children: [
        CardContainerHorizontal(
          label: "热门推荐",
          content: Container(
            child: Row(
              children: [
                //换一换 icon
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.refresh,
                    color: Color(0xff508ef7),
                  ),
                ),
                SizedBox(width: 5),
                Text("换一换", style: TextStyle(color: Color(0xff508ef7))),
              ],
            ),
          ),
        ),
        BookItem(
          isDesc: true,
        )
      ],
    );
  }

  _buildRankingList() {
    return Column(
      children: [
        CardContainerHorizontal(label: "排行榜"),
        _buildTab(),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 4,
          itemBuilder: (context, index) {
            return BookItem(
              isDesc: true,
            );
          },
        ),
      ],
    );
  }

  Widget _buildTab() {
    return Container(
      height: 49,
      child: TabBar(
        controller: _tabController,
        indicator: UnderlineIndicator(
          strokeCap: StrokeCap.round,
          borderSide: BorderSide(
            color: Color(0xff508ef7),
            width: 2,
          ),
          insets: EdgeInsets.only(left: 20, right: 20),
        ),
        isScrollable: true,
        unselectedLabelColor: AppColors.primaryGreyText,
        tabs: tabs
            .map((e) => Container(
                  child: Tab(text: e),
                ))
            .toList(),
      ),
    );
  }
}
