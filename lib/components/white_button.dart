import 'package:flutter/material.dart';

// author：kd
// describe： 圆角按钮

class RoundedButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final Color? textColor;
  final Color? backgroundColor;
  final double? radius;
  final bool hasElevation;

  RoundedButton(
      {required this.text,
      required this.onPressed,
      this.width,
      this.height,
      this.fontSize,
      this.textColor,
      this.backgroundColor,
      this.radius,
      this.hasElevation = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor ?? Colors.white,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor ?? Colors.white),
          // 取消阴影
          elevation: hasElevation ? MaterialStateProperty.all(1) : MaterialStateProperty.all(0),
          // 取消水波纹
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 50),
            ),
          ),
        ),
      ),
    );
  }
}
