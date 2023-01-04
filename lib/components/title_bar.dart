import 'package:MallApp/utils/my_navigator.dart';
import 'package:flutter/material.dart';

// author：kd
// describe：

class TitleBar extends StatelessWidget {
  final title;
  final themeColor;
  final bgColor;
  final padding;
  final leftMargin;

  TitleBar({required this.title, this.themeColor, this.bgColor, this.padding, this.leftMargin});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor ?? Colors.transparent,
      padding: padding ?? EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 44,
              alignment: Alignment.center,
              padding: leftMargin,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      MyNavigator.pop();
                    },
                    child: Container(
                      width: 32,
                      alignment: Alignment.center,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: themeColor ?? Colors.white, size: 20),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Text(title,
                      style: TextStyle(
                        color: themeColor ?? Colors.white,
                        fontSize: 16,
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum TitleTheme {
  white,
  black,
}

class MyTitle extends StatelessWidget {
  final String title;
  final Color? bgColor;
  final TitleTheme theme;
  final padding;

  MyTitle({
    this.title = "",
    this.theme = TitleTheme.black,
    this.bgColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    double? statusBarHeight =
        WidgetsBinding.instance!.window.padding.top / WidgetsBinding.instance!.window.devicePixelRatio;
    return Container(
      color: bgColor ?? Colors.white,
      padding: EdgeInsets.only(top: statusBarHeight + 20, bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              MyNavigator.pop();
            },
            child: Container(
              margin: EdgeInsets.only(left: 22),
              child: Image.asset(
                theme == TitleTheme.white ? 'assets/images/common/back_white.png' : 'assets/images/common/back.png',
                width: 10,
                height: 18,
              ),
            ),
          ),
          SizedBox(width: 12),
          Text(title,
              style: TextStyle(
                fontSize: 17,
                color: theme == TitleTheme.black ? Colors.black : Colors.white,
              )),
        ],
      ),
    );
  }
}
