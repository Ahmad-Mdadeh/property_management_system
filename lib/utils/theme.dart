import 'package:flutter/material.dart';
import 'package:property_management_system/resources/color_manager.dart';

ThemeData getThemeDataDarkMode() => ThemeData(
  primaryColor: ColorManager.lightPrimary,
  primaryColorDark: ColorManager.white,
  scaffoldBackgroundColor: ColorManager.dark,
  appBarTheme: AppBarTheme(
    color: ColorManager.darkPrimary,
    titleTextStyle: const TextStyle(
      color: Colors.white,
    ),
  ),
  colorScheme: ColorScheme.dark(
    background: ColorManager.white,
    primaryContainer: const Color(0Xff43464d),
    onPrimaryContainer: ColorManager.ofWhite,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorManager.darkPrimary,
  ),
  textTheme: TextTheme(
    bodySmall: TextStyle(
      color: ColorManager.ofWhite.withOpacity(0.7),
    ),
    bodyMedium: TextStyle(
      color: ColorManager.white,
    ),
  ),
  iconTheme: IconThemeData(
    color: ColorManager.lightPrimary,
  ),
);

ThemeData getThemeDataLightMode() => ThemeData(
  primaryColor: ColorManager.primary,
  primaryColorLight: ColorManager.black,
  scaffoldBackgroundColor: ColorManager.background,
  appBarTheme: AppBarTheme(
    elevation: 0.5,
    color: ColorManager.white,
    titleTextStyle: TextStyle(
      color: Colors.black.withOpacity(0.7),
    ),
  ),
  colorScheme: ColorScheme.dark(
    background: ColorManager.white,
    primaryContainer: ColorManager.black.withOpacity(0.05),
    onPrimaryContainer: Colors.black.withOpacity(0.7),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: ColorManager.darkPrimary,
  ),
  textTheme: TextTheme(
    bodySmall: TextStyle(
      color: Colors.black.withOpacity(0.6),
    ),
    bodyMedium: TextStyle(
      color: Colors.black.withOpacity(0.7),
    ),
  ),
  iconTheme: IconThemeData(
    color: ColorManager.primary,
  ),
);
