import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:property_management_system/modules/map/map_screen.dart';
import 'package:property_management_system/modules/property_detail/property_details_controller.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/property_details/contact_button.dart';
import 'package:property_management_system/widget/property_details/property_card.dart';
import 'package:property_management_system/widget/property_details/property_rate.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:readmore/readmore.dart';

class PropertyDetailsScreen extends StatelessWidget {
  final BuildContext contextPropertyDetailsScreen;

  PropertyDetailsScreen(
      {super.key, context, required this.contextPropertyDetailsScreen});

  final _propertyDetailsController = Get.put(PropertyDetailsController());
  final settingController = Get.put(SettingController());

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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: GestureDetector(
                onTap: () {
                  _propertyDetailsController.shareLink();
                },
                child: Icon(
                  Icons.share,
                  color: Theme.of(contextPropertyDetailsScreen).iconTheme.color,
                ),
              ),
            ),
          ],
        ),
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Obx(
            () => _propertyDetailsController.isLoading.value
                ? SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p4,
                              vertical: AppPadding.p4,
                            ),
                            child: InkWell(
                              child: PropertyCard(),
                              onTap: () {
                                _propertyDetailsController.goToImageOverlay(
                                  ImagesAssets.building,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.house_outlined,
                                          color: Theme.of(
                                                  contextPropertyDetailsScreen)
                                              .iconTheme
                                              .color,
                                        ), // depends on the type
                                        const SizedBox(
                                          width: AppSize.s10,
                                        ),
                                        TextUtils(
                                          text: _propertyDetailsController
                                              .propertyDetails
                                              .property!
                                              .categoryType!
                                              .tr,
                                          color: Theme.of(
                                                  contextPropertyDetailsScreen)
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
                                            MediaQuery.of(context).size.width /
                                                40,
                                        vertical:
                                            MediaQuery.of(context).size.height /
                                                200,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Theme.of(
                                            contextPropertyDetailsScreen,
                                          ).iconTheme.color!,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          5.0,
                                        ),
                                      ),
                                      child: TextUtils(
                                        text: (_propertyDetailsController
                                                .propertyDetails.posttype!)
                                            .tr
                                            .toUpperCase(),
                                        color: Theme.of(
                                                contextPropertyDetailsScreen)
                                            .iconTheme
                                            .color,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextUtils(
                                          text: _propertyDetailsController
                                              .propertyDetails.property!.name!,
                                          color: Theme.of(
                                                  contextPropertyDetailsScreen)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                          fontWeight: FontWeightManager.regular,
                                          fontSize: FontSize.s22,
                                        ),
                                        const SizedBox(
                                          height: AppSize.s16,
                                        ),
                                        Row(
                                          children: [
                                            TextUtils(
                                              text: _propertyDetailsController
                                                          .propertyDetails
                                                          .monthlyRent !=
                                                      null
                                                  ? '\$ ${_propertyDetailsController.propertyDetails.monthlyRent}'
                                                  : '\$ ${_propertyDetailsController.propertyDetails.price}',
                                              color: Theme.of(
                                                      contextPropertyDetailsScreen)
                                                  .iconTheme
                                                  .color,
                                              fontWeight:
                                                  FontWeightManager.regular,
                                              fontSize: FontSize.s22,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  8,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: AppSize.s20,
                                ),
                                BuildPropertyRate(
                                  icon: Icons.fitness_center,
                                  name: 'Fitness',
                                  rate: '10',
                                  context: contextPropertyDetailsScreen,
                                ),
                                Divider(
                                  height: AppSize.s40,
                                  color: ColorManager.primary,
                                ),
                                TextUtils(
                                  color: Theme.of(contextPropertyDetailsScreen)
                                      .textTheme
                                      .bodyLarge!
                                      .color,
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: FontSize.s20,
                                  text: 'About this property :',
                                ),
                                const SizedBox(
                                  height: AppSize.s10,
                                ),
                                ReadMoreText(
                                  _propertyDetailsController
                                      .propertyDetails.property!.about!,
                                  textAlign: TextAlign.justify,
                                  trimLines: 2,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: 'Show More',
                                  trimExpandedText: 'Show Less',
                                  lessStyle: TextStyle(
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeightManager.light,
                                    color:
                                        Theme.of(contextPropertyDetailsScreen)
                                            .iconTheme
                                            .color,
                                  ),
                                  moreStyle: TextStyle(
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeightManager.light,
                                    color:
                                        Theme.of(contextPropertyDetailsScreen)
                                            .iconTheme
                                            .color,
                                  ),
                                  style: TextStyle(
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeightManager.light,
                                    fontSize: FontSize.s14,
                                    color:
                                        Theme.of(contextPropertyDetailsScreen)
                                            .textTheme
                                            .bodyMedium!
                                            .color,
                                  ),
                                )
                                    .animate(
                                      onPlay: (controller) =>
                                          controller.reactive(),
                                    )
                                    .fadeIn(),
                                const SizedBox(
                                  height: AppSize.s30,
                                ),
                                TextUtils(
                                  color: Theme.of(contextPropertyDetailsScreen)
                                      .textTheme
                                      .bodyMedium!
                                      .color,
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
                                        color: Theme.of(
                                                contextPropertyDetailsScreen)
                                            .colorScheme
                                            .onSecondaryContainer,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextUtils(
                                          text: _propertyDetailsController
                                              .propertyDetails.property!.name!,
                                          color: Theme.of(
                                                  contextPropertyDetailsScreen)
                                              .textTheme
                                              .bodyMedium!
                                              .color,
                                          fontWeight: FontWeightManager.regular,
                                          fontSize: FontSize.s14,
                                        ),
                                        TextUtils(
                                          text: 'user.libres@gmail.com',
                                          color: Theme.of(
                                                  contextPropertyDetailsScreen)
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
                                  color: Theme.of(contextPropertyDetailsScreen)
                                      .textTheme
                                      .bodyMedium!
                                      .color,
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: FontSize.s19,
                                  text: 'Location',
                                ),
                                const SizedBox(
                                  height: AppSize.s20,
                                ),
                                TextUtils(
                                  color: Theme.of(contextPropertyDetailsScreen)
                                      .textTheme
                                      .bodyMedium!
                                      .color,
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
                                      color:
                                          Theme.of(contextPropertyDetailsScreen)
                                              .iconTheme
                                              .color,
                                      size: AppSize.s16,
                                    ),
                                    const SizedBox(
                                      width: AppSize.s4,
                                    ),
                                    Expanded(
                                      child: TextUtils(
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                        text: _propertyDetailsController
                                            .propertyDetails.property!.address!,
                                        color: Theme.of(
                                                contextPropertyDetailsScreen)
                                            .textTheme
                                            .bodySmall!
                                            .color,
                                        fontWeight: FontWeightManager.regular,
                                        fontSize: FontSize.s12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: AppSize.s8,
                                ),
                                Card(
                                  color: Theme.of(contextPropertyDetailsScreen)
                                      .colorScheme
                                      .onSecondaryContainer,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      10.0,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      SizedBox(
                                        width: double.infinity,
                                        height: AppSize.s275,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10.0,
                                            ),
                                            border: settingController
                                                    .isLightMode.value
                                                ? Border.all(
                                                    color: ColorManager.black
                                                        .withOpacity(0.4),
                                                    width: 0.8,
                                                  )
                                                : Border.all(
                                                    color: ColorManager.ofWhite
                                                        .withOpacity(0.4),
                                                    width: 0.8,
                                                  ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(
                                                10.0,
                                              ),
                                            ),
                                            child: Obx(
                                              () => GoogleMap(
                                                buildingsEnabled: false,
                                                compassEnabled: true,
                                                myLocationEnabled: true,
                                                scrollGesturesEnabled: true,
                                                myLocationButtonEnabled: true,
                                                trafficEnabled: true,
                                                onTap: (value) {
                                                  print(
                                                    _propertyDetailsController
                                                        .propertyDetails
                                                        .property!
                                                        .latitude!,
                                                  );
                                                  print(
                                                    _propertyDetailsController
                                                        .propertyDetails
                                                        .property!
                                                        .longitude!,
                                                  );

                                                  Get.to(
                                                    () => MapScreen(
                                                      latLng: LatLng(
                                                        _propertyDetailsController
                                                            .propertyDetails
                                                            .property!
                                                            .latitude!,
                                                        _propertyDetailsController
                                                            .propertyDetails
                                                            .property!
                                                            .longitude!,
                                                      ),
                                                      contextMapScreen:
                                                          contextPropertyDetailsScreen,
                                                    ),
                                                  );
                                                },
                                                onMapCreated:
                                                    _propertyDetailsController
                                                        .onMapCreated(
                                                  LatLng(
                                                    _propertyDetailsController
                                                        .propertyDetails
                                                        .property!
                                                        .latitude!,
                                                    _propertyDetailsController
                                                        .propertyDetails
                                                        .property!
                                                        .longitude!,
                                                  ),
                                                ),
                                                markers:
                                                    _propertyDetailsController
                                                        .markers
                                                        .toSet(),
                                                initialCameraPosition:
                                                    CameraPosition(
                                                  target: LatLng(
                                                    _propertyDetailsController
                                                        .propertyDetails
                                                        .property!
                                                        .latitude!,
                                                    _propertyDetailsController
                                                        .propertyDetails
                                                        .property!
                                                        .longitude!,
                                                  ),
                                                  zoom: 16.0,
                                                ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                  )
                : Center(
                    child: Lottie.asset(
                      "assets/json/loading.json",
                      width: double.infinity,
                      height: AppSize.s140,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
