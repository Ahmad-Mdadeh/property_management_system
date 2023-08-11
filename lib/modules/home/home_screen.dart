import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/filters/filters_screen.dart';
import 'package:property_management_system/modules/home/home_controller.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/utils/scroll_glow.dart';
import 'package:property_management_system/widget/home_widgets/home_property_card.dart';
import 'package:property_management_system/widget/home_widgets/most_viewed_property_card.dart';
import 'package:property_management_system/widget/home_widgets/property_type_button.dart';
import 'package:property_management_system/widget/home_widgets/slide_show.dart';
import 'package:property_management_system/widget/home_widgets/home_property_card_shimmer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());
  final settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          text: 'home'.tr,
          fontWeight: FontWeightManager.regular,
          fontSize: FontSize.s20,
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                          border: settingController.isLightMode.value
                              ? Border.all(
                                  color: ColorManager.black.withOpacity(0.05),
                                )
                              : null,
                          color: Theme.of(context).appBarTheme.backgroundColor,
                        ),
                        child: TextField(
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                            fontFamily: 'Outfit',
                          ),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                              fontFamily: 'Outfit',
                            ),
                            hintText: 'search'.tr,
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 16.0,
                            ),
                          ),
                          onChanged: (value) {},
                          cursorColor: ColorManager.primary,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: settingController.isLightMode.value
                            ? Border.all(
                                color: ColorManager.black.withOpacity(0.05),
                              )
                            : null,
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                        color: Theme.of(context).appBarTheme.backgroundColor,
                      ),
                      margin: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.filter_list,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        onPressed: () {
                          Get.to(
                            FiltersScreen(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  // scrollDirection: ,
                  height: MediaQuery.of(context).size.height / 5.4,
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
                    4,
                    (index) => const SlideShow(),
                  ),
                ],
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(
                    top: AppPadding.p10,
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
                        4,
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
              SizedBox(
                height: 300,
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) => Obx(
                      () => _homeController.isLoadingProperties.value
                          ? HomePropertyCard(
                              index: index,
                            )
                          : const HomePropertyCardShimmer()
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
              GridView.count(
                childAspectRatio: 0.58,
                shrinkWrap: true,
                primary: false,
                crossAxisCount: 2,
                children: List.generate(
                  9,
                  (index) => Obx(
                    () => _homeController.isLoadingProperties.value
                        ? MostViewedPropertyCard(
                            index: index,
                          )
                        : Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
            ],
          ),
        ),
      ),
    );
  }
}
