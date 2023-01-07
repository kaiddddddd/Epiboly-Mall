import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RechargeCenterPage extends BasePage {
  @override
  BaseState<BasePage> createState() {
    return _RechargeCenterPageState();
  }
}

class _RechargeCenterPageState extends BaseState {
  @override
  MyTitle pageTitle() {
    return MyTitle(
      title: '充值中心',
    );
  }

  @override
  Widget pageBody(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
