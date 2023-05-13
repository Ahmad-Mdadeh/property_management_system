import 'package:flutter/material.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';


GestureDetector circularButton(IconData icon) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      decoration:
          BoxDecoration(color: ColorManager.white, shape: BoxShape.circle),
      child: Padding(
          padding:  const EdgeInsets.all(AppPadding.p4),
          child: Icon(
            icon,
            color: ColorManager.primary,
            size: AppSize.s26,
          )),
    ),
  );
}
