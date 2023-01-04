import 'package:flutter/material.dart';

class NumberCounter extends StatefulWidget {
  const NumberCounter({Key? key}) : super(key: key);

  @override
  _NumberCounterState createState() => _NumberCounterState();
}

class _NumberCounterState extends State<NumberCounter> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      // 圆角6，边框1
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Color(0xffdddddd), width: 1),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // 1 不能减
              if (index < 2) {
                return;
              }
              setState(() {
                index--;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Icon(Icons.remove, color: Colors.black, size: 16),
            ),
          ),
          Container(
            width: 1,
            height: 32,
            color: Color(0xffdddddd),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Text(
              "$index",
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
          Container(
            width: 1,
            height: 32,
            color: Color(0xffdddddd),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                index++;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Icon(Icons.add, color: Colors.black, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}
