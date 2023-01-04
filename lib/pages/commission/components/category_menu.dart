import 'package:MallApp/pages/commission/store/category_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// fenleiBar数据B
const List<Map<String, String>> _categoryData = [
  {
    "title": "推荐",
    "image": "assets/images/commission/fenlei1_off.png",
    "selectedImage": "assets/images/commission/fenlei1_on.png",
  },
  {
    "title": "精选",
    "image": "assets/images/commission/fenlei2_off.png",
    "selectedImage": "assets/images/commission/fenlei2_on.png",
  },
  {
    "title": "胶囊",
    "image": "assets/images/commission/fenlei3_off.png",
    "selectedImage": "assets/images/commission/fenlei3_on.png",
  },
  {
    "title": "灵芝",
    "image": "assets/images/commission/fenlei4_off.png",
    "selectedImage": "assets/images/commission/fenlei4_on.png",
  }
];

class CategoryMenu extends StatelessWidget {
  final ValueChanged<int> onTap;

  CategoryMenu({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Selector<CommissionProvider, int>(
        builder: (_, currentIndex, __) {
          return Container(
            height: 42,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categoryData.length,
              itemBuilder: (context, index) {
                return _buildCategoryItem(index, currentIndex);
              },
            ),
          );
        },
        selector: (_, model) => model.getCategorySelectedIndex);
  }

  Widget _buildCategoryItem(index, currentIndex) {
    var item = _categoryData[index];
    bool isSelect = index == currentIndex;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        margin: EdgeInsets.only(right: 4),
        width: 107,
        // 圆形边框
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelect ? Color(0xFFFF5C5C) : Color(0xFFE5E5E5),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
          // 填充
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              isSelect ? item["selectedImage"]! : item["image"]!,
              width: 20,
              height: 17,
            ),
            SizedBox(width: 6),
            Text(item["title"]!, style: TextStyle(color: isSelect ? Colors.red : Colors.black)),
          ],
        ),
      ),
    );
  }
}
