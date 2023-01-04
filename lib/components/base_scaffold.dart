import 'package:MallApp/components/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends Scaffold {
  BaseScaffold(
      {String? title,
      bool? primary,
      PreferredSizeWidget? appBar,
      Widget? body,
      List<Widget>? actions,
      AppBarBackType leadType = AppBarBackType.Back,
      WillPopCallback? onWillPop,
      Brightness brightness = Brightness.light,
      Widget? floatingActionButton,
      Color appBarBackgroundColor = Colors.white,
      Color? titleColor,
      bool centerTitle = true,
      resizeToAvoidBottomInset: false,
      FloatingActionButtonLocation? floatingActionButtonLocation})
      : super(
          appBar: appBar ??
              MyAppBar(
                brightness: Brightness.light,
                leadingType: leadType,
                onWillPop: onWillPop,
                actions: actions ?? [],
                centerTitle: centerTitle,
                backgroundColor: appBarBackgroundColor,
              ),
          primary: primary ?? true,
          backgroundColor: Colors.white,
          body: body,
          floatingActionButton: floatingActionButton,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          floatingActionButtonLocation: floatingActionButtonLocation,
        );
}
