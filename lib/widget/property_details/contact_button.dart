import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/text_manager.dart';
import '../../resources/values_manager.dart';

ElevatedButton buildElevatedButton(
  String text,
  IconData icon,
) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorManager.lightPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
    ),
    child: Row(
      children: [
        Icon(
          icon,
          size: AppSize.s22,
          color: ColorManager.darkPrimary,
        ),
        const SizedBox(
          width: 5.0,
        ),
        TextUtils(
          text: text,
          color: ColorManager.darkPrimary,
          fontWeight: FontWeightManager.light,
          fontSize: FontSize.s16,
        ),
      ],
    ),
  );
}
