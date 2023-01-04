import 'package:flutter/material.dart';

// author：kd
// describe：支付方式组件
class PayMethodSelector extends StatefulWidget {
  final bool hasTitle;
  final Decoration? decoration;

  PayMethodSelector({this.hasTitle = false, this.decoration});

  @override
  State<PayMethodSelector> createState() => _PayMethodSelectorState();
}

class _PayMethodSelectorState extends State<PayMethodSelector> {
  List<Map<String, dynamic>> _payMethodData = [
    {
      "select": true,
      "title": "visa",
      "image": "assets/images/goods/pay1.png",
    },
    {
      "select": false,
      "title": "Mastercard",
      "image": "assets/images/goods/pay2.png",
    },
    {
      "select": false,
      "title": "WeChat Pay",
      "image": "assets/images/goods/pay3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      // 圆角22
      decoration: widget.decoration ??
          BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.hasTitle
              ? Text(
                  "请选择支付方式",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              : Container(),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: _payMethodData.length,
              itemBuilder: (context, index) {
                return _buildPayMethodItem(_payMethodData[index], index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPayMethodItem(Map<String, dynamic> item, int index) {
    return GestureDetector(
      onTap: () => {
        _payMethodData.forEach((element) {
          element["select"] = false;
        }),
        _payMethodData[index]["select"] = true,
        setState(() {})
      },
      child: Container(
        height: 50,
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item["image"]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 10),
            Text(
              item["title"],
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Spacer(),
            item["select"]
                ? Image.asset("assets/images/goods/check_on.png", width: 20)
                : Image.asset("assets/images/goods/check_off.png", width: 20),
          ],
        ),
      ),
    );
  }
}
