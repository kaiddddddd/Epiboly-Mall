import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:MallApp/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRechargePage extends BasePage {
  @override
  BaseState<BasePage> createState() {
    return _MyRechargePageState();
  }
}

class _MyRechargePageState extends BaseState {

  List<Map<String, dynamic>> _data = [
    {
      "title": "充值",
      "time": "2021-08-01 12:00:00",
      "money": "100",
      "status": "充值成功",
    },
    {
      "title": "充值",
      "time": "2021-08-01 12:00:00",
      "money": "100",
      "status": "充值成功",
    },
    {
      "title": "充值",
      "time": "2021-08-01 12:00:00",
      "money": "100",
      "status": "充值成功",
    },
  ];

  @override
  MyTitle pageTitle() {
    return MyTitle(
      title: '充值记录',
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "+${item["money"]}",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                item["status"],
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.red,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
