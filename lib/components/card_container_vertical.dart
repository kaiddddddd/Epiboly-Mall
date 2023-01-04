import 'package:flutter/material.dart';

import 'abstract_card_container.dart';

// ignore: must_be_immutable
class CardContainerVertical extends StatelessWidget with MixinContainer {
  CardContainerVertical(
      {Key? key,
      required this.label,
      this.labelAlign,
      this.labelStyle,
      this.labelIconSize,
      this.labelWitch,
      this.space,
      this.content,
      this.rightIcon,
      this.errorText,
      this.visible,
      this.leftIcon,
      this.isRequired = false,
      this.autoValidate = false,
      this.showLine = false,
      this.labelSuffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildContainer(context);
  }

  Widget _buildContainer(BuildContext context) {
    return buildContainer(
        context,
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: buildLabelBlock(context),
                ),
                buildRightDecoration()
              ],
            ),
            SizedBox(height: space ?? 10),
            buildDecoratedContent(context)
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

  double? space;
}
