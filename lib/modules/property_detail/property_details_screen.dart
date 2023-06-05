import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/base/base_screen.dart';
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
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widget/property_details/contact_button.dart';
import '../map/map_screen.dart';

class PropertyDetailsScreen extends StatelessWidget {
  PropertyDetailsScreen({super.key});

  final PropertyDetailsController mapController =
      Get.put(PropertyDetailsController());

  @override
  Widget build(BuildContext context) {
    Get.put<PropertyDetailsController>(PropertyDetailsController());
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.only(
              left: AppPadding.p8,
              right: AppPadding.p8,
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.find<PropertyDetailsController>().goToImageOverlay(
                      ImagesAssets.building,
                    );
                  },
                  child: PropertyCard(),
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
                                color: ColorManager.lightGrey,
                                fontSize: FontSize.s15,
                                fontWeight: FontWeightManager.light,
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width / 40,
                              vertical:
                                  MediaQuery.of(context).size.height / 200,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorManager.primary,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                5.0,
                              ),
                            ),
                            child: TextUtils(
                              text: 'Rent',
                              color: ColorManager.primary,
                              fontWeight: FontWeight.w400,
                              fontSize: AppSize.s14,
                            ),
                          )
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
                                color: ColorManager.white,
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
                        color: ColorManager.primary,
                      ),
                      TextUtils(
                        color: ColorManager.white,
                        fontWeight: FontWeightManager.regular,
                        fontSize: FontSize.s20,
                        text: 'About this property',
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      ExpandableText(
                        color: ColorManager.lightGrey,
                        fontWeight: FontWeightManager.light,
                        fontSize: FontSize.s16,
                        text:
                            'About this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this property',
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      TextUtils(
                        color: ColorManager.white,
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
                              color: ColorManager.iconBackground2,
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
                                color: ColorManager.white,
                                fontWeight: FontWeightManager.regular,
                                fontSize: FontSize.s14,
                              ),
                              TextUtils(
                                text: 'komai.fares.ww@gmail.com',
                                color: ColorManager.ofWhite,
                                fontWeight: FontWeightManager.light,
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
                        color: ColorManager.white,
                        fontWeight: FontWeightManager.regular,
                        fontSize: FontSize.s20,
                        text: 'Location',
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      TextUtils(
                        color: ColorManager.white,
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
                            color: ColorManager.white,
                            fontWeight: FontWeightManager.regular,
                            fontSize: FontSize.s14,
                          ),
                        ],
                      ),
                      Card(
                        color: ColorManager.iconBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                        child: Stack(
                          children: <Widget>[
                            SizedBox(
                              width: double.infinity,
                              height: AppSize.s250,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(
                                    25.0,
                                  ),
                                ),
                                child: Obx(
                                  () => GoogleMap(
                                    buildingsEnabled: false,
                                    liteModeEnabled: true,
                                    compassEnabled: true,
                                    myLocationEnabled: true,
                                    scrollGesturesEnabled: true,
                                    myLocationButtonEnabled: true,
                                    trafficEnabled: true,
                                    onTap: (argument) {
                                      Get.to(
                                        MapScreen(),
                                      );
                                    },
                                    onMapCreated: mapController.onMapCreated,
                                    markers: mapController.markers.toSet(),
                                    initialCameraPosition: CameraPosition(
                                      target:
                                          mapController.initialPosition.value,
                                      zoom: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildElevatedButton(
                              'Send Enquiry', Icons.manage_search_rounded),
                          buildElevatedButton(
                              'Interest', Icons.interests_rounded),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const PropertyDetailBottomBar(),
      ),
    );
  }
}
