import 'package:MallApp/pages/activity/components/activity_title.dart';
import 'package:MallApp/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/title_bar.dart';

/// 折扣专区
class HotPage extends StatefulWidget {
  const HotPage({Key? key}) : super(key: key);

  @override
  State<HotPage> createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> {
  List<Map<String, dynamic>> _commodityData1 = [
    {
      "image": "assets/images/home/test4.png",
      "title": "多肽地龙蛋白片",
      "desc": "地龍蛋白提取之地龍（即蚯蚓）含有膠原酶、纖溶啟動蛋白、核酸、微量元素等多",
      "price": "¥398.00",
    },
    {
      "image": "assets/images/home/test4.png",
      "title": "多肽地龙蛋白片",
      "desc": "地龍蛋白提取之地龍（即蚯蚓）含有膠原酶、纖溶啟動蛋白、核酸、微量元素等多",
      "price": "¥398.00",
    },
    {
      "image": "assets/images/home/test4.png",
      "title": "多肽地龙蛋白片",
      "desc": "地龍蛋白提取之地龍（即蚯蚓）含有膠原酶、纖溶啟動蛋白、核酸、微量元素等多",
      "price": "¥398.00",
    },
  ];

  List<Map<String, dynamic>> _commodityData2 = [
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
      child: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                'assets/images/activity/bg_bang1.png',
                width: double.infinity,
                height: 440,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/activity/bg_bang2.png',
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TitleBar(
                    title: "",
                    padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
                  ),
                  SizedBox(height: 200),
                  _commodityList1(),
                  SizedBox(height: 20),
                  _commodityList2(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _commodityList1() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 12),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: _commodityData1.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildItem1(index);
            },
          ),
        ),
        ActivityTitle("新品热销爆款")
      ],
    );
  }

  _commodityList2() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 12),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.55,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return _buildItem2(index);
                },
                itemCount: _commodityData2.length,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("查看更多", style: TextStyle(fontSize: 14, color: Colors.black)),
                  SizedBox(width: 2),
                  Padding(
                    padding: EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Color(0xFF656565),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        ActivityTitle("全网畅销产品")
      ],
    );
  }

  _buildItem1(int index) {
    var item = _commodityData1[index];
    return Stack(
      children: [
        Container(
          height: 233,
          margin: EdgeInsets.only(bottom: 30),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
        ),
        Positioned(
            top: 6,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(left: 18, top: 28, right: 18, bottom: 32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(item["image"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["title"],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            item["desc"],
                            style: TextStyle(
                              color: Color(0xFF9B9B9B),
                              fontSize: 14,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 1,
                            color: Color(0xFFE5E5E5),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              color: AppColors.priceColor,
                              width: 50,
                              height: 2,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "活动价\n低至：",
                                style: TextStyle(
                                  color: Color(0xFF848484),
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 6),
                              Text(
                                "${item["price"]}",
                                style: TextStyle(
                                  color: AppColors.priceColor,
                                  fontSize: 22,
                                ),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 90,
                              padding: EdgeInsets.symmetric(vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.purple,
                                borderRadius: BorderRadius.circular(44),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(width: 2),
                                  Text(
                                    "立即抢购",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Padding(
                                    padding: EdgeInsets.only(top: 2),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  _buildItem2(int index) {
    var item = _commodityData2[index];
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only( top: 12),
          decoration: BoxDecoration(
            color: Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(12),
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
        Positioned(
          top: 0,
          child: Container(
            width: 56,
            height: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/activity/hot.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 20, bottom: 2),
              alignment: Alignment.bottomLeft,
              child: Text("Top ${index + 1}", style: TextStyle(fontSize: 10, color: Colors.white)),
            ),
          ),
        )
      ],
    );
  }
}
