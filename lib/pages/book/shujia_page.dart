import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/my_search.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:MallApp/pages/book/components/book_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import '../../styles/colors.dart';
import 'components/gradient_background.dart';

class ShuJiaPage extends BasePage {
  @override
  BaseState<BasePage> createState() {
    return _ShuJiaPageState();
  }
}

class _ShuJiaPageState extends BaseState {
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
                        _buildTopBanner(),
                        _buildDescription(),
                        _buildBookList(),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildTopBanner() {
    return Container(
      height: 156,
      padding: EdgeInsets.only(top: 16, bottom: 16, left: 4, right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Swiper(
        autoplay: false,
        autoplayDelay: 5000,
        duration: 750,
        itemBuilder: (BuildContext context, int index) {
          return BookItem(isDesc: true, reversal: true);
        },
        itemCount: 4,
      ),
    );
  }

  _buildDescription() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 6),
            decoration: BoxDecoration(
              color: Color(0xFF3A8EFF),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Image.asset(
              'assets/images/book/hot.png',
              width: 20,
              height: 20,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '都市全能保安意外救下美女总裁，职场逆袭',
            style: TextStyle(
              color: Color(0xFFC4C4C4),
            ),
          ),
        ],
      ),
    );
  }

  _buildBookList() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          MySearch(
            searchBgColor: Color(0xfff6f5f8),
            hint: "请输入商品名称",
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 0.66,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return BookItem(isDesc: false);
            },
            itemCount: 6,
          ),
        ],
      ),
    );
  }
}
