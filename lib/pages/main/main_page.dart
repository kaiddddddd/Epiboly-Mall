import 'package:MallApp/pages/commission/back_commission.dart';
import 'package:MallApp/pages/main/components/my_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../components/keep_alive_wrapper.dart';
import '../../utils/my_navigator.dart';
import '../find/find_page.dart';
import '../home/home_page.dart';
import '../my/my_page.dart';
import 'store/main_provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    hideScreen();
  }

  ///hide your splash screen
  Future<void> hideScreen() async {
    Future.delayed(Duration(milliseconds: 750), () {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final mainState = Provider.of<MainProvider>(context, listen: false);
    // 保存 ctx
    MyNavigator.ctx = context;

    /// 根据iphone X 高度适配,高度去掉 顶部、底部
    return ScreenUtilInit(
      designSize: Size(375, 812 - 44 - 34),
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: Color(0xfffefefe),
          bottomNavigationBar: MyBottomNavigationBar(onTap: (index) {
            mainState.tabBarPageController.jumpToPage(index);
            setState(() {
              mainState.setTabBarSelectedIndex = index;
            });
          }),
          body: PageView(
            controller: mainState.tabBarPageController,
            children: <Widget>[
              KeepAliveWrapper(child: HomePage()),
              KeepAliveWrapper(child: BackCommissionPage()),
              KeepAliveWrapper(child: FindPage()),
              KeepAliveWrapper(child: MyPage()),
            ],
            physics: NeverScrollableScrollPhysics(),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
