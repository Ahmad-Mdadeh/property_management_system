import 'package:flutter/material.dart';
import 'package:property_management_system/resources/color_manager.dart';

ThemeData getThemeDataDarkMode() => ThemeData(
      primaryColor: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.white,
      scaffoldBackgroundColor: ColorManager.dark,
      appBarTheme: AppBarTheme(
        backgroundColor: ColorManager.darkPrimary,
        titleTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      colorScheme: ColorScheme.dark(
        background: ColorManager.white,
        primaryContainer: const Color(0Xff43464d),
        onPrimaryContainer: ColorManager.ofWhite,
        onSecondaryContainer: ColorManager.iconBackgroundDark,
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
        bodyLarge: TextStyle(
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
        backgroundColor: ColorManager.white,
        elevation: 0.5,
        titleTextStyle: TextStyle(
          color: Colors.black.withOpacity(0.7),
        ),
      ),
      colorScheme: ColorScheme.light(
        background: ColorManager.white,
        primaryContainer: ColorManager.black.withOpacity(0.05),
        onPrimaryContainer: Colors.black.withOpacity(0.7),
        onSecondaryContainer: ColorManager.iconBackground,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorManager.black.withOpacity(0.02),
      ),
      textTheme: TextTheme(
        bodySmall: TextStyle(
          color:  ColorManager.black.withOpacity(0.6),
        ),
        bodyMedium: TextStyle(
          color: ColorManager.black.withOpacity(0.7),
        ),
        bodyLarge: TextStyle(
          color: ColorManager.black,
        ),
      ),
      iconTheme: IconThemeData(
        color: ColorManager.primary,
      ),
    );
