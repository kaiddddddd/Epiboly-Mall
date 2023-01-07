import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:underline_indicator/underline_indicator.dart';

class NewsPage extends BasePage {
  @override
  BaseState createState() {
    return _NewsPageState();
  }
}

class _NewsPageState extends BaseState with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List tabs = ["推荐", "要闻", "国内", "国际", "财经", "娱乐", "体育", "军事", "科技", "时尚"];

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
  MyTitle pageTitle() {
    return MyTitle(
      title: '资讯',
      bgColor: Colors.white,
    );
  }

  @override
  Widget pageBody(BuildContext context) {
    return Column(
      children: [
        _buildTab(),
        SizedBox(height: 20),
        _buildNewsList(),
      ],
    );
  }

  Widget _buildTab() {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        indicator: UnderlineIndicator(
          strokeCap: StrokeCap.round,
          borderSide: BorderSide(
            color: Color(0xffea574b),
            width: 6,
          ),
          insets: EdgeInsets.only(left: 10, right: 10),
        ),
        isScrollable: true,
        unselectedLabelColor: Colors.black,
        labelColor: Colors.black,
        tabs: tabs
            .map((e) => Container(
                  child: Tab(
                    text: e,
                    height: 34,
                  ),
                ))
            .toList(),
      ),
    );
  }

  _buildNewsList() {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(index);
        }, separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 12, color: Colors.transparent);
        },
      ),
    );
  }

  Widget _buildItem(int index) {
    double itemWidth = (ScreenUtil().screenWidth - 16 * 2 - 7 * 2) / 3;
    double itemHeight = itemWidth * 0.78;

    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      color: Color(0xfff5f5f5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("中国抛售美债，接连反击后，美终于着急了，美财长与秦刚紧急会晤", style: TextStyle(fontSize: 16)),
          Row(
            children: [
              Image.network(
                "http://cms-bucket.ws.126.net/2023/0107/42fc1c54p00ro3vbo000tc0009c0070c.png?imageView&thumbnail=140y88&quality=85",
                width: itemWidth,
                height: itemHeight,
              ),
              SizedBox(width: 7),
              Image.network(
                "http://cms-bucket.ws.126.net/2023/0107/3ecd7023p00ro3mn10023c000hs00a0c.png?imageView&thumbnail=140y88&quality=85",
                width: itemWidth,
                height: itemHeight,
              ),
              SizedBox(width: 7),
              Image.network(
                "http://cms-bucket.ws.126.net/2023/0107/a923e754p00ro3rt4001cc0009c0070c.png?imageView&thumbnail=140y88&quality=85",
                width: itemWidth,
                height: itemHeight,
              ),
            ],
          ),
          Text("新观察4天前", style: TextStyle(fontSize: 12, color: Color(0xff999999))),
        ],
      ),
    );
  }
}
