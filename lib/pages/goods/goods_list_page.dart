import 'package:MallApp/pages/main/components/goods_list.dart';
import 'package:MallApp/styles/colors.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import '../../components/background_container.dart';
import '../../utils/my_navigator.dart';
import 'good_detail_page.dart';

enum GoodsType { ZHI_DE, ER_XIAO, JING_XUAN }

class GoodsPage extends StatefulWidget {
  final GoodsType type;

  GoodsPage({required this.type});

  @override
  _GoodsPageState createState() => _GoodsPageState();
}

class _GoodsPageState extends State<GoodsPage> {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      bgAsset: "assets/images/goods/bg${widget.type.index + 1}.png",
      bgHeight: 200,
      children: [
        _buildTitle(),
        _buildSearch(),
        _buildGoodsContent(),
      ],
    );
  }

  _buildTitle() {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 10, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/common/back.png',
                width: 10,
              ),
            ),
          ),
          Image.asset(
             "assets/images/goods/title${widget.type.index + 1}.png",
            width: 86,
          ),
        ],
      ),
    );
  }

  _buildSearch() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
              child: Image.asset("assets/images/home/search.png", width: 19),
            ),
          ),
          SizedBox(width: 12),
          Text(
            "搜索",
          ),
        ],
      ),
    );
  }

  _buildGoodsContent() {
    Widget listWidget;
    Color bgColor;
    String sortValue;
    switch(widget.type){
      case GoodsType.ZHI_DE:
        listWidget = _buildGoodsList();
        bgColor = Colors.white;
        sortValue = "值得购";
        break;
      case GoodsType.ER_XIAO:
        listWidget = GoodsList(hasShopValue: true,);
        bgColor = Color(0xFFF5F5F5);
        sortValue = "热销值";
        break;
      case GoodsType.JING_XUAN:
        listWidget = GoodsList(hasShopValue: true,);
        bgColor = Color(0xFFF5F5F5);
        sortValue = "品质值";
        break;
    }
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        // 顶部圆角
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            // 排序
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildSortItem("综合"),
                  buildSortItem("销量"),
                  buildSortItem("价格"),
                  buildSortItem(sortValue),
                ],
              ),
            ),
            // 列表
            listWidget
          ],
        ),
      ),
    );
  }

  buildSortItem(title) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: title == "综合" ? AppColors.priceColor : Color(0xFF5A5A5A),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 2),
        title == "综合"
            ? Container()
            : Padding(
                padding: EdgeInsets.only(top: 2),
                child: Image.asset(
                  "assets/images/goods/sort.png",
                  width: 11,
                ),
              ),
      ],
    );
  }

  _buildGoodsList() {
    return Expanded(
      child: ListView.separated(
        itemCount: 10,
        padding: EdgeInsets.zero,
        // 分割线
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
            color: Color(0xFFE5E5E5),
          );
        },
        itemBuilder: (context, index) {
          return _buildGoodsItem();
        },
      ),
    );
  }

  _buildGoodsItem() {
    return GestureDetector(
      onTap: () {
        MyNavigator.push(GoodDetailPage());
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Image.asset(
              "assets/images/home/test1.png",
              width: 100,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "灵芝胶囊 宁心安神 健脾和胃用于失眠健忘 身体虚弱 神经衰弱",
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFf8e57c),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      //min
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          // 圆角6
                          decoration: BoxDecoration(
                            color: Color(0xFFf8e57c),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 1, horizontal: 6),
                          child: Text(
                            "购物值",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 1, horizontal: 6),
                          decoration: BoxDecoration(
                            color: Color(0xFFa4a7da),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            "最高赠120点",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "￥99.00",
                        style: TextStyle(
                          color: AppColors.priceColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 1, horizontal: 6),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.priceColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: Text(
                          "返佣12.00",
                          style: TextStyle(
                            color: AppColors.priceColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Spacer(),
                      //已售123
                      Text(
                        "已售123",
                        style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        "assets/images/login_2.png",
                        width: 26,
                      ),
                      Text(
                        "腾泰堂官方旗舰店",
                        style: TextStyle(
                          color: Color(0xFF999999),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
