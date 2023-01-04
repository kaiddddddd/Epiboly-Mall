import 'package:flutter/material.dart';

// author：kd
// describe：

class MySearch extends StatelessWidget {

  const MySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
