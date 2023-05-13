import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

AppBar buildAppBar() {
  return AppBar(
    leading: IconButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        Icons.arrow_back,
        color: ColorManager.primary,
      ),
    ),
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
