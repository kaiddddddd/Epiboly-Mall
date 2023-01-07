import 'package:MallApp/components/button.dart';
import 'package:MallApp/components/spec_selector.dart';
import 'package:MallApp/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../../components/card_container_horizontal.dart';
import '../../../components/card_container_vertical.dart';
import '../../../components/pay_method.dart';
import 'number_counter.dart';

class PayMethodDialog extends StatefulWidget {
  const PayMethodDialog({Key? key}) : super(key: key);

  @override
  _PayMethodDialogState createState() => _PayMethodDialogState();
}

class _PayMethodDialogState extends State<PayMethodDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
          minHeight: 90,
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // 背景图片
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/home/test4.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("¥588", style: TextStyle(color: AppColors.priceColor, fontSize: 22)),
                    Text("编号：8372887472888", style: TextStyle(color: AppColors.primaryGreyText, fontSize: 14)),
                  ],
                )
              ],
            ),
            SizedBox(height: 12),
            CardContainerHorizontal(
              label: "香港島中環皇后大道中93號德輔",
              labelWitch: 280,
              leftIcon: Image.asset(
                "assets/images/goods/address.png",
                width: 24,
              ),
              rightIcon: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black, size: 16),
              showLine: true,
            ),
            CardContainerVertical(
              label: "规格",
              content: SpecSelector(),
            ),
            CardContainerHorizontal(
              label: "数量",
              content: Row(
                children: [
                  Spacer(),
                  NumberCounter(),
                ],
              ),
            ),
            CardContainerHorizontal(
              label: '订单备注',
              rightIcon: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black, size: 16),
            ),
            Padding(
              padding: EdgeInsets.all(18),
              child: PayMethodSelector(
                decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12),
            BottomButton(handleOk: () => {}, text: "立即支付")
          ]),
        ));
  }
}
