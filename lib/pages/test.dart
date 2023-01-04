import 'package:MallApp/base/base_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MallApp/components/title_bar.dart';

class TestPage extends BasePage {
  @override
  BaseState createState() {
    return _TestPageState();
  }
}

class _TestPageState extends BaseState {
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
