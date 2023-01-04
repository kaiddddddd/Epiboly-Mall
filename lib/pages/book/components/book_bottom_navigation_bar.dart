import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../store/book_provider.dart';

// tabBar数据B
const List<Map<String, String>> _tabBarData = [
  {
    "title": "书架",
    "image": "assets/images/book/tab1_off.png",
    "selectedImage": "assets/images/book/tab1_on.png",
  },
  {
    "title": "书城",
    "image": "assets/images/book/tab2_off.png",
    "selectedImage": "assets/images/book/tab2_on.png",
  },
  {
    "title": "分类",
    "image": "assets/images/book/tab3_off.png",
    "selectedImage": "assets/images/book/tab3_on.png",
  },
  {
    "title": "我的",
    "image": "assets/images/book/tab4_off.png",
    "selectedImage": "assets/images/book/tab4_on.png",
  }
];

class BookBottomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onTap;

  BookBottomNavigationBar({required this.onTap});

  @override
  Widget build(BuildContext context) {
    /// 底部tabar 统一设置为 56 + 全面屏底部安全距离
    final bottomBarHeight = 56 + MediaQuery.of(context).padding.bottom + (Platform.isAndroid ? 2 : 0);
    return SizedBox(
      height: bottomBarHeight,
      child: _getBottomNavigationBar(context),
    );
  }

  /// bottomNavBar
  _getBottomNavigationBar(BuildContext context) {
    return Stack(
      children: <Widget>[
        Selector<BookProvider, int>(
            builder: (_, index, __) {
              return BottomNavigationBar(
                currentIndex: index,
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 10,
                unselectedFontSize: 10,
                unselectedItemColor: Color(0xff999999),
                selectedItemColor: Color(0xFF424242),
                backgroundColor: Color(0xfffefefe),
                elevation: 0,
                onTap: this.onTap,
                items: _getTabBar(context),
                // 水平排列
              );
            },
            selector: (_, model) => model.getTabBarSelectedIndex),
        Divider(
          height: 0.5,
          color: Color(0xffdfdfdf),
        ),
      ],
    );
  }
  // 8B63E6  9B9B9B

  List<BottomNavigationBarItem> _getTabBar(BuildContext context) {
    return _tabBarData.map((item) {
      return _getBottomBarItem(
          item["title"], item["image"], item["selectedImage"], context);
    }).toList();
  }

  BottomNavigationBarItem _getBottomBarItem(String? title, String? image, String? selectedImage, BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    final _tabBarIconWidth = _screenWidth / _tabBarData.length;
    const _tabBarIconHeight = 22.0;

    return BottomNavigationBarItem(
        icon: Container(
          child: Stack(
            children: <Widget>[
              Image.asset(
                image!,
                width: _tabBarIconWidth,
                height: _tabBarIconHeight,
              ),
            ],
          ),
        ),
        activeIcon: Image.asset(
          selectedImage!,
          width: _tabBarIconWidth,
          height: _tabBarIconHeight,
        ),
        label: title);
  }

}
