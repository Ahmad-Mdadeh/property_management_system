import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/favorites/favorites_controller.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/favorites/favorites_list.dart';
import 'package:property_management_system/widget/favorites/favorites_list_shimmer.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);
  final _favoritesController = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(
                AppSize.s24,
              ),
              bottomLeft: Radius.circular(
                AppSize.s24,
              ),
            ),
          ),
          title: TextUtils(
            text: 'Favorite'.tr,
            fontWeight: FontWeightManager.regular,
            fontSize: FontSize.s20,
          ),
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p8,
            ),
            child: _favoritesController.isLoading.value
                ? FavoritesListWidget()
                : FavoritesListShimmerWidget(),
          ),
        ),
      ),
    );
  }
}
