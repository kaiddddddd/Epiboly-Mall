import 'package:MallApp/components/abstract_card_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardContainerHorizontal extends StatelessWidget with MixinContainer {
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
    this.labelSuffix
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildContainer(
        context,
        Row(
          children: <Widget>[
            buildLabelBlock(context),
            Expanded(
              child: buildDecoratedContent(context),
            ),
            buildRightDecoration()
          ],
        ));
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

}
