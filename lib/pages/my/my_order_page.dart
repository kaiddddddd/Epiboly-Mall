import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/components/my_search.dart';
import 'package:MallApp/components/title_bar.dart';
import 'package:MallApp/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:underline_indicator/underline_indicator.dart';

import '../../utils/Toast.dart';

class MyOrderPage extends BasePage {
  final String orderStatus;

  MyOrderPage({required this.orderStatus});

  @override
  BaseState createState() {
    return _MyOrderPageState();
  }
}

class _MyOrderPageState extends BaseState<MyOrderPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List tabs = ["全部订单", "待付款", "待发货", "待收货", "我的售后"];

  String _orderStatus = '0';

  String _orderStatusStr = '';

  @override
  void initState() {
    _orderStatus = widget.orderStatus;
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.index = int.parse(widget.orderStatus);
    _orderStatusStr = tabs[int.parse(widget.orderStatus)];
    _tabController.addListener(() {
      setState(() {
        _orderStatus = _tabController.index.toString();
        _orderStatusStr = tabs[_tabController.index];
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  MyTitle pageTitle() {
    return MyTitle(
      title: '全部订单',
      theme: TitleTheme.black,
      bgColor: AppColors.white,
    );
  }

  @override
  Widget pageBody(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.white,
          padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 20),
          child: MySearch(
            searchBgColor: Color(0xFFF5F5F5),
            hint: '输入商品名称/订单号',
          ),
        ),
        _buildTab(),
        _buildOrderList(),
      ],
    );
  }

  Widget _buildTab() {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        indicator: UnderlineIndicator(
          strokeCap: StrokeCap.round,
          borderSide: BorderSide(
            color: Color(0xffea574b),
            width: 6,
          ),
          insets: EdgeInsets.only(left: 14, right: 14),
        ),
        isScrollable: true,
        unselectedLabelColor: Colors.black,
        labelColor: Colors.black,
        tabs: tabs
            .map((e) => Container(
                  child: Tab(
                    text: e,
                    height: 34,
                  ),
                ))
            .toList(),
      ),
    );
  }

  _buildOrderList() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: 4,
          itemBuilder: (context, index) {
            return _buildOrderItem();
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 12, color: Colors.transparent);
          },
        ),
      ),
    );
  }

  _buildOrderItem() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _buildItemHeader(),
          Divider(height: 24, color: Color(0xffefefef), thickness: 1),
          _buildItemBody(),
          _buildItemPayMoney(),
          _buildAfterSale(),
          SizedBox(height: 8),
          _buildItemFooter(),
        ],
      ),
    );
  }

  _buildItemHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset("assets/images/login_2.png", width: 26),
            SizedBox(width: 4),
            Text("腾泰堂官方旗舰店", style: TextStyle(color: AppColors.black)),
            SizedBox(width: 4),
            Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.black),
          ],
        ),
        Text(_orderStatusStr == "全部订单" ? "待收货" : _orderStatusStr, style: TextStyle(color: AppColors.priceColor)),
      ],
    );
  }

  _buildItemBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("assets/images/home/test4.png", width: 68),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "酒芝灵",
                style: TextStyle(color: AppColors.black, fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                "礼盒装｜ 褐色｜500ml",
                style: TextStyle(color: Color(0xffbebebe), fontSize: 14),
              ),
              SizedBox(height: 4),
              Container(
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // 边框1
                  border: Border.all(
                    color: AppColors.priceColor,
                    width: 1,
                  ),
                ),
                child: Text(
                  "7天保价",
                  style: TextStyle(color: AppColors.priceColor, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "¥ 99.00",
              style: TextStyle(color: Color(0xFF777777), fontSize: 14),
            ),
            SizedBox(height: 2),
            Text(
              "x1",
              style: TextStyle(color: Color(0xFFACACAC), fontSize: 14),
            ),
          ],
        ),
      ],
    );
  }

  _buildItemPayMoney() {
    return Text(
      "实付款：¥ 99.00",
      style: TextStyle(
        color: AppColors.black,
        fontSize: 16,
      ),
    );
  }

  _buildItemFooter() {
    Widget rightButton = Container();
    switch (_orderStatusStr) {
      case "待付款":
        rightButton = Row(
          children: [
            OutlinedButton(
              onPressed: () {
                Toast.show("订单已取消");
              },
              child: Text("取消订单", style: TextStyle(color: AppColors.primaryGreyText)),
              style: _getButtonStyle(AppColors.primaryGreyText),
            ),
            SizedBox(width: 8),
            OutlinedButton(
              onPressed: () {},
              child: Text("立即支付", style: TextStyle(color: AppColors.priceColor)),
              style: _getButtonStyle(AppColors.priceColor),
            ),
          ],
        );
        break;
      case "待发货":
        rightButton = Row(
          children: [
            OutlinedButton(
              onPressed: () {
                Toast.show("提醒成功");
              },
              child: Text("提醒发货", style: TextStyle(color: AppColors.priceColor)),
              style: _getButtonStyle(AppColors.priceColor),
            ),
          ],
        );
        break;
      case "待收货":
      case "全部订单":
        rightButton = Row(
          children: [
            OutlinedButton(
              onPressed: () {
                Toast.show("延长成功");
              },
              child: Text("延长收货", style: TextStyle(color: AppColors.primaryGreyText)),
              style: _getButtonStyle(AppColors.primaryGreyText),
            ),
            SizedBox(width: 8),
            OutlinedButton(
              onPressed: () {},
              child: Text("查看物流", style: TextStyle(color: AppColors.primaryGreyText)),
              style: _getButtonStyle(AppColors.primaryGreyText),
            ),
            SizedBox(width: 8),
            OutlinedButton(
                onPressed: () {
                  Toast.show("已收货");
                },
                child: Text("确认收货", style: TextStyle(color: AppColors.priceColor)),
                style: _getButtonStyle(AppColors.priceColor)),
          ],
        );
        break;
      case "我的售后":
        rightButton = OutlinedButton(
            onPressed: () {},
            child: Text("查看详情", style: TextStyle(color: AppColors.priceColor)),
            style: _getButtonStyle(AppColors.priceColor));
        break;
    }

    Widget leftButton = Container();
    if (_orderStatusStr == "待付款") {
      leftButton = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("支付剩余:", style: TextStyle(color: AppColors.black, fontSize: 14, height: 1.5)),
          Text("12:00:22", style: TextStyle(color: AppColors.priceColor, fontSize: 14, height: 1.5)),
        ],
      );
    } else if (_orderStatusStr == "我的售后") {
      leftButton = Row();
    } else {
      leftButton = TextButton(
        onPressed: () {},
        child: Text(
          "更多",
          style: TextStyle(color: AppColors.primaryGreyText),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          minimumSize: MaterialStateProperty.all(Size(0, 0)),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leftButton,
        rightButton,
      ],
    );
  }

  ButtonStyle _getButtonStyle(color) {
    return OutlinedButton.styleFrom(
      side: BorderSide(color: color),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      minimumSize: Size(0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }

  _buildAfterSale() {
    return _orderStatusStr == "我的售后"
        ? Container(
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xFFfbf9fc),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "退款成功：99.00",
              style: TextStyle(color: AppColors.black, fontSize: 14),
            ),
          )
        : Container();
  }
}
