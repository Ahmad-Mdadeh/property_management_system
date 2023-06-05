import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/map/map_screen.dart';
import 'package:property_management_system/modules/property_detail/property_details_controller.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/property_details/contact_button.dart';
import 'package:property_management_system/widget/property_details/expandable_text.dart';
import 'package:property_management_system/widget/property_details/property_card.dart';
import 'package:property_management_system/widget/property_details/property_detail_bottom_bar.dart';
import 'package:property_management_system/widget/property_details/property_rate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PropertyDetailsScreen extends StatelessWidget {
  final BuildContext contextPropertyDetailsScreen;

  PropertyDetailsScreen({super.key, context, required this.contextPropertyDetailsScreen});

  final PropertyDetailsController mapController =
      Get.put(PropertyDetailsController());

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(contextPropertyDetailsScreen).iconTheme.color,
            ),
          ),
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: AppPadding.p20),
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.stacked_bar_chart_rounded,
                    size: AppSize.s28,
                    color: Theme.of(contextPropertyDetailsScreen).iconTheme.color,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(right: AppPadding.p20),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.share,
                  color: Theme.of(contextPropertyDetailsScreen).iconTheme.color,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
            ),
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
                                  color: Theme.of(contextPropertyDetailsScreen).iconTheme.color,
                                ), // depends on the type
                                const SizedBox(
                                  width: AppSize.s10,
                                ),
                                TextUtils(
                                  text: 'Property type',
                                  color: Theme.of(contextPropertyDetailsScreen)
                                      .textTheme
                                      .bodySmall!
                                      .color,
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
                                  color: Theme.of(contextPropertyDetailsScreen).iconTheme.color!,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(
                                  5.0,
                                ),
                              ),
                              child: TextUtils(
                                text: 'Rent',
                                color: Theme.of(contextPropertyDetailsScreen).iconTheme.color,
                                fontWeight: FontWeight.w400,
                                fontSize: AppSize.s14,
                              ),
                            ),
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
                                  color: Theme.of(contextPropertyDetailsScreen)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: FontSize.s22,
                                ),
                                const SizedBox(
                                  height: AppSize.s16,
                                ),
                                TextUtils(
                                  text: '\$ 500 000',
                                  color: Theme.of(contextPropertyDetailsScreen).iconTheme.color,
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
                          contextPropertyDetailsScreen,
                        ),
                        Divider(
                          height: AppSize.s40,
                          color: ColorManager.primary,
                        ),
                        TextUtils(
                          color: Theme.of(contextPropertyDetailsScreen).textTheme.bodyMedium!.color,
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
                          fontSize: FontSize.s15,
                          text:
                              'About this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this propertyAbout this property',
                        ),
                        const SizedBox(
                          height: AppSize.s32,
                        ),
                        TextUtils(
                          color: Theme.of(contextPropertyDetailsScreen).textTheme.bodyMedium!.color,
                          fontWeight: FontWeightManager.regular,
                          fontSize: FontSize.s20,
                          text: 'Listed By',
                        ),
                        const SizedBox(
                          height: AppSize.s14,
                        ),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                              child: Container(
                                color: Theme.of(contextPropertyDetailsScreen).colorScheme.onSecondaryContainer,
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
                                  color: Theme.of(contextPropertyDetailsScreen)
                                      .textTheme
                                      .bodyMedium!
                                      .color,
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: FontSize.s14,
                                ),
                                TextUtils(
                                  text: 'komai.fares.ww@gmail.com',
                                  color: Theme.of(contextPropertyDetailsScreen)
                                      .textTheme
                                      .bodySmall!
                                      .color,
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
                          color: Theme.of(contextPropertyDetailsScreen).textTheme.bodyMedium!.color,
                          fontWeight: FontWeightManager.regular,
                          fontSize: FontSize.s19,
                          text: 'Location',
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        TextUtils(
                          color:
                              Theme.of(contextPropertyDetailsScreen).textTheme.bodyMedium!.color,
                          fontWeight: FontWeightManager.regular,
                          fontSize: FontSize.s16,
                          text: 'Address :',
                        ),
                        const SizedBox(
                          height: AppSize.s4,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.edit_location_outlined,
                              color: Theme.of(contextPropertyDetailsScreen).iconTheme.color,
                              size: AppSize.s16,
                            ),
                            const SizedBox(
                              width: AppSize.s4,
                            ),
                            TextUtils(
                              text: 'Damascus, Mazzeh, Street 25, floor 5',
                              color: Theme.of(contextPropertyDetailsScreen)
                                  .textTheme
                                  .bodySmall!
                                  .color,
                              fontWeight: FontWeightManager.regular,
                              fontSize: FontSize.s12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s8,
                        ),
                        Card(
                          color: Theme.of(contextPropertyDetailsScreen).colorScheme.onSecondaryContainer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          child: Stack(
                            children: <Widget>[
                              SizedBox(
                                width: double.infinity,
                                height: AppSize.s275,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      10.0,
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
                                        Get.to( ()=>
                                          MapScreen(contextMapScreen:contextPropertyDetailsScreen,),
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
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: AppSize.s20,
                            top: AppSize.s4,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: buildElevatedButton(
                                  'Send Enquiry',
                                  Icons.manage_search_rounded,
                                  contextPropertyDetailsScreen,
                                ),
                              ),
                              const SizedBox(
                                width: AppSize.s10,
                              ),
                              Expanded(
                                child: buildElevatedButton(
                                  'Interest',
                                  Icons.interests_rounded,
                                  contextPropertyDetailsScreen,
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
            ),
          ),
        ),
        bottomNavigationBar:  const PropertyDetailBottomBar(),
      ),
    );
  }
}
