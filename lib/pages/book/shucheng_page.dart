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

class ShuChengPage extends BasePage {
  @override
  BaseState<BasePage> createState() {
    return _ShuChengPageState();
  }
}

class _ShuChengPageState extends BaseState with SingleTickerProviderStateMixin {
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
                    theme: TitleTheme.white,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        MySearch(),
                        SizedBox(height: 10),
                        HeadSwiper(
                          bannerList: ['assets/images/book/banner1.png'],
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Column(children: [
                            // 热门推荐
                            _buildHotRecommend(),
                            SizedBox(height: 24),
                            // 排行榜
                            _buildRankingList(),
                          ]),
                        )
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

  _buildHotRecommend() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text("热门推荐", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFf0f3f7),
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.refresh,
                      color: Color(0xff508ef7),
                    ),
                    SizedBox(width: 5),
                    Text("换一换", style: TextStyle(color: Color(0xff508ef7))),
                  ],
                ),
              )
            ],
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("排行榜", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        _buildTab(),
        SizedBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 4,
          itemBuilder: (context, index) {
            return BookItem(
              isDesc: true,
            );
          }, separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 12, color: Colors.transparent);
          },
        ),
      ],
    );
  }

  Widget _buildTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: _tabController,
          indicator: UnderlineIndicator(
            strokeCap: StrokeCap.round,
            borderSide: BorderSide(
              color: Color(0xff508ef7),
              width: 5,
            ),
            insets: EdgeInsets.only(left: 10, right: 10),
          ),
          isScrollable: true,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.black,
          tabs: tabs
              .map((e) => Container(
            child: Tab(text: e,height: 34,),
          ))
              .toList(),
        ),
        // 分割线
        Container(
          height: 1,
          color: Color(0xffe5e5e5),
        )
      ],
    );
  }
}
