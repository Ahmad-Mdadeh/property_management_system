import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/favorites/favorites_controller.dart';
import 'package:property_management_system/modules/property_detail/property_details_screen.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class FavoritesListShimmerWidget extends StatelessWidget {
  FavoritesListShimmerWidget({Key? key}) : super(key: key);
  final _favoritesController = Get.put(FavoritesController());
  final _settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(
        height: AppSize.s7,
      ),
      itemBuilder: (context, index) => Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5.5,
            decoration: BoxDecoration(
              color: Theme.of(context).appBarTheme.backgroundColor,
              borderRadius: BorderRadius.circular(
                15.0,
              ),
              border: Border.all(
                width: 1.5,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
          ),
        ],
      ),
    ).animate(
        onPlay: (controller) => controller.repeat(),
      ).shimmer(
        color: _settingController.isLightMode.value
            ? ColorManager.grey2.withOpacity(0.3)
            : ColorManager.ofWhite.withOpacity(0.2),
        duration: 450.ms,
      );
  }
}
