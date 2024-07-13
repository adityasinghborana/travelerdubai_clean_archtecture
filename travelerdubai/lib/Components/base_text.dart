import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool? isUpperCase;
  final TextAlign textAlign;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextStyle? style;
  final TextOverflow overflow;
  final Color? textColor;
  final double? letterSpacing;
  final TextDecoration textDecoration;
  final int maxLines;
  final String fontFamily;
  final double? lineHeight;
  final List<Shadow>? shadows;
  const BaseText({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.start,
    this.style,
    this.overflow = TextOverflow.ellipsis,
    this.textColor,
    this.textDecoration = TextDecoration.none,
    this.fontSize = 16,
    this.isUpperCase = false,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.maxLines = 20,
    this.fontFamily = 'LatoRegular',
    this.lineHeight,
    this.shadows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      isUpperCase != null ? text : text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: style ??
          TextStyle(
              height: lineHeight,
              shadows: shadows,
              color: textColor ?? Colors.white,
              decoration: textDecoration,
              fontFamily: fontFamily,
              fontSize: fontSize,
              overflow: TextOverflow.ellipsis,
              letterSpacing: letterSpacing ?? 0,
              fontWeight: fontWeight ?? FontWeight.w400,
              fontStyle: fontStyle ?? FontStyle.normal),
    );
  }
}
