import 'package:flutter/material.dart';
import 'package:klimbb/constants/typography.dart';

class CustomFlatButton extends StatelessWidget {
  final GestureTapCallback? onPressed;
  final String? labelText;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final double? radius;
  final double? buttonHeight;

  const CustomFlatButton(
      {Key? key,
      this.onPressed,
      this.labelText,
      this.color,
      this.height,
      this.width,
      this.textColor,
      this.radius,
      this.buttonHeight,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      height: height,
      alignment: Alignment.center,
      width: width,
      child: MaterialButton(
        elevation: 0,
        minWidth: width ?? 40,
        height: buttonHeight,
        color: color,
        textColor: textColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 4)),
            side: BorderSide(color: borderColor!)),
        onPressed: onPressed ?? () {},
        child: Text(
          labelText ?? " ",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
