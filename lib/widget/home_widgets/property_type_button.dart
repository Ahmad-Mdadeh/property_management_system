import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class TabBarPropertyButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? color;
  final Color? colorIcon;
  final Color? colorText;
  final VoidCallback? onPressed;
  final settingController = Get.put(SettingController());

  TabBarPropertyButton({
    required this.text,
    required this.icon,
    this.color,
    this.colorIcon,
    this.colorText,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.035,
      width: MediaQuery.of(context).size.width * 0.35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
