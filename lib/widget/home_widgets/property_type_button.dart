import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

final settingController = Get.put(SettingController());

Container buildPropertyButton(
  String text,
  IconData icon,
  Color? color,
  Color? colorIcon,
  Color? colorText,
  VoidCallback onPressed,
) {
  return Container(
    height: 35,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        7.0,
      ),
      border: settingController.isLightMode.value
          ? Border.all(
              color: ColorManager.black.withOpacity(0.05),
            )
          : null,
    ),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.black.withOpacity(0.2),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            7.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: AppSize.s20,
            color: colorIcon,
          ),
          const SizedBox(
            width: 5.0,
          ),
          TextUtils(
            text: text,
            color: colorText,
            fontWeight: FontWeightManager.light,
            fontSize: FontSize.s14,
          ),
        ],
      ),
    ),
  );
}
