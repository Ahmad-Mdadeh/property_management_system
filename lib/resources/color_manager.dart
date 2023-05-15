import 'package:flutter/material.dart';

class ColorManager {
  static Color testing = const Color(0xffcee8e9);
  static Color primary = const Color.fromARGB(255, 10, 141, 144);
  static Color lightPrimary =  const Color(0xff51a8a9);
  static Color darkPrimary2 = const Color(0xff293d44);
  static Color darkPrimary = const Color(0xFF282f39);
  static Color k2 = const Color(0xFF282f39);
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
  static BoxDecoration gradientBackColorCard = BoxDecoration(
    borderRadius: BorderRadius.circular(
      20.0,
    ),
    gradient: const LinearGradient(
      colors: [
        Color(0xFF21899C),
        Color(0xFFF56B3F),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    boxShadow: const [
      BoxShadow(
        color: Color(0xFFF56B3F),
        blurRadius: 9,
        offset: Offset(0, 0.9),
      ),
    ],
  );
}
