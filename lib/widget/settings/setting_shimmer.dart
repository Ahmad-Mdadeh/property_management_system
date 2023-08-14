import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class ShimmerSetting extends StatelessWidget {
   ShimmerSetting({Key? key}) : super(key: key);
  final _settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: AppPadding.p24,
            bottom: AppPadding.p24,
            left: AppPadding.p20,
            right: AppPadding.p20,
          ),
          child: Container(
            padding: const EdgeInsets.only(
              top: AppPadding.p20,
              left: AppPadding.p20,
              right: AppPadding.p12,
            ),
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 0.16,
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primaryContainer,
                width: 2,
              ),
              color: Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(
                AppSize.s18,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: AppPadding.p24,
            left: AppPadding.p20,
            right: AppPadding.p20,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            padding: const EdgeInsets.only(
              top: AppPadding.p20,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
              border: Border.all(
                color: Theme.of(context).colorScheme.primaryContainer,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(
                AppSize.s18,
              ),
            ),
          ),
        ),
      ],
    )
        .animate(
      onPlay: (controller) => controller.repeat(),
    )
        .shimmer(
      color: _settingController.isLightMode.value
          ? ColorManager.grey2.withOpacity(0.3)
          : ColorManager.ofWhite.withOpacity(0.2),
      duration: 450.ms,
    );
  }
}
