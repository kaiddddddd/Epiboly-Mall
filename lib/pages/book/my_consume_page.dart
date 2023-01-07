import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:MallApp/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyConsumePage extends BasePage {
  @override
  BaseState<BasePage> createState() {
    return _MyConsumePageState();
  }
}

class _MyConsumePageState extends BaseState {
  List<Map<String, dynamic>> _data = [
    {
      "title": "支出",
      "time": "2021-08-01 12:00:00",
      "money": "123",
    },
    {
      "title": "购买",
      "time": "2021-08-01 12:00:00",
      "money": "100",
    }
  ];

  @override
  MyTitle pageTitle() {
    return MyTitle(
      title: '消费历史',
    );
  }

  @override
  Widget pageBody(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItem(index);
      },
    );
  }

  Widget _buildItem(int index) {
    var item = _data[index];
    return Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["title"],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  item["time"],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Text(
              "—${item["money"]}",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.red,
              ),
            ),
          ],
        ));
  }
}
