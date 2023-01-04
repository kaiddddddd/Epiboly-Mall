import 'package:MallApp/utils/my_navigator.dart';
import 'package:flutter/material.dart';

import '../../../styles/colors.dart';
import '../../goods/good_detail_page.dart';

// author：kd
// describe：

class GoodsList extends StatelessWidget {
  final String? title;
  final bool hasShopValue;

  GoodsList({this.title, this.hasShopValue = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  title!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              )
            : Container(),
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: hasShopValue ? 0.6 : 0.67,
          ),
          itemBuilder: (context, index) {
            return _buildGoodsItem();
          },
        ),
      ],
    );
  }

  Widget _buildGoodsItem() {
    return GestureDetector(
      onTap: () {
        MyNavigator.push(GoodDetailPage());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 162,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/home/test4.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "酒芝灵",
              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text("已售123"),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFDFDE),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "返佣12元",
                    style: TextStyle(color: AppColors.priceColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            hasShopValue
                ? Column(
                    children: [
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
                      SizedBox(height: 8),
                    ],
                  )
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "¥ 1000",
                  style: TextStyle(color: AppColors.priceColor, fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Color(0xFFEFEFEF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
