import 'package:MallApp/utils/my_navigator.dart';
import 'package:flutter/material.dart';

// author：kd
// describe：

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
      color: bgColor ?? Colors.transparent,
      padding: EdgeInsets.only(top: statusBarHeight + 20, bottom: 12),
      child: GestureDetector(
        onTap: () {
          MyNavigator.pop();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16),
              child: Image.asset(
                theme == TitleTheme.white ? 'assets/images/common/back_white.png' : 'assets/images/common/back.png',
                width: 10,
                height: 18,
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
      ),
    );
  }
}
