import 'package:flutter/material.dart';
import 'package:property_management_system/resources/font_manager.dart';

import '../../resources/color_manager.dart';
import '../../resources/text_manager.dart';

ClipRRect buildTag(
    {String? text,
    required double width,
    required double height,
    required double fontSize,
    required Color color}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(5),
    child: Container(
      height: height,
      width: width,
      color: ColorManager.primary,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Center(
        child: TextUtils(
          text: text!,
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeightManager.light,
        ),
      ),
    ),
  );
}
