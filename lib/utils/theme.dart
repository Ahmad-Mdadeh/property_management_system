import 'package:flutter/material.dart';
import 'package:property_management_system/resources/color_manager.dart';

class ThemeApp {
  static final light = ThemeData(
    primaryColor: ColorManager.primary,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    primaryColor: ColorManager.grey1,
    brightness: Brightness.dark,
  );
}
