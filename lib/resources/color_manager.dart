import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color(0xFFF56B3F);
  static Color lightPrimary = const Color(0xFFFE9879);
  static Color blue = const Color(0xFF21899C);
  static Color blueField = const Color(0xFF4DA1B0);
  static Color darkColor = const Color(0xFF121212);
  static Color blue2 = Colors.blueAccent;
  static Color darkGrey = const Color(0xff525252);
  static Color grey = const Color(0xff737477);
  static Color grey1 = const Color(0x287c7878);
  static Color grey2 = const Color(0xff797979);
  static Color lightGrey = const Color(0xffa9a9a9);
  static Color white = const Color(0xffFFFFFF);
  static Color ofWhite = const Color(0xFFF5F0F1);
  static Color red = const Color(0xffE61F34);
  static Color black = const Color(0xff000000);

  static BoxDecoration gradientBackColor = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF21899C),
        Color(0xFFF56B3F),
      ],
    ),
  );
  static BoxDecoration gradientBackColorCard = BoxDecoration(
    borderRadius: BorderRadius.circular(20.0,),
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
