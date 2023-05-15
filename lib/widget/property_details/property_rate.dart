import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/text_manager.dart';
import '../../resources/values_manager.dart';

Widget buildPropertyRate(IconData icon, String name, String rate) {
  return Row(
    children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: ColorManager.iconBackground2,
            height: AppSize.s40,
            width: AppSize.s40,
            child: Icon(
              icon,
              color: ColorManager.lightPrimary,
            ),
          )),
      const SizedBox(
        width: AppSize.s12,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils(
              text: name,
              color: ColorManager.ofWhite,
              fontWeight: FontWeightManager.regular,
              fontSize: FontSize.s14),
          TextUtils(
            text: rate,
            color: ColorManager.white,
            fontWeight: FontWeightManager.regular,
            fontSize: FontSize.s16,
          ),
        ],
      )
    ],
  );
}
