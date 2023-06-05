import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/text_manager.dart';
import '../../resources/values_manager.dart';

ElevatedButton buildElevatedButton(
  String text,
  IconData icon,
  BuildContext context,
) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).iconTheme.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: AppSize.s22,
          color: ColorManager.white,
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
