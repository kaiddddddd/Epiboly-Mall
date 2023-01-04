import 'package:MallApp/components/title_bar.dart';
import 'package:MallApp/styles/colors.dart';
import 'package:flutter/material.dart';

import '../components/my_app_bar.dart';

// author：kd
// describe：

abstract class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  //创建状态,由子类实现
  BaseState createState();
}

abstract class BaseState<T extends BasePage> extends State<BasePage> {
  late BuildContext mContext;

  //覆写此方法则覆盖所有主题,pageBody()方法互斥
  @protected
  @factory
  Widget? rootView(BuildContext context) => null;

  //覆写此方法构建页面,rootView()方法互斥
  Widget pageBody(BuildContext context);

  //覆写此方法构建AppBar
  MyTitle? pageTitle() => null;

  @override
  Widget build(BuildContext context) {
    mContext = context;
    return rootView(context) != null
        ? rootView(context)!
        : Scaffold(
            primary: false,
            appBar: EmptyAppBar(),
            body: _buildBody(),
            backgroundColor: AppColors.primaryBackground,
          );
  }

  Widget _buildBody() {
    return Container(
      height: double.infinity,
      child: Column(
        children: [
          pageTitle() ?? Container(),
          pageBody(context),
        ],
      ),
    );
  }
}
