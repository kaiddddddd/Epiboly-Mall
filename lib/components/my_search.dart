import 'package:flutter/material.dart';

// author：kd
// describe：

class MySearch extends StatelessWidget {

  MySearch({this.searchBgColor, this.hint = "",this.textColor});

  final Color? searchBgColor;

  final Color? textColor;

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: searchBgColor ?? Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
            child: Row(
              children: [
                Image.asset("assets/images/home/search.png", width: 19),
                SizedBox(width: 10),
                Text(
                  hint,
                  style: TextStyle(
                    color: Color(0xFFC4C4C4),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12),
        Text(
          "搜索",
          style: TextStyle(
            color: textColor ?? Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

}
