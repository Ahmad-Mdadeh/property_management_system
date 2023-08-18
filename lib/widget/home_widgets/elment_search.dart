import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/favorites/favorites_controller.dart';
import 'package:property_management_system/modules/home/home_controller.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/widget/home_widgets/most_viewed_property_card.dart';

class ElementSearch extends StatelessWidget {
  ElementSearch({Key? key}) : super(key: key);
  final _homeController = Get.put(HomeController());
  final _favoritesController = Get.put(FavoritesController());
  final settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(left: 10),
        child: GridView.count(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 0.6,
          shrinkWrap: true,
          primary: false,
          crossAxisCount: 2,
          children: List.generate(
            _homeController.isLoadingProperties.value
                ? _homeController.allProperties.length
                : 5,
            (index) => Obx(
              () => _homeController.isLoadingProperties.value &&
                      _favoritesController.isLoading.value
                  ? MostViewedPropertyCard(
                      index: index,
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                        ),
                        color: Theme.of(context).appBarTheme.backgroundColor,
                      ),
                    )
                      .animate(
                        onPlay: (controller) => controller.repeat(),
                      )
                      .shimmer(
                        color: settingController.isLightMode.value
                            ? ColorManager.grey2.withOpacity(0.3)
                            : ColorManager.ofWhite.withOpacity(0.2),
                        duration: 450.ms,
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
