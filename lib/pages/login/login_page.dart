import 'package:MallApp/pages/login/change_password.dart';
import 'package:MallApp/pages/login/register_page.dart';
import 'package:MallApp/pages/main/main_page.dart';
import 'package:MallApp/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/base_scaffold.dart';
import '../../components/button.dart';
import '../../components/form_input.dart';
import '../../components/my_app_bar.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginPage> {
  GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _loginAction(BuildContext context) async {
    if ((_formKey.currentState as FormState).validate()) {
      // 验证通过表示已经登录成功
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isLogin', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext ctx) => MainPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _unameController.addListener(() {
      setState(() {});
    });
    _pwdController.addListener(() {
      setState(() {});
    });
    return BaseScaffold(
      primary: false,
      appBar: EmptyAppBar(),
      body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/login_1.png'), fit: BoxFit.cover)),
                ),
              ),
              /*Image.asset("assets/images/login_1.png",
                fit: BoxFit.cover,
              ),*/
              Container(
                margin: EdgeInsets.only(top: 190),
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                // 上圆角31
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(31.0),
                    topRight: Radius.circular(31.0),
                  ),
                ),
                child: Form(
                  autovalidateMode: AutovalidateMode.disabled,
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage("assets/images/login_2.png"),
                                width: 62,
                                height: 62,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Text(
                                  '登录',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryText,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      _buildPhoneInput(),
                      SizedBox(
                        height: 20,
                      ),
                      _buildPasswordInput(),
                      SizedBox(
                        height: 28,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext ctx) => ChangePasswordPage(),
                                ),
                              )
                            },
                            child: Text(
                              '忘记密码?',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFFD4841),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      // 登录按钮
                      BottomButton(
                        text: '登录',
                        handleOk: () => _loginAction(context),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // 登录按钮
                      BottomButton(
                        text: '注册',
                        type: ButtonType.OUTLINED,
                        handleOk: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext ctx) => RegisterPage(),
                            ),
                          )
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  // 号码
  Widget _buildPhoneInput() {
    return FormInput(
        hintText: "手机号",
        controller: _unameController,
        keyboardType: TextInputType.phone,
        // 校验用户名
        validator: (v) {
          String t = v ?? '';
          return t.trim().length > 0 ? null : "用户名不能为空";
        });
  }

  // 密码
  Widget _buildPasswordInput() {
    return FormInput(
        hintText: "密码",
        controller: _pwdController,
        keyboardType: TextInputType.visiblePassword,
        //校验密码
        validator: (v) {
          String t = v ?? '';
          return t.trim().length > 5 ? null : "密码不能少于6位";
        });
  }
}
