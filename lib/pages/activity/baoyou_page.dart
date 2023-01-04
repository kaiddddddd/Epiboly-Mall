import 'package:MallApp/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/title_bar.dart';

/// 包邮专区
class BaoYouPage extends StatefulWidget {
  const BaoYouPage({Key? key}) : super(key: key);

  @override
  State<BaoYouPage> createState() => _BaoYouPageState();
}

class _BaoYouPageState extends State<BaoYouPage> {
  List<Map<String, dynamic>> _goodList = [
    {
      "image": "assets/images/home/test1.png",
      "title": "灵芝胶囊",
      "sales": "1284",
      "price": "¥128.00",
    },
    {
      "image": "assets/images/home/test2.png",
      "title": "灵芝胶囊",
      "sales": "1284",
      "price": "¥128.00",
    },
    {
      "image": "assets/images/home/test3.png",
      "title": "多肽地龙蛋白片",
      "sales": "1284",
      "price": "¥398.00",
    },
    {
      "image": "assets/images/home/test1.png",
      "title": "灵芝胶囊",
      "sales": "1284",
      "price": "¥128.00",
    },
    {
      "image": "assets/images/home/test2.png",
      "title": "灵芝胶囊",
      "sales": "1284",
      "price": "¥128.00",
    },
    {
      "image": "assets/images/home/test3.png",
      "title": "多肽地龙蛋白片",
      "sales": "1284",
      "price": "¥398.00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        // 背景图片
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/activity/bg_baoyou.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleBar(
                  title: "",
                  themeColor: Colors.black,
                  padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
                ),
                _buildGoodsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildGoodsList() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 12),
          padding: EdgeInsets.only(left: 14, right: 14, top: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              childAspectRatio: 0.66,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return _buildItem2(index);
            },
            itemCount: _goodList.length,
          ),
        ),
        Positioned(
          child: Container(
            alignment: Alignment.center,
            child: Container(
              width: 183,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/activity/title.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text("精选好物", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        )
      ],
    );
  }

  _buildItem2(int index) {
    var item = _goodList[index];
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xfffafafa),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(item["image"]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                item["title"],
                // 单行
                maxLines: 1,
                // 超出显示省略号
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/activity/sales.png",
                    width: 12,
                    height: 12,
                  ),
                  SizedBox(width: 2),
                  Text(
                    "销量:${item["sales"]}",
                    style: TextStyle(
                      color: Color(0xFF9B9B9B),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text("${item["price"]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
