import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';

class HomePropertyCardShimmer extends StatelessWidget {
   HomePropertyCardShimmer({super.key});
  final settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: MediaQuery.of(context).size.height / 2.7,
      width: MediaQuery.of(context).size.width / 1.5,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        color: Theme.of(context).appBarTheme.backgroundColor,
      ),
    ) .animate(
      onPlay: (controller) => controller.repeat(),
    )
        .shimmer(
      color: settingController.isLightMode.value
          ? ColorManager.grey2.withOpacity(0.3)
          : ColorManager.ofWhite.withOpacity(0.2),
      duration: 450.ms,
    );
  }
}
