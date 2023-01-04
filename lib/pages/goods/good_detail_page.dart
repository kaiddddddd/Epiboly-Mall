import 'package:MallApp/styles/colors.dart';
import 'package:MallApp/utils/my_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../components/button.dart';
import '../../components/icon.dart';
import 'components/pay_method_dialog.dart';

// author：kd
// describe：

class GoodDetailPage extends StatefulWidget {

  @override
  State<GoodDetailPage> createState() => _GoodDetailPageState();
}

class _GoodDetailPageState extends State<GoodDetailPage> {

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _showPayMethodDialog();
    });
    return Container(
      color: AppColors.primaryBackground,
      child: Material(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.infinity,
                height: 422,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/home/test4.png"), fit: BoxFit.cover)),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBackButton(),
                    _buildDetailContent(),
                  ],
                ),
              ),
            ),
            _buildBottomButton()
          ],
        ),
      ),
    );
  }

  GestureDetector _buildBackButton() {
    return GestureDetector(
      onTap: () {
        MyNavigator.pop();
      },
      child: Container(
        padding: EdgeInsets.only(top: 50, left: 10, right: 20),
        child: BackgroundIcon("assets/images/common/back.png"),
      ),
    );
  }

  _buildDetailContent() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      margin: EdgeInsets.only(top: 300),
      child: Column(
        children: [
          _buildContentTop(),
          _buildContent(),
        ],
      ),
    );
  }

  _buildContentTop() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 32),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("¥190-2354", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500)),
              Text("月销2000", style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Text("价格￥", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500)),
              Container(
                padding: EdgeInsets.only(top: 3),
                child: Text("200",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough)),
              ),
              Text("起", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500)),
              SizedBox(width: 6),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "返佣12元",
                  style: TextStyle(color: AppColors.priceColor, fontSize: 10, fontWeight: FontWeight.w500),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _buildContent() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("腾泰堂 | ", style: TextStyle(color: Colors.white, fontSize: 14)),
                      Text("直营", style: TextStyle(color: Color(0xFFe7e7f5), fontSize: 10)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text("酒芝靈是「騰泰堂」鹿角靈芝系列產品之一，成份是鹿角靈芝及薑黃精華")
              ],
            ),
          ),
          // 分割线
          Container(
            height: 4,
            color: AppColors.dividerColor,
          ),
          _buildWuLiu(),
          SizedBox(height: 24),
          _buildEvaluation(),
          _buildShopItem(),
        ],
      ),
    );
  }

  _buildWuLiu() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("物流", style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 14, fontWeight: FontWeight.w500)),
              SizedBox(width: 20),
              Text("48小时发货", style: TextStyle(color: Color(0xFF4E4E4E), fontSize: 14, fontWeight: FontWeight.w500)),
              SizedBox(width: 16),
              Text("全国包邮", style: TextStyle(color: Color(0xFF4E4E4E), fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text("配送", style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 14, fontWeight: FontWeight.w500)),
              SizedBox(width: 20),
              Text("请选择配送地址", style: TextStyle(color: Color(0xFF4E4E4E), fontSize: 14, fontWeight: FontWeight.w500)),
              Spacer(),
              // >
              Icon(Icons.arrow_forward_ios_outlined, color: Color(0xFF8D8D8D), size: 16),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text("服务", style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 14, fontWeight: FontWeight.w500)),
              SizedBox(width: 20),
              Text("7天无理由退货，假一赔三",
                  style: TextStyle(color: Color(0xFF4E4E4E), fontSize: 14, fontWeight: FontWeight.w500)),
              Spacer(),
              // >
              Icon(Icons.arrow_forward_ios_outlined, color: Color(0xFF8D8D8D), size: 16),
            ],
          ),
        ],
      ),
    );
  }

  _buildEvaluation() {
    return Container(
      padding: EdgeInsets.only(left: 26, right: 26, top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text("商品评价（1000+）", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500)),
              Spacer(),
              Text("查看全部", style: TextStyle(color: Color(0xFFFB6F69), fontSize: 14, fontWeight: FontWeight.w500)),
              //>
              Icon(Icons.arrow_forward_ios_outlined, color: Color(0xFFFB6F69), size: 16),
            ],
          ),
          SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildEvaluationTag("疗效很好"),
              _buildEvaluationTag("客服的服务态度很好"),
              _buildEvaluationTag("二次回购"),
            ],
          ),
          _buildEvaluationList()
        ],
      ),
    );
  }

  _buildShopItem() {
    return Container(
      padding: EdgeInsets.only(left: 26, top: 10, right: 5, bottom: 86),
      child: Row(
        children: [
          Image.asset("assets/images/login_2.png", width: 65),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("腾泰堂官方旗舰店", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              SizedBox(height: 6),
              Image.asset("assets/images/home/home4.png", width: 15),
            ],
          ),
          Spacer(),
          //进店逛逛
          BottomButton(
            type: ButtonType.OUTLINED,
            text: "进店逛逛",
            height: 31,
            padding: EdgeInsets.symmetric(horizontal: 18),
            handleOk: () => {},
          )
        ],
      ),
    );
  }

  _buildEvaluationTag(String tag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFFFEDEB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(tag, style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }

  _buildEvaluationList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    // 1 border
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFf2cecc), width: 4),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("assets/images/my/avatar.png", width: 40)),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("腾泰堂官方旗舰店", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                      SizedBox(height: 4),
                      Text("1天前",
                          style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 14, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text("疗效很不错，已经是第二次回购了，客服服务态度也很好，值得信赖大品牌有保障",
                  style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
              SizedBox(height: 10),
              index == 1
                  ? Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        Image.asset("assets/images/home/test4.png", width: 100),
                        Image.asset("assets/images/home/test4.png", width: 100),
                        Image.asset("assets/images/home/test4.png", width: 100),
                      ],
                    )
                  : Container(),
              Divider(height: 1, color: Color(0xFFE5E5E5)),
            ],
          ),
        );
      },
    );
  }

  _buildBottomButton() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () => {
          _showPayMethodDialog()
        },
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          child: Container(
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("立即购买", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                Text("（返12.00）", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showPayMethodDialog() {
    showModalBottomSheet(
        context: context,
        // 顶部圆角
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        isScrollControlled: true,
        builder: (BuildContext context) {
          return PayMethodDialog();
        });
  }
}
