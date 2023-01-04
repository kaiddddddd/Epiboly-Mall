import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

abstract class CardContainerBean {
  String label = "";
  double? labelWitch;
  Widget? content;
  bool? visible;
  String? errorText;
  Image? leftIcon;
  Icon? rightIcon;
  bool? isRequired;
  MainAxisAlignment? labelAlign;
  TextStyle? labelStyle;
  double? labelIconSize;
  bool? autoValidate;
  bool showLine = false;
  Widget? labelSuffix;
}


mixin MixinContainer implements CardContainerBean {
  buildContainer(BuildContext context, Widget child) {
    if (visible ?? true) {
      return Material(
        color: Colors.transparent,
        child: Container(
          decoration: showLine
              ? BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 1.0, color: Theme.of(context).dividerColor),
                  ),
                )
              : null,
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: child,
        ),
      );
    }
    return Container();
  }

  _buildRequiredIndicator(BuildContext context) {
    if (isRequired == null || isRequired == false) return Container();
    return Container(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "*",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  _buildLabelText(BuildContext context) {
    // make long label to wrap to the second line
    return Flexible(
      child: Text(
        label,
        softWrap: true,
        style: labelStyle ??
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
  }

  _buildLeftImage(BuildContext context) {
    TextStyle? labelStyle = Theme.of(context).inputDecorationTheme.labelStyle;
    return (leftIcon == null)
        ? Container()
        : Container(
            child: leftIcon
          );
  }

  _buildLabelSpacer(BuildContext context) {
    return ((labelAlign ?? TextAlign.left) == TextAlign.right)
        ? Expanded(child: Container())
        : Container();
  }

  buildLabelBlock(BuildContext context) {
    return Container(
      width: labelWitch ?? 100,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildLeftImage(context),
          SizedBox(width: 12),
          _buildLabelSpacer(context),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: labelAlign ?? MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildLabelText(context),
                  labelSuffix ?? Container(),
                  _buildRequiredIndicator(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildRightDecoration() {
    return (rightIcon != null)
        ? Container(alignment: Alignment.centerRight, child: rightIcon)
        : Container();
  }

  buildDecoratedContent(BuildContext context) {
    var decoratedContent = content;
    if (content is TextField || content is TextFormField || content is Row) {
      // do nothing, these already have built in InputDecorations
    } else {
      // wrap in a decorator to show validation errors
      InputDecoration decoration = const InputDecoration()
          .applyDefaults(Theme.of(context).inputDecorationTheme)
          .copyWith(
              errorText: errorText,
              contentPadding: EdgeInsets.all(0.0),
              isDense: true,
              border: InputBorder.none);

      decoratedContent = InputDecorator(decoration: decoration, child: content);

      print('decoratedContent${decoratedContent.toString()}');
    }

    return decoratedContent;
  }
}
