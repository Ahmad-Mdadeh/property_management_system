import 'package:flutter/material.dart';
import 'package:property_management_system/resources/font_manager.dart';

import '../../resources/color_manager.dart';
import '../../resources/text_manager.dart';

ClipRRect buildTag(String? text, double width) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(5),
    child: Container(
      height: 30,
      width: width,
      color: ColorManager.lightPrimary,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Center(
        child: TextUtils(
          text: text!,
          fontSize: 12,
          color: ColorManager.darkPrimary,
          fontWeight: FontWeightManager.light,
        ),
      ),
    ),
  );
}
