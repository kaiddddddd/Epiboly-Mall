import 'package:MallApp/pages/main/main_page.dart';
import 'package:MallApp/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/base_scaffold.dart';
import '../../components/button.dart';
import '../../components/form_input.dart';
import '../../components/my_app_bar.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<RegisterPage> {
  GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  TextEditingController _confirmPwdController = TextEditingController();
  TextEditingController _invCodeController = TextEditingController();
  TextEditingController _verCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
      resizeToAvoidBottomInset: true,
      appBar: EmptyAppBar(),
      body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                        width: double.infinity,
                        height: 220,
                        decoration: BoxDecoration(
                            image:
                                DecorationImage(image: AssetImage('assets/images/login_1.png'), fit: BoxFit.cover)))),
                /*Image.asset("assets/images/login_1.png",
                  fit: BoxFit.cover,
                ),*/
                Container(
                  margin: EdgeInsets.only(top: 190),
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
                                    '注册',
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
                          height: 20,
                        ),
                        _buildConfirmPasswordInput(),
                        SizedBox(
                          height: 20,
                        ),
                        _buildInvitationCodeInput(),
                        SizedBox(
                          height: 20,
                        ),
                        _buildVerificationCodeInput(),
                        SizedBox(
                          height: 40,
                        ),
                        BottomButton(
                          text: '注册',
                          handleOk: () => {
                            // 关闭当前页面
                            Navigator.of(context).pop(),
                          }
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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

  // 确认密码
  Widget _buildConfirmPasswordInput() {
    return FormInput(
        hintText: "确认密码",
        controller: _confirmPwdController,
        keyboardType: TextInputType.visiblePassword,
        //校验密码
        validator: (v) {
          String t = v ?? '';
          return t.trim().length > 5 ? null : "密码不能少于6位";
        });
  }

  // 邀请码（选填）
  Widget _buildInvitationCodeInput() {
    return FormInput(
      hintText: "邀请码（选填）",
      controller: _invCodeController,
      keyboardType: TextInputType.visiblePassword,
    );
  }

  // 验证码
  Widget _buildVerificationCodeInput() {
    return FormInput(
        hintText: "验证码",
        controller: _verCodeController,
        keyboardType: TextInputType.text,
        isSms: true,
        //校验密码
        validator: (v) {
          String t = v ?? '';
          return t.trim().length > 0 ? null : "请输入验证码";
        });
  }
}
