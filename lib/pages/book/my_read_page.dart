import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/book_item.dart';

enum RecordType {
  read,
  subscribe,
}

class MyReadHistoryPage extends BasePage {

  final RecordType type;


  MyReadHistoryPage({this.type = RecordType.read});

  @override
  BaseState<BasePage> createState() {
    return _MyReadHistoryPageState();
  }
}

class _MyReadHistoryPageState extends BaseState<MyReadHistoryPage> {
  @override
  MyTitle pageTitle() {
    return MyTitle(
      title: '阅读记录',
    );
  }

  @override
  Widget pageBody(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 4,
        itemBuilder: (context, index) {
          return BookItem(
            isDesc: true,
            type: widget.type,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 26,
            color: Colors.transparent,
          );
        },
      ),
    );
  }
}
