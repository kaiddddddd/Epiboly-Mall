import 'package:MallApp/pages/book/fenlei_page.dart';
import 'package:MallApp/pages/book/shucheng_page.dart';
import 'package:MallApp/pages/book/shujia_page.dart';
import 'package:MallApp/pages/book/store/book_provider.dart';
import 'package:MallApp/pages/book/wode_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../components/keep_alive_wrapper.dart';
import 'components/book_bottom_navigation_bar.dart';

class BookMainPage extends StatefulWidget {
  const BookMainPage({Key? key}) : super(key: key);

  @override
  State<BookMainPage> createState() => _BookMainPageState();
}

class _BookMainPageState extends State<BookMainPage> {
  @override
  Widget build(BuildContext context) {
    final mainState = Provider.of<BookProvider>(context, listen: false);

    /// 根据iphone X 高度适配,高度去掉 顶部、底部
    return ScreenUtilInit(
      designSize: Size(375, 812 - 44 - 34),
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: Color(0xfffefefe),
          bottomNavigationBar: BookBottomNavigationBar(onTap: (index) {
            mainState.tabBarPageController.jumpToPage(index);
            setState(() {
              mainState.setTabBarSelectedIndex = index;
            });
          }),
          body: PageView(
            controller: mainState.tabBarPageController,
            children: <Widget>[
              KeepAliveWrapper(child: ShuJiaPage()),
              KeepAliveWrapper(child: ShuChengPage()),
              KeepAliveWrapper(child: FenLeiPage()),
              KeepAliveWrapper(child: WoDePage()),
            ],
            physics: NeverScrollableScrollPhysics(),
          ),
        );
      },
    );
  }
}
