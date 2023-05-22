import 'package:flutter/material.dart';
import 'package:property_management_system/resources/color_manager.dart';

ThemeData getThemeDataDarkMode() => ThemeData(
  primaryColor:ColorManager.lightPrimary,
  primaryColorDark: ColorManager.white,
      scaffoldBackgroundColor: ColorManager.dark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorManager.darkPrimary,
      ),
      appBarTheme: AppBarTheme(
        color: ColorManager.darkPrimary,
        titleTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white,
        ),
      ),
      iconTheme: IconThemeData(
        color: ColorManager.lightPrimary,
      ),
    );

ThemeData getThemeDataLightMode() => ThemeData(
  primaryColor:ColorManager.primary,
      primaryColorLight: ColorManager.black,
      scaffoldBackgroundColor: ColorManager.ofWhite,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorManager.darkPrimary.withOpacity(
          0.8,
        ),
      ),
      appBarTheme: AppBarTheme(
        color: ColorManager.ofWhite,
        titleTextStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.black,
        ),
      ),
      iconTheme: IconThemeData(
        color: ColorManager.primary,
      ),
    );
