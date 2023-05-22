import 'package:flutter/material.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/text_manager.dart';
import '../../resources/values_manager.dart';

ElevatedButton buildPropertyButton(String text, IconData icon, Color color) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
    ),
    child: Row(
      children: [
        Icon(
          icon,
          size: AppSize.s22,
          color: ColorManager.lightPrimary,
        ),
        const SizedBox(
          width: 5.0,
        ),
        TextUtils(
          text: text,
          color: ColorManager.white,
          fontWeight: FontWeightManager.light,
          fontSize: FontSize.s16,
        ),
      ],
    ),
  );
}
