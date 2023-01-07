import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TheaterPage extends BasePage {
  @override
  BaseState<BasePage> createState() {
    return _TheaterPageState();
  }
}

class _TheaterPageState extends BaseState {
  @override
  MyTitle pageTitle() {
    return MyTitle(
      title: '小剧场',
    );
  }

  @override
  Widget pageBody(BuildContext context) {
    return Container(
      color: Colors.blue,
    );
  }
}
