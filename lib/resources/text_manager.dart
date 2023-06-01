import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final String fontFamily;
  final Color? color;
  final Color? backgroundColor;
  final FontWeight fontWeight;
  final double fontSize;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final double? height;

  const TextUtils({
    Key? key,
    required this.text,
    this.color,
    required this.fontWeight,
    required this.fontSize,
    this.fontFamily = 'Outfit',
    this.maxLines,
    this.textDecoration,
    this.textAlign,
    this.textOverflow,
    this.height,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        backgroundColor: backgroundColor,
        height: height,
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        overflow: textOverflow,
        fontWeight: fontWeight,
        decoration: textDecoration,
      ),
    );
  }
}

class TextUtils2 extends StatelessWidget {
  final String text;
  final String fontFamily;
  final Color? backgroundColor;
  final FontWeight fontWeight;
  final double fontSize;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final double? height;

  const TextUtils2({
    Key? key,
    required this.text,
    required this.fontWeight,
    required this.fontSize,
    this.fontFamily = 'Outfit',
    this.maxLines,
    this.textDecoration,
    this.textAlign,
    this.textOverflow,
    this.height,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        backgroundColor: backgroundColor,
        height: height,
        fontSize: fontSize,
        fontFamily: fontFamily,
        overflow: textOverflow,
        fontWeight: fontWeight,
        decoration: textDecoration,
      ),
    );
  }
}
