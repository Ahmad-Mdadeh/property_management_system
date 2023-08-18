import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/create_post/create_post_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/strings_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/utils/scroll_glow.dart';
import 'package:property_management_system/widget/create_post/apartment_filed.dart';
import 'package:property_management_system/widget/create_post/commercial_filed.dart';
import 'package:property_management_system/widget/create_post/house_filed.dart';
import 'package:property_management_system/widget/create_post/land_filed.dart';
import 'package:property_management_system/widget/create_post/office_filed.dart';
import 'package:property_management_system/widget/create_post/villa_filed.dart';
import 'package:property_management_system/widget/profile/profile_elevated_button.dart';
import 'package:property_management_system/widget/profile/profile_text_from_filed.dart';

class CreatePostScreen extends StatelessWidget {
  CreatePostScreen({Key? key, required this.buildContext}) : super(key: key);
  final BuildContext buildContext;
  final RxBool isSelectedRent = false.obs;
  final RxBool isSelectedSell = false.obs;
  final _createPostController = Get.put(CreatePostController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
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
              text: "Create Post".tr,
              fontWeight: FontWeightManager.semiBold,
              fontSize: FontSize.s18,
              // color: Theme.of(context).appBarTheme.titleTextStyle!.color,
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
          body: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p14,
                ),
                child: Obx(
                  () => Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: MediaQuery.of(context).size.height / 19,
                        decoration: BoxDecoration(
                          color: Theme.of(buildContext)
                              .appBarTheme
                              .backgroundColor,
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(
                                15.0,
                              ),
                              onTap: () {
                                if (!_createPostController.isSelectRent.value) {
                                  _createPostController.isSelectRent.value =
                                      true;
                                  _createPostController.isSelectSale.value =
                                      false;
                                  _createPostController.postType = "rent";
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.2,
                                decoration: BoxDecoration(
                                  color: _createPostController
                                          .isSelectRent.value
                                      ? Theme.of(buildContext).iconTheme.color
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                child: const Center(
                                  child: TextUtils(
                                    text: "Rent",
                                    fontWeight: FontWeightManager.medium,
                                    fontSize: FontSize.s18,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(
                                15.0,
                              ),
                              onTap: () {
                                if (!_createPostController.isSelectSale.value) {
                                  _createPostController.isSelectSale.value =
                                      true;
                                  _createPostController.isSelectRent.value =
                                      false;
                                  _createPostController.postType = "sale";
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.2,
                                decoration: BoxDecoration(
                                  color: _createPostController
                                          .isSelectSale.value
                                      ? Theme.of(buildContext).iconTheme.color
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(
                                    15,
                                  ),
                                ),
                                child: const Center(
                                  child: TextUtils(
                                    text: "Sale",
                                    fontWeight: FontWeightManager.medium,
                                    fontSize: FontSize.s18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(buildContext).size.height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p24),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                ColorManager.primary,
                                ColorManager.lightPrimary,
                                ColorManager.white,
                                //add more colors
                              ],
                            ),
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 30,
                              right: 30,
                            ),
                            child: Obx(
                              () => DropdownButton(
                                enableFeedback: true,
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                                value: _createPostController
                                    .categoryDropDownCheng.value,
                                items: const [
                                  DropdownMenuItem(
                                    value: "House",
                                    child: Text(
                                      "House",
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: "Land",
                                    child: Text(
                                      "Land",
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: "Office",
                                    child: Text(
                                      "Office",
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: "Villa",
                                    child: Text(
                                      "Villa",
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: "Commercial",
                                    child: Text(
                                      "Commercial",
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: "Apartment",
                                    child: Text(
                                      "Apartment",
                                    ),
                                  ),
                                ],
                                onChanged: (value) {
                                  _createPostController
                                      .categoryDropDownCheng.value = value!;
                                  _createPostController.clearInfo();
                                },
                                isExpanded: true,
                                //make true to take width of parent widget
                                underline: Container(),
                                //empty line
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: FontSize.s18,
                                  color: ColorManager.white,
                                ),
                                dropdownColor:
                                    Theme.of(buildContext).iconTheme.color,
                                iconEnabledColor: Colors.white,
                                iconSize: 35, //Icon color
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      if (_createPostController.isSelectRent.value)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p18,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextUtils(
                                text: "Max Duration",
                                fontWeight: FontWeightManager.light,
                                fontSize: FontSize.s16,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 8.0,
                                ),
                                child: ProfileTextFromFiled(
                                  color:
                                      Theme.of(buildContext).iconTheme.color!,
                                  icon: Icons.data_usage_rounded,
                                  hintText: '0',
                                  textInputType: TextInputType.number,
                                  function: (value) {
                                    _createPostController.maxDuration = value;
                                  },
                                  validator: (value) {
                                    if (!RegExp(validationNumber)
                                        .hasMatch(value)) {
                                      return "invalid Number";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (_createPostController.categoryDropDownCheng.value
                          .contains("House"))
                        HouseFiled(buildContext: buildContext),
                      ///////////////////////////////////////////////////////////////////////
                      if (_createPostController.categoryDropDownCheng.value
                          .contains("Land"))
                        LandFiled(buildContext: buildContext),
                      ///////////////////////////////////////////////////////////////////////
                      if (_createPostController.categoryDropDownCheng.value
                          .contains("Apartment"))
                        ApartmentFiled(buildContext: buildContext),
                      ///////////////////////////////////////////////////////////////////////
                      if (_createPostController.categoryDropDownCheng.value
                          .contains("Villa"))
                        VillaFiled(buildContext: buildContext),
                      ///////////////////////////////////////////////////////////////////////
                      if (_createPostController.categoryDropDownCheng.value
                          .contains("Office"))
                        OfficeFiled(buildContext: buildContext),
                      ///////////////////////////////////////////////////////////////////////
                      if (_createPostController.categoryDropDownCheng.value
                          .contains("Commercial"))
                        CommercialFiled(buildContext: buildContext),
                      ///////////////////////////////////////////////////////////////////////
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p14,
                        ),
                        child: ProfileButton(
                          borderRadius: 16,
                          text: 'Create'.tr,
                          height: MediaQuery.of(context).size.height / 17,
                          function: () async {
                            if (_formKey.currentState!.validate() &&
                                (_createPostController.isSelectRent.value ||
                                    _createPostController.isSelectSale.value)) {
                              _createPostController.checkCreatePost();
                            } else if (!_createPostController
                                    .isSelectRent.value ||
                                !_createPostController.isSelectSale.value) {
                              Get.snackbar(
                                "Opes !",
                                "Please Select The Property Type Rent Or Sale",
                                colorText: ColorManager.white,
                                snackPosition: SnackPosition.TOP,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
