import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/properties/Properties_card.dart';
import 'package:property_management_system/widget/properties/properties_rent_sell_button.dart';
import 'package:shimmer/shimmer.dart';

class PropertiesScreen extends StatelessWidget {
  PropertiesScreen({Key? key}) : super(key: key);

  final RxBool x = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextUtils(
          text: "My Properties",
          color: ColorManager.white,
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
          PropertiesRentSellButton(),
          Expanded(
            child: Obx(
                  () {
                if (x.value) {
                  return AnimationLimiter(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 8,
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
                                ),
                                child: PropertiesCard(),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  Timer(
                    const Duration(seconds: 4),
                        () {
                      x.value = true;
                    },
                  );
                  return Shimmer.fromColors(
                    period: const Duration(milliseconds: 350),
                    highlightColor: ColorManager.ofWhite.withOpacity(0.2),
                    baseColor: ColorManager.darkPrimary,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 1.4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p10,
                        ),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  15.0,
                                ),
                                border: Border.all(
                                  width: 0.8,
                                  color: ColorManager.ofWhite.withOpacity(0.2),
                                ),
                              ),
                              child: Container(
                                width: double.infinity,
                                height:
                                MediaQuery.of(context).size.height / 5.5,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      "assets/images/property.png",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    15.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
