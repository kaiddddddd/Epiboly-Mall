import 'package:flutter/material.dart';

import '../styles/colors.dart';

// author：kd
// describe：

class FormInput extends StatefulWidget {
  final TextEditingController? controller;

  final String? hintText;

  final FormFieldValidator<String>? validator;

  final TextInputType? keyboardType;

  final bool isSms;

  FormInput({this.controller, this.hintText, this.validator, this.keyboardType, this.isSms = false});

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  @override
  Widget build(BuildContext context) {
    widget.controller?.addListener(() {
      setState(() {});
    });
    return Stack(
      children: [
        TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              /*     suffixIcon: GestureDetector(
              onTap: () => {widget.controller?.clear()},
              child: widget.controller?.text != '' ? Icon(Icons.cancel, size: 18) : SizedBox(),
            ),*/
              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 28),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(40), borderSide: BorderSide.none),
              filled: true,
              fillColor: Color(0xFFF8F9FE),
              hintText: widget.hintText,
            ),
            cursorColor: AppColors.primaryColor,
            // 校验用户名
            validator: widget.validator),
        widget.isSms
            ? Positioned(
                right: 12,
                top: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    "发送验证码",
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ))
            : Container(),
      ],
    );
  }
}
