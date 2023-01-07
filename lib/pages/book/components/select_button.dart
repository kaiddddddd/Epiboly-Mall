import 'package:flutter/material.dart';

import '../../../styles/colors.dart';

class SelectButton extends StatefulWidget {
  final List<String> itemList;

  SelectButton(this.itemList);

  @override
  _SelectButtonState createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  String _select = '全部';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildButton("全部"),
          SizedBox(width: 10),
          Expanded(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: widget.itemList.map<Widget>((item) {
                return _buildButton(item);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  _buildButton(String title) {
    bool isSelect = _select == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          _select = title;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        decoration: isSelect
            ? BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(8),
              )
            : null,
        child: Text(title,
            style: TextStyle(
              color: isSelect ? Colors.white : Color(0xFF606060),
            )),
      ),
    );
  }
}
