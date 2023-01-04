import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {

  final double? height;
  final Color? color;

  MyDivider({this.height,this.color});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? Color(0xffdddddd),
      height: height ?? 0.5,
      indent: 20,
      endIndent:20
    );
  }
}

class MyVerticalDivider extends StatelessWidget {
  const MyVerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      color: Color(0xffdddddd),
      width: 2,
    );
  }
}
