import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/text_manager.dart';
import '../../resources/values_manager.dart';

Widget buildPropertyRate(IconData icon, String name, String rate,BuildContext context) {
  return Row(
    children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            height: AppSize.s40,
            width: AppSize.s40,
            child: Icon(
              icon,
              color: Theme.of(context).iconTheme.color,
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
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .color,
              fontWeight: FontWeightManager.regular,
              fontSize: FontSize.s14),
          TextUtils(
            text: rate,
            color: Theme.of(context)
                .textTheme
                .bodyLarge!
                .color,
            fontWeight: FontWeightManager.regular,
            fontSize: FontSize.s16,
          ),
        ],
      )
    ],
  );
}
