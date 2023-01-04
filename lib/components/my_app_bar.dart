import 'package:MallApp/styles/colors.dart';
import 'package:flutter/material.dart';

/// appbar 返回按钮类型
enum AppBarBackType { Back, None }

const double kNavigationBarHeight = 44.0;

// 自定义 AppBar
class MyAppBar extends AppBar implements PreferredSizeWidget {
  MyAppBar(
      {Key? key,
      Widget? title,
      AppBarBackType? leadingType,
      WillPopCallback? onWillPop,
      Widget? leading,
      Brightness? brightness,
      Color? backgroundColor,
      List<Widget>? actions,
      bool centerTitle = true,
      double? elevation})
      : super(
          key: key,
          title: title,
          centerTitle: centerTitle,
          brightness: brightness ?? Brightness.light,
          backgroundColor: backgroundColor ?? Color(0xfffefefe),
          leading: leading ??
              (leadingType == AppBarBackType.None
                  ? Container()
                  : AppBarBack(
                      onWillPop: onWillPop,
                    )),
          leadingWidth: 32,
          actions: actions,
          elevation: elevation ?? 0.5,
        );

  @override
  get preferredSize => Size.fromHeight(44);
}

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  Size get preferredSize => Size(0.0, 0.0);
}

// 自定义返回按钮
class AppBarBack extends StatelessWidget {
  final Color? color;
  final WillPopCallback? onWillPop;

  AppBarBack({this.onWillPop, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final willBack = onWillPop == null ? true : await onWillPop!();
        if (!willBack) return;
        Navigator.pop(context);
      },
      child: Container(
              margin: EdgeInsets.only(left: 22),
              child: Image.asset(
                'assets/images/common/back.png',
                color: color,
              ),
            ),
    );
  }
}
