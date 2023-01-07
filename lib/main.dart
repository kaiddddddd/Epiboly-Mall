import 'dart:io';

import 'package:MallApp/pages/book/store/book_provider.dart';
import 'package:MallApp/pages/commission/store/category_page_provider.dart';
import 'package:MallApp/pages/login/login_page.dart';
import 'package:MallApp/pages/main/main_page.dart';
import 'package:MallApp/pages/main/store/main_provider.dart';
import 'package:MallApp/pages/test.dart';
import 'package:MallApp/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  // 不加这个强制横/竖屏会报错
  WidgetsFlutterBinding.ensureInitialized();
  // 强制竖屏
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLogin = prefs.getBool('isLogin') ?? false;
  print('是否已经登录---' + isLogin.toString());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
        ChangeNotifierProvider(create: (_) => CommissionProvider()),
        ChangeNotifierProvider(create: (_) => BookProvider()),
      ],
      child: MyApp(isLogin: isLogin),
    ),
  );

  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  final isLogin;
  const MyApp({Key? key, this.isLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: RefreshConfiguration(
        hideFooterWhenNotFull: true, // Viewport不满一屏时,禁用上拉加载更多功能
        enableBallisticLoad: true, // 可以通过惯性滑动触发加载更多
        child: MaterialApp(
          title: 'MallApp',
          theme: ThemeData(
            primarySwatch: Colors.grey,
            primaryColor: AppColors.primaryColor,
            accentColor: AppColors.primaryColorAccent,
          ),
          navigatorObservers: [ FlutterSmartDialog.observer],

          builder: FlutterSmartDialog.init(),
          debugShowCheckedModeBanner: false,
          home: isLogin ? MainPage() : LoginPage(),
        ),
      ),
    );
  }
// prefer_const_constructors
}
