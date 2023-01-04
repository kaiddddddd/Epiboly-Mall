import 'package:MallApp/styles/styles.dart';
import 'package:flutter/material.dart';

enum ButtonType { DEFAULT, OUTLINED }

class BottomButton extends StatelessWidget {
  final String? text;
  final Function? handleOk;
  final ButtonType type;
  final double? height;
  final EdgeInsetsGeometry? padding;
  const BottomButton({
    Key? key,
    required this.handleOk,
    required this.text,
    this.type = ButtonType.DEFAULT,
    this.height,
    this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => handleOk!(),
      child: Container(
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        height: height ?? 41,
        padding: padding,
        //outline
        decoration: BoxDecoration(
          color: type == ButtonType.DEFAULT ? AppColors.primaryColor : null,
          border: type == ButtonType.OUTLINED ? Border.all(color: AppColors.primaryColor) : null,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              color: type == ButtonType.DEFAULT ? Colors.white : AppColors.primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
