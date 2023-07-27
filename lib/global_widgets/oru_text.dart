import 'package:flutter/material.dart';

import '../utils/oru_colors.dart';

class OruText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final String? fontFamily;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Color? decorationColor;

  const OruText({
    required this.text,
    this.fontSize,
    this.fontColor,
    this.fontWeight,
    this.fontFamily,
    this.textAlign,
    this.textDecoration,
    this.decorationColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: fontColor ?? OruColors.black,
        fontWeight: fontWeight ?? FontWeight.w200,
        fontSize: fontSize ?? 16,
        fontFamily: fontFamily,
        decoration: textDecoration,
        decorationColor: decorationColor ?? OruColors.yellow,
        decorationThickness: 1,
      ),
    );
  }
}
