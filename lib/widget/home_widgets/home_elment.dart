import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/favorites/favorites_controller.dart';
import 'package:property_management_system/modules/home/home_controller.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/utils/scroll_glow.dart';
import 'package:property_management_system/widget/home_widgets/home_property_card.dart';
import 'package:property_management_system/widget/home_widgets/home_property_card_shimmer.dart';
import 'package:property_management_system/widget/home_widgets/most_viewed_property_card.dart';
import 'package:property_management_system/widget/home_widgets/property_type_button.dart';
import 'package:property_management_system/widget/home_widgets/slide_show.dart';

class HomeElement extends StatelessWidget {
  HomeElement({Key? key}) : super(key: key);
  final _homeController = Get.put(HomeController());
  final _favoritesController = Get.put(FavoritesController());
  final settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.p8,
          ),
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16 / 7,
              autoPlay: true,
              enableInfiniteScroll: true,
              viewportFraction: 1,
              initialPage: 0,
              autoPlayCurve: Curves.easeInOutCubicEmphasized,
              animateToClosest: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
            ),
            items: [
              ...List.generate(
                2,
                (index) => SlideShow(
                  index: index,
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => Padding(
            padding: const EdgeInsets.only(
              top: AppPadding.p10,
              left: 8,
              right: 8,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15.0,
                ),
                border: Border.all(
                  color: settingController.isLightMode.value
                      ? ColorManager.black.withOpacity(0.05)
                      : ColorManager.grey1,
                ),
              ),
              child: TabBar(
                onTap: (value) => {
                  if (_homeController.isSelected.value != value)
                    {
                      _homeController.category =
                          _homeController.typePropertiesName[value],
                      _homeController.getAllPropertiesByFilterCategory(),
                      _homeController.isSelected.value = value,
                    }
                  else
                    _homeController.isSelected.value = value,
                },
                labelPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                isScrollable: true,
                splashBorderRadius: BorderRadius.circular(
                  15.0,
                ),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15.0,
                  ),
                  color: Theme.of(context).iconTheme.color,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                physics: const AlwaysScrollableScrollPhysics(),
                controller: _homeController.tabController,
                tabs: List.generate(
                  _homeController.typePropertiesName.length,
                  (index) => TabBarPropertyButton(
                    text: _homeController.typePropertiesName[index],
                    icon: Icons.villa_rounded,
                    color: Theme.of(context).iconTheme.color,
                    colorIcon: _homeController.isSelected.value == index
                        ? ColorManager.white
                        : Theme.of(context).iconTheme.color,
                    colorText: _homeController.isSelected.value == index
                        ? ColorManager.white
                        : Theme.of(context).textTheme.bodyMedium!.color,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 8,
            top: 10,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 18, 14, 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtils(
                  text: 'featured_properties'.tr,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                  fontWeight: FontWeightManager.regular,
                  fontSize: FontSize.s18,
                ),
                GestureDetector(
                  onTap: () {},
                  child: TextUtils(
                    text: 'see_all'.tr,
                    color: ColorManager.lightGrey,
                    fontWeight: FontWeightManager.light,
                    fontSize: FontSize.s12,
                  ),
                ),
              ],
            ),
          ),
        ),
        Obx(
          () => SizedBox(
            height: 300,
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p8,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _homeController.isLoadingProperties.value
                    ? _homeController.allProperties.length > 5
                        ? 5
                        : _homeController.allProperties.length
                    : 2,
                itemBuilder: (context, index) => Obx(() =>
                    _homeController.isLoadingProperties.value &&
                            _favoritesController.isLoading.value
                        ? HomePropertyCard(
                            index: index,
                          )
                        : HomePropertyCardShimmer()),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: AppPadding.p8,
            top: AppPadding.p8,
            right: AppPadding.p14,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextUtils(
                text: 'most_viewed'.tr,
                color: Theme.of(context).textTheme.bodyMedium!.color,
                fontWeight: FontWeightManager.regular,
                fontSize: FontSize.s16,
              ),
              GestureDetector(
                onTap: () {},
                child: TextUtils(
                  text: 'see_all'.tr,
                  color: ColorManager.lightGrey,
                  fontWeight: FontWeightManager.light,
                  fontSize: FontSize.s12,
                ),
              ),
            ],
          ),
        ),
        Obx(
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
                            color:
                                Theme.of(context).appBarTheme.backgroundColor,
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
        ),
      ],
    );
  }
}
