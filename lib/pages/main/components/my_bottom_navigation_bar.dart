import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../store/main_provider.dart';

// tabBar数据B
const List<Map<String, String>> _tabBarData = [
  {
    "title": "首页",
    "image": "assets/images/home/tab1_off.png",
    "selectedImage": "assets/images/home/tab1_on.png",
  },
  {
    "title": "折扣",
    "image": "assets/images/home/tab2_off.png",
    "selectedImage": "assets/images/home/tab2_on.png",
  },
  {
    "title": "发现",
    "image": "assets/images/home/tab3_off.png",
    "selectedImage": "assets/images/home/tab3_on.png",
  },
  {
    "title": "我的",
    "image": "assets/images/home/tab4_off.png",
    "selectedImage": "assets/images/home/tab4_on.png",
  }
];

class MyBottomNavigationBar extends StatelessWidget {
  final ValueChanged<int> onTap;

  MyBottomNavigationBar({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 22, top: 17, right: 22, bottom: 33),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        // 背景渐变左到右
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFFFFF1F0),
            Color(0xFFFFFFFF),
          ],
        ),
      ),
      child: Selector<MainProvider, int>(
          builder: (_, index, __) {
            return _buildTabBar(index);
          },
          selector: (_, model) => model.getTabBarSelectedIndex),
    );
  }


  Widget _buildTabBar(currentIndex) {
    var index = 0;
    return Container(
      child: Row(
        children: _tabBarData.map((item) {
          return _buildTabBarItem(index++, currentIndex, item["title"], item["image"], item["selectedImage"]);
        }).toList(),
      ),
    );
  }

  Widget _buildTabBarItem(index, currentIndex, title, image, selectedImage) {
    bool isSelect = index == currentIndex;
    print("index=${index}");
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        // 红色背景
        decoration: BoxDecoration(
          color: isSelect ? Color(0xFFFD4841) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(
              isSelect ? selectedImage : image,
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: isSelect ? Colors.white : Color(0xFF8E8E8E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
