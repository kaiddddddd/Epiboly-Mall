import 'package:MallApp/components/title_bar.dart';
import 'package:MallApp/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 内购清单
class InternalPurchasePage extends StatefulWidget {
  const InternalPurchasePage({Key? key}) : super(key: key);

  @override
  State<InternalPurchasePage> createState() => _InternalPurchasePageState();
}

class _InternalPurchasePageState extends State<InternalPurchasePage> {
  List<Map<String, dynamic>> _goodData = [
    {
      "image": "assets/images/home/test1.png",
      "name": "鹿芝灵  增强免疫力 延缓衰老帮助病痛复原",
      "yuanjia": "¥398.00",
      "neigoujia": "¥328.00",
    },
    {
      "image": "assets/images/home/test1.png",
      "name": "鹿芝灵  增强免疫力 延缓衰老帮助病痛复原",
      "yuanjia": "¥398.00",
      "neigoujia": "¥328.00",
    },
    {
      "image": "assets/images/home/test1.png",
      "name": "鹿芝灵  增强免疫力 延缓衰老帮助病痛复原",
      "yuanjia": "¥398.00",
      "neigoujia": "¥328.00",
    },
    {
      "image": "assets/images/home/test1.png",
      "name": "鹿芝灵  增强免疫力 延缓衰老帮助病痛复原",
      "yuanjia": "¥398.00",
      "neigoujia": "¥328.00",
    },
    {
      "image": "assets/images/home/test1.png",
      "name": "鹿芝灵  增强免疫力 延缓衰老帮助病痛复原",
      "yuanjia": "¥398.00",
      "neigoujia": "¥328.00",
    },
    {
      "image": "assets/images/home/test1.png",
      "name": "鹿芝灵  增强免疫力 延缓衰老帮助病痛复原",
      "yuanjia": "¥398.00",
      "neigoujia": "¥328.00",
    },
    {
      "image": "assets/images/home/test1.png",
      "name": "鹿芝灵  增强免疫力 延缓衰老帮助病痛复原",
      "yuanjia": "¥398.00",
      "neigoujia": "¥328.00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.primaryBackground,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: double.infinity,
                  height: 400,
                  // 从上到下渐变
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFffdbd9),
                        Color(0xFFf5f5f5),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    TitleBar(
                      title: "内购专区",
                      themeColor: Colors.black,
                      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
                    ),
                    _buildDescription(),
                    _buildGoodTitle(),
                    _buildGoodBody(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildDescription() {
    return Container(
      padding: EdgeInsets.all(22),
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("我们精心挑选各电商平台内购商品，不用等直播不用拼手速，不用等大促，现货低价，直降给你真诚的优惠"),
          SizedBox(height: 20),
          Text("每天会持续更新好货和全网爆品！"),
        ],
      ),
    );
  }

  _buildGoodTitle() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.only(top: 26, bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Align(
                alignment: Alignment.center, child: Text("商品图", style: TextStyle(fontSize: 12, color: Colors.white))),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.center,
                child: Text("比价商品", style: TextStyle(fontSize: 12, color: Colors.white))),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.center, child: Text("原价", style: TextStyle(fontSize: 12, color: Colors.white))),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.center, child: Text("内购价", style: TextStyle(fontSize: 12, color: Colors.white))),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.center, child: Text("抢购", style: TextStyle(fontSize: 12, color: Colors.white))),
          ),
        ],
      ),
    );
  }

  _buildGoodBody() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _goodData.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildGoodItem(index);
        },
      ),
    );
  }

  _buildGoodItem(int index) {
    var item = _goodData[index];
    return Container(
      height: 75,
      // 单数灰色、双数白色
      color: index % 2 == 0 ? Colors.white : Color(0xFFf5f5f5),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(item["image"], width: 43, height: 43),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(item["name"], style: TextStyle(fontSize: 10, color: Color(0xFF656565))),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(item["yuanjia"], style: TextStyle(fontSize: 12, color: Color(0xFF656565))),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(item["neigoujia"], style: TextStyle(fontSize: 12, color: Color(0xFF656565))),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text("点击抢购",
                  style: TextStyle(fontSize: 12, color: AppColors.purple, decoration: TextDecoration.underline)),
            ),
          ),
        ],
      ),
    );
  }
}
