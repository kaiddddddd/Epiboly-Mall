import 'package:MallApp/components/abstract_card_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardContainerHorizontal extends StatelessWidget with MixinContainer {
  var onPressed;

  CardContainerHorizontal({
    Key? key,
    required this.label,
    this.labelAlign,
    this.labelStyle,
    this.labelIconSize,
    this.labelWitch,
    this.content,
    this.rightIcon,
    this.errorText,
    this.visible,
    this.leftIcon,
    this.isRequired = false,
    this.autoValidate = false,
    this.showLine = false,
    this.contentIsRight = false,
    this.labelSuffix,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: buildContainer(
          context,
          Row(
            children: <Widget>[
              buildLabelBlock(context),
              contentIsRight  ? Spacer(): Container(),
              Expanded(
                child: buildDecoratedContent(context),
              ),
              buildRightDecoration()
            ],
          )),
    );
  }

  @override
  bool? autoValidate;

  @override
  Widget? content;

  @override
  String? errorText;

  @override
  bool? isRequired;

  @override
  String label;

  @override
  MainAxisAlignment? labelAlign;

  @override
  double? labelIconSize;

  @override
  TextStyle? labelStyle;

  @override
  Widget? labelSuffix;

  @override
  double? labelWitch;

  @override
  Image? leftIcon;

  @override
  Icon? rightIcon;

  @override
  bool showLine;

  @override
  bool? visible;

  @override
  bool contentIsRight;

}
