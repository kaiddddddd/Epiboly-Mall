import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShuJiaPage extends BasePage {
  @override
  BaseState<BasePage> createState() {
    return _ShuJiaPageState();
  }
}

class _ShuJiaPageState extends BaseState {
  @override
  MyTitle pageTitle() {
    return MyTitle(
      title: '测试',
    );
  }

  @override
  Widget pageBody(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
