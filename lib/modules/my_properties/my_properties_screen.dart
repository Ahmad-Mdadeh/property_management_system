import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/my_properties/my_properties_controller.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/my_properties/my_properties_card.dart';
import 'package:property_management_system/widget/my_properties/my_properties_rent_sell_button.dart';

class MyPropertiesScreen extends StatelessWidget {
  MyPropertiesScreen({Key? key}) : super(key: key);
  final _myPropertiesController = Get.put(MyPropertiesController());
  final _settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextUtils(
          text: "my_property".tr,
          fontWeight: FontWeightManager.regular,
          fontSize: FontSize.s20,
        ),
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
      ),
      body: Column(
        children: [
          MyPropertiesRentSellButton(),
          Expanded(
            child: Obx(
              () => _myPropertiesController.isLoading.value
                  ? AnimationLimiter(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _myPropertiesController.isSelectedRent.value
                            ? _myPropertiesController.postRent.length
                            : _myPropertiesController.postSale.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            delay: const Duration(milliseconds: 150),
                            child: SlideAnimation(
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.fastLinearToSlowEaseIn,
                              child: FadeInAnimation(
                                curve: Curves.fastLinearToSlowEaseIn,
                                duration: const Duration(milliseconds: 1500),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 10.0,
                                  ),
                                  child: MyPropertiesCard(index: index),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 10.0,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height / 7,
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(context).appBarTheme.backgroundColor,
                              border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                      .animate(onPlay: (controller) => controller.repeat())
                      .shimmer(
                        color: _settingController.isLightMode.value
                            ? ColorManager.grey2.withOpacity(0.3)
                            : ColorManager.ofWhite.withOpacity(0.2),
                        duration: 450.ms,
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
