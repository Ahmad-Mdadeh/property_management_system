import 'package:flutter/material.dart';

class ColorManager {
  static Color background = const Color(0xfff8f8f8);
  static Color iconBackground = const Color(0xffcee8e9);
  // static Color primary = const Color.fromARGB(255, 62, 147, 149);
  static Color primary = const Color.fromARGB(255, 10, 141, 144);
  static Color lightPrimary = const Color(0xff51a8a9);
  static Color iconBackgroundDark = const Color(0xff293d44);
  static Color darkPrimary = const Color(0xFF282f39);
  static Color dark = const Color(0xff3b424c);
  static Color error = Colors.red;
  static Color grey1 = const Color(0x287c7878);
  static Color grey3 = const Color(0x17343434);
  static Color grey2 = const Color(0xff797979);
  static Color lightGrey = const Color(0xffa9a9a9);
  static Color white = const Color(0xffFFFFFF);
  static Color ofWhite = const Color(0xFFF5F0F1);
  static Color black = const Color(0xff000000);

  static BoxDecoration gradientBackColor = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF21899C),
        Color(0xF5061C48),
      ],
    ),
  );
}
