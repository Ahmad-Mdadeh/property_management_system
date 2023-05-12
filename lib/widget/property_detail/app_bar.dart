import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

AppBar buildAppBar() {
  return AppBar(
    actionsIconTheme: IconThemeData(color: ColorManager.primary),
    actions: <Widget>[
      Padding(
          padding: const EdgeInsets.only(right: AppPadding.p20),
          child: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.stacked_bar_chart_rounded,
              size: AppSize.s28,
            ),
          )),
      Padding(
          padding: const EdgeInsets.only(right: AppPadding.p20),
          child: GestureDetector(
            onTap: () {},
            child: const Icon(Icons.share),
          )),
    ],
    backgroundColor: ColorManager.white,
  );
}
