import 'package:MallApp/base/base_page.dart';
import 'package:MallApp/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../components/button.dart';
import '../../components/title_bar.dart';

class TaxiPage extends BasePage {
  @override
  BaseState createState() {
    return _TaxiPageState();
  }
}

class _TaxiPageState extends BaseState {
  @override
  MyTitle pageTitle() {
    return MyTitle(
      title: '打车返利',
      bgColor: Colors.transparent,
    );
  }

  @override
  Widget pageBody(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 20),
          Image.asset(
            'assets/images/activity/dc_top.png',
            width: 200,
            height: 200,
          ),
          _buildBottom(),
        ],
      ),
    );
  }

  _buildBottom() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.only(left: 20, right: 20, top: 32, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Column(
        children: [
          _buildProcess(),
          _buildDesc(),
          SizedBox(height: 26),
          BottomButton(
            text: '领红包打车',
            handleOk: () => {},
          ),
          SizedBox(
            height: 20,
          ),
          BottomButton(
            text: '分享打车红包',
            type: ButtonType.OUTLINED,
            handleOk: () => {},
          ),
        ],
      ),
    );
  }

  _buildProcess() {
    return Container(
      margin: EdgeInsets.only(bottom: 20,top: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildProcessItem('assets/images/activity/dc1.png', '先领券'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Image.asset("assets/images/activity/process_arrow.png", width: 20),
          ),
          _buildProcessItem('assets/images/activity/dc2.png', '在下单'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Image.asset("assets/images/activity/process_arrow.png", width: 20),
          ),
          _buildProcessItem('assets/images/activity/dc3.png', '拿返利'),
        ],
      ),
    );
  }

  _buildDesc() {
    return Container(
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("规则说明", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          SizedBox(height: 4),
          Text("1.下单打车均有佣金,具体返佣金额以实际支付金额为准.", style: TextStyle(color: Color(0xFF656565))),
          SizedBox(height: 8),
          Text("2.订单实时同步,成功打车完成支付后,稍后可查看我的订单.", style: TextStyle(color: Color(0xFF656565))),
          SizedBox(height: 8),
          Text("3.优先使用红包下单,若出现丢失情况,请检查是否使用他人优惠券及红包.", style: TextStyle(color: Color(0xFF656565))),
        ],
      ),
    );
  }

  _buildProcessItem(String img, String title) {
    return Column(
      children: [
        Image.asset(
          img,
          width: 40,
          height: 40,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
