import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/property_detail/property_details_controller.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/property_details/app_bar.dart';
import 'package:property_management_system/widget/property_details/expandable_text.dart';
import 'package:property_management_system/widget/property_details/property_card.dart';
import 'package:property_management_system/widget/property_details/property_detail_bottom_bar.dart';
import 'package:property_management_system/widget/property_details/property_rate.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => NavigationController());
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.only(
          left: AppPadding.p8,
          right: AppPadding.p8,
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.find<NavigationController>().goToImageOverlay(
                  ImagesAssets.building,
                );
              },
              child: const PropertyCard(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.p12,
                left: AppPadding.p8,
                right: AppPadding.p8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: ColorManager.primary,
                          ), // depends on the type
                          const SizedBox(
                            width: AppSize.s10,
                          ),
                          TextUtils(
                            text: 'Property type',
                            color: ColorManager.dark,
                            fontSize: FontSize.s15,
                            fontWeight: FontWeightManager.light,
                          )
                        ],
                      ),
                      // buildTag(
                      //   'Rent',
                      //   AppSize.s50,
                      // ),
                      TextUtils(
                          text: 'Rent',
                          color: ColorManager.primary,
                          fontWeight: FontWeight.w400,
                          fontSize: AppSize.s16)
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextUtils(
                            text: 'Property Name',
                            color: ColorManager.black,
                            fontWeight: FontWeightManager.regular,
                            fontSize: FontSize.s22,
                          ),
                          const SizedBox(
                            height: AppSize.s16,
                          ),
                          TextUtils(
                            text: '\$ 500 000',
                            color: ColorManager.primary,
                            fontWeight: FontWeightManager.regular,
                            fontSize: FontSize.s22,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  buildPropertyRate(
                    Icons.fitness_center,
                    'Fitness',
                    '10',
                  ),
                  Divider(
                    height: AppSize.s40,
                    color: ColorManager.dark,
                  ),
                  TextUtils(
                    color: ColorManager.dark,
                    fontWeight: FontWeightManager.regular,
                    fontSize: FontSize.s20,
                    text: 'About this property',
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  ExpandableText(
                    color: ColorManager.dark,
                    fontWeight: FontWeightManager.regular,
                    fontSize: FontSize.s16,
                    text:
                        'About this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this property',
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  TextUtils(
                    color: ColorManager.dark,
                    fontWeight: FontWeightManager.regular,
                    fontSize: FontSize.s20,
                    text: 'Listed By',
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        child: Container(
                          color: ColorManager.testing,
                          height: AppSize.s60,
                          width: AppSize.s60,
                          child: const Icon(
                            Icons.person_4_rounded,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: AppSize.s12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextUtils(
                            text: 'Komai AlFares',
                            color: ColorManager.dark,
                            fontWeight: FontWeightManager.regular,
                            fontSize: FontSize.s14,
                          ),
                          TextUtils(
                            text: 'komai.fares.ww@gmail.com',
                            color: ColorManager.black,
                            fontWeight: FontWeightManager.regular,
                            fontSize: FontSize.s16,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  TextUtils(
                    color: ColorManager.dark,
                    fontWeight: FontWeightManager.regular,
                    fontSize: FontSize.s20,
                    text: 'Location',
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  TextUtils(
                    color: ColorManager.dark,
                    fontWeight: FontWeightManager.regular,
                    fontSize: FontSize.s18,
                    text: 'Address :',
                  ),
                  const SizedBox(
                    height: AppSize.s4,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.edit_location_outlined,
                        color: ColorManager.primary,
                      ),
                      TextUtils(
                        text: 'Damascus, Mazzeh, Street 25, floor 5',
                        color: ColorManager.dark,
                        fontWeight: FontWeightManager.regular,
                        fontSize: FontSize.s14,
                      ),
                    ],
                  ),
                  Card(
                    color: ColorManager.testing,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),
                    child: Stack(
                      children: const <Widget>[
                        SizedBox(
                          width: double.infinity,
                          height: AppSize.s225,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                25.0,
                              ),
                            ),
                            child: Icon(
                              Icons.map,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: const PropertyDetailBottomBar(),
    );
  }
}
