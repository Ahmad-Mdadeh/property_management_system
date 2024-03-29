import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/filters/filters_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/utils/scroll_glow.dart';

class FiltersScreen extends StatelessWidget {
  FiltersScreen({super.key});

  final filterController = Get.put(FiltersController());

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        backgroundColor: ColorManager.dark,
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
              color: ColorManager.primary,
            ),
          ),
          title: TextUtils(
            color: ColorManager.white,
            fontSize: 20,
            fontWeight: FontWeight.normal,
            text: 'filter'.tr,
          ),
          actions: [
           InkWell(
           splashColor: Colors.transparent,
           highlightColor: Colors.transparent,
             onTap: () {
             filterController.isSelectedSell.value = false;
             filterController.isSelectedRent.value = false;
             filterController.isSelectedHouse.value = false;
             filterController.isSelectedApartment.value = false;
             filterController.isSelectedVilla.value = false;
             filterController.isSelectedLand.value = false;
             filterController.isSelectedCommercial.value = false;
             filterController.isSelectedOffice.value = false;
           },
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14),
               child: Center(
                 child: TextUtils(
                   text: 'clear_filter'.tr,
                   color: ColorManager.white,
                   fontWeight: FontWeightManager.regular,
                   fontSize: FontSize.s16,
                 ),
               ),
             ),),
          ],
          backgroundColor: ColorManager.darkPrimary,
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Padding(
                  padding: const EdgeInsets.fromLTRB(8, 25, 8, 15),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                        color: ColorManager.darkPrimary,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            enableFeedback: false,
                            onTap: () {
                              filterController.isSelectedSell.value =
                                  !filterController.isSelectedSell.value;
                              filterController.isSelectedRent.value = false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.2,
                              height: MediaQuery.of(context).size.height / 21,
                              decoration: BoxDecoration(
                                color: filterController.isSelectedSell.value
                                    ? ColorManager.primary
                                    : ColorManager.darkPrimary,
                                borderRadius: BorderRadius.circular(
                                  15.0,
                                ),
                              ),
                              child: Center(
                                child: TextUtils(
                                  fontFamily: 'Outfit',
                                  text: "for_sell".tr,
                                  color: ColorManager.white,
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: FontSize.s18,
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(width: MediaQuery.of(context).size.width / 30),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            enableFeedback: false,
                            onTap: () {
                              filterController.isSelectedRent.value =
                                  !filterController.isSelectedRent.value;
                              filterController.isSelectedSell.value = false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.2,
                              height: MediaQuery.of(context).size.height / 21,
                              decoration: BoxDecoration(
                                color: filterController.isSelectedRent.value
                                    ? ColorManager.primary
                                    : ColorManager.darkPrimary,
                                borderRadius: BorderRadius.circular(
                                  15.0,
                                ),
                              ),
                              child: Center(
                                child: TextUtils(
                                  fontFamily: 'Outfit',
                                  text: "for_rent".tr,
                                  color: ColorManager.white,
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: FontSize.s18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 25, 0),
                child: TextUtils(
                  text: 'property_type'.tr,
                  color: Colors.white,
                  fontWeight: FontWeightManager.regular,
                  fontSize: FontSize.s18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 25),
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Obx(
                          () => InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            enableFeedback: false,
                            onTap: () {
                              filterController.isSelectedHouse.value =
                                  !filterController.isSelectedHouse.value;
                              filterController.isSelectedCommercial.value = false;
                              filterController.isSelectedVilla.value = false;
                              filterController.isSelectedLand.value = false;
                              filterController.isSelectedOffice.value = false;
                              filterController.isSelectedApartment.value = false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 21,
                              decoration: BoxDecoration(
                                color: filterController.isSelectedHouse.value
                                    ? ColorManager.primary
                                    : ColorManager.darkPrimary,
                                borderRadius: BorderRadius.circular(
                                  15.0,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.home_rounded,
                                    size: AppSize.s22,
                                    color: filterController.isSelectedHouse.value
                                        ? ColorManager.darkPrimary
                                        : ColorManager.primary,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  TextUtils(
                                    text: 'House'.tr,
                                    color: filterController.isSelectedHouse.value
                                        ? ColorManager.darkPrimary
                                        : ColorManager.white,
                                    fontWeight: FontWeightManager.light,
                                    fontSize: FontSize.s16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 25),
                        Obx(
                          () => InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            enableFeedback: false,
                            onTap: () {
                              filterController.isSelectedLand.value =
                                  !filterController.isSelectedLand.value;
                              filterController.isSelectedHouse.value = false;
                              filterController.isSelectedCommercial.value = false;
                              filterController.isSelectedVilla.value = false;
                              filterController.isSelectedOffice.value = false;
                              filterController.isSelectedApartment.value = false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 21,
                              decoration: BoxDecoration(
                                color: filterController.isSelectedLand.value
                                    ? ColorManager.primary
                                    : ColorManager.darkPrimary,
                                borderRadius: BorderRadius.circular(
                                  15.0,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.landscape_rounded,
                                    size: AppSize.s22,
                                    color: filterController.isSelectedLand.value
                                        ? ColorManager.darkPrimary
                                        : ColorManager.primary,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  TextUtils(
                                    text: 'Lands'.tr,
                                    color: filterController.isSelectedLand.value
                                        ? ColorManager.darkPrimary
                                        : ColorManager.white,
                                    fontWeight: FontWeightManager.light,
                                    fontSize: FontSize.s16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 25),
                        Obx(
                          () => InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            enableFeedback: false,
                            onTap: () {
                              filterController.isSelectedOffice.value =
                                  !filterController.isSelectedOffice.value;
                              filterController.isSelectedApartment.value = false;
                              filterController.isSelectedCommercial.value = false;
                              filterController.isSelectedHouse.value = false;
                              filterController.isSelectedVilla.value = false;
                              filterController.isSelectedLand.value = false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 21,
                              decoration: BoxDecoration(
                                color: filterController.isSelectedOffice.value
                                    ? ColorManager.primary
                                    : ColorManager.darkPrimary,
                                borderRadius: BorderRadius.circular(
                                  15.0,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.apartment,
                                    size: AppSize.s22,
                                    color: filterController.isSelectedOffice.value
                                        ? ColorManager.darkPrimary
                                        : ColorManager.primary,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  TextUtils(
                                    text: 'Office'.tr,
                                    color: filterController.isSelectedOffice.value
                                        ? ColorManager.darkPrimary
                                        : ColorManager.white,
                                    fontWeight: FontWeightManager.light,
                                    fontSize: FontSize.s16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 25),
                        Obx(
                          () => InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            enableFeedback: false,
                            onTap: () {
                              filterController.isSelectedCommercial.value =
                                  !filterController.isSelectedCommercial.value;
                              filterController.isSelectedHouse.value = false;
                              filterController.isSelectedVilla.value = false;
                              filterController.isSelectedLand.value = false;
                              filterController.isSelectedApartment.value = false;
                              filterController.isSelectedOffice.value = false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: MediaQuery.of(context).size.height / 21,
                              decoration: BoxDecoration(
                                color: filterController.isSelectedCommercial.value
                                    ? ColorManager.primary
                                    : ColorManager.darkPrimary,
                                borderRadius: BorderRadius.circular(
                                  15.0,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.apartment_rounded,
                                    size: AppSize.s22,
                                    color: filterController
                                            .isSelectedCommercial.value
                                        ? ColorManager.darkPrimary
                                        : ColorManager.primary,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  TextUtils(
                                    text: 'Commercial'.tr,
                                    color: filterController
                                            .isSelectedCommercial.value
                                        ? ColorManager.darkPrimary
                                        : ColorManager.white,
                                    fontWeight: FontWeightManager.light,
                                    fontSize: FontSize.s16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 25),
                        Obx(
                          () => InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            enableFeedback: false,
                            onTap: () {
                              filterController.isSelectedApartment.value =
                                  !filterController.isSelectedApartment.value;
                              filterController.isSelectedHouse.value = false;
                              filterController.isSelectedVilla.value = false;
                              filterController.isSelectedLand.value = false;
                              filterController.isSelectedCommercial.value = false;
                              filterController.isSelectedOffice.value = false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: MediaQuery.of(context).size.height / 21,
                              decoration: BoxDecoration(
                                color: filterController.isSelectedApartment.value
                                    ? ColorManager.primary
                                    : ColorManager.darkPrimary,
                                borderRadius: BorderRadius.circular(
                                  15.0,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.apartment_rounded,
                                    size: AppSize.s22,
                                    color:
                                        filterController.isSelectedApartment.value
                                            ? ColorManager.darkPrimary
                                            : ColorManager.primary,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  TextUtils(
                                    text: 'Apartment'.tr,
                                    color:
                                        filterController.isSelectedApartment.value
                                            ? ColorManager.darkPrimary
                                            : ColorManager.white,
                                    fontWeight: FontWeightManager.light,
                                    fontSize: FontSize.s16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 25),
                        Obx(
                          () => InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            enableFeedback: false,
                            onTap: () {
                              filterController.isSelectedVilla.value =
                                  !filterController.isSelectedVilla.value;
                              filterController.isSelectedHouse.value = false;
                              filterController.isSelectedApartment.value = false;
                              filterController.isSelectedLand.value = false;
                              filterController.isSelectedCommercial.value = false;
                              filterController.isSelectedOffice.value = false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 21,
                              decoration: BoxDecoration(
                                color: filterController.isSelectedVilla.value
                                    ? ColorManager.primary
                                    : ColorManager.darkPrimary,
                                borderRadius: BorderRadius.circular(
                                  15.0,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.villa_rounded,
                                    size: AppSize.s22,
                                    color: filterController.isSelectedVilla.value
                                        ? ColorManager.darkPrimary
                                        : ColorManager.primary,
                                  ),
                                  const SizedBox(
                                    width: 5.0,
                                  ),
                                  TextUtils(
                                    text: 'Villa'.tr,
                                    color: filterController.isSelectedVilla.value
                                        ? ColorManager.darkPrimary
                                        : ColorManager.white,
                                    fontWeight: FontWeightManager.light,
                                    fontSize: FontSize.s16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width / 25),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 25, 0),
                child: TextUtils(
                  text: 'budget'.tr,
                  color: Colors.white,
                  fontWeight: FontWeightManager.regular,
                  fontSize: FontSize.s18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 25, 0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      // width: MediaQuery.of(context).size.width / 2,
                      child: TextField(
                        cursorColor: ColorManager.primary,
                        decoration: InputDecoration(
                          labelText: 'min'.tr,
                          labelStyle: TextStyle(
                              color: ColorManager.primary,
                              fontFamily: 'Outfit'),
                          prefixText: '\$ ',
                          prefixStyle: TextStyle(
                              color: ColorManager.primary,
                              fontFamily: 'Outfit'),
                          hintText: '00',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: ColorManager.primary,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: ColorManager.primary),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: ColorManager.primary),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 25),
                    Expanded(
                      flex: 2,
                      // width: MediaQuery.of(context).size.width / 2,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: ColorManager.primary,
                        decoration: InputDecoration(
                          labelText: 'max'.tr,
                          labelStyle: TextStyle(
                              color: ColorManager.primary,
                              fontFamily: 'Outfit'),
                          suffixText: '\$ ',
                          suffixStyle: TextStyle(
                              color: ColorManager.primary,
                              fontFamily: 'Outfit'),
                          hintText: '00',
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: ColorManager.primary,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: ColorManager.primary),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: ColorManager.primary),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 25, 0),
                child: TextUtils(
                  text: 'area'.tr,
                  color: Colors.white,
                  fontWeight: FontWeightManager.regular,
                  fontSize: FontSize.s18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 25, 0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: ColorManager.primary,
                  decoration: InputDecoration(
                    labelText: 'area'.tr,
                    labelStyle: TextStyle(
                        color: ColorManager.primary, fontFamily: 'Outfit'),
                    suffixText: 'M',
                    suffixStyle: TextStyle(
                        color: ColorManager.primary, fontFamily: 'Outfit'),
                    hintText: '00',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: ColorManager.primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: ColorManager.primary),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: ColorManager.primary),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: ColorManager.darkPrimary,
          elevation: 0,
          height: MediaQuery.of(context).size.height / 15,
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                ),
              ),
              child: TextUtils(
                text: 'apply_filter'.tr,
                color: ColorManager.darkPrimary,
                fontWeight: FontWeightManager.light,
                fontSize: FontSize.s16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
