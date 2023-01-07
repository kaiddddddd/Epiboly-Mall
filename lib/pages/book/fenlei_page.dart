import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:underline_indicator/underline_indicator.dart';

import '../../styles/colors.dart';
import 'components/book_item.dart';
import 'components/select_button.dart';

class FenLeiPage extends BasePage {
  @override
  BaseState<BasePage> createState() {
    return _FenLeiPageState();
  }
}

class _FenLeiPageState extends BaseState with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List tabs = ["男生", "女生"];

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
      title: '阅读小说',
    );
  }

  @override
  pageBody(BuildContext context) {
    return Container(
      color: AppColors.primaryBackground,
      child: Column(
        children: [
          _buildTab(),
          SizedBox(height: 10),
          SelectButton(["连载中", "完结"]),
          SizedBox(height: 10),
          SelectButton(["玄幻", "都市", "历史", "军事", "科幻", "网游", "悬疑", "恐怖", "同人"]),
          _buildBookList(),
        ],
      ),
    );
  }

  Widget _buildTab() {
    return TabBar(
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
                child: Tab(
                  text: e,
                  height: 34,
                ),
              ))
          .toList(),
    );
  }

  _buildBookList() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 4,
        itemBuilder: (context, index) {
          return BookItem(
            isDesc: true,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(height: 12, color: Colors.transparent);
        },
      ),
    );
  }
}
