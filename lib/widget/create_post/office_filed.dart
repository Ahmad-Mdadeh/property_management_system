import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/create_post/create_post_controller.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/profile/profile_text_from_filed.dart';
import 'package:property_management_system/resources/strings_manager.dart';

class OfficeFiled extends StatelessWidget {
  OfficeFiled({required this.buildContext, Key? key}) : super(key: key);
  final _createPostController = Get.put(CreatePostController());
  final BuildContext buildContext;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p18,
        vertical: AppPadding.p6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///////////////////////////////////////////////////////////////////////
          TextUtils(
            text: _createPostController.isSelectSale.value
                ? 'Price'.tr
                : 'Monthly Rent'.tr,
            fontWeight: FontWeightManager.light,
            fontSize: FontSize.s16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: ProfileTextFromFiled(
              color: Theme.of(buildContext).iconTheme.color!,
              icon: Icons.attach_money_sharp,
              hintText: '0.0',
              textInputType: TextInputType.number,
              function: (value) {                    _createPostController.priceOrMonthlyRent = value;
              },
              validator: (value) {
                if (!RegExp(validationNumber).hasMatch(value)) {
                  return "invalid name";
                } else {
                  return null;
                }
              },
            ),
          ),
          ///////////////////////////////////////////////////////////////////////
          const TextUtils(
            text: 'About',
            fontWeight: FontWeightManager.light,
            fontSize: FontSize.s16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: ProfileTextFromFiled(
              color: Theme.of(buildContext).iconTheme.color!,
              icon: Icons.description_outlined,
              hintText: 'About',
              textInputType: TextInputType.text,
              function: (value) {                    _createPostController.about = value;
              },
              validator: (value) {
                if (!RegExp(validationName).hasMatch(value)) {
                  return "invalid name";
                } else {
                  return null;
                }
              },
            ),
          ),
          ///////////////////////////////////////////////////////////////////////
          const TextUtils(
            text: 'Address',
            fontWeight: FontWeightManager.light,
            fontSize: FontSize.s16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: ProfileTextFromFiled(
              color: Theme.of(buildContext).iconTheme.color!,
              icon: Icons.location_searching_rounded,
              hintText: 'Address',
              textInputType: TextInputType.text,
              function: (value) {_createPostController.address = value;},
              validator: (value) {
                if (!RegExp(validationName).hasMatch(value)) {
                  return "invalid name";
                } else {
                  return null;
                }
              },
            ),
          ),
          ///////////////////////////////////////////////////////////////////////
          const TextUtils(
            text: 'Area',
            fontWeight: FontWeightManager.light,
            fontSize: FontSize.s16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: ProfileTextFromFiled(
              color: Theme.of(buildContext).iconTheme.color!,
              icon: Icons.area_chart_outlined,
              hintText: 'Area',
              textInputType: TextInputType.number,
              function: (value) {_createPostController.area = value;},
              validator: (value) {
                if (!RegExp(validationNumber).hasMatch(value)) {
                  return "invalid name";
                } else {
                  return null;
                }
              },
            ),
          ),
          ///////////////////////////////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  const TextUtils(
                    text: 'Room Count',
                    fontWeight: FontWeightManager.light,
                    fontSize: FontSize.s16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: ProfileTextFromFiled(
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Theme.of(buildContext).iconTheme.color!,
                      icon: Icons.house_siding_rounded,
                      hintText: '0',
                      textInputType: TextInputType.number,
                      function: (value) {
                        _createPostController.roomCount = value;
                      },
                      validator: (value) {
                        if (!RegExp(validationNumber).hasMatch(value)) {
                          return "invalid Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  const TextUtils(
                    text: 'Bathroom Count',
                    fontWeight: FontWeightManager.light,
                    fontSize: FontSize.s16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: ProfileTextFromFiled(
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Theme.of(buildContext).iconTheme.color!,
                      icon: Icons.bathtub_rounded,
                      hintText: '0',
                      textInputType: TextInputType.number,
                      function: (value) {
                        _createPostController.bathRoomCount = value;
                      },
                      validator: (value) {
                        if (!RegExp(validationNumber).hasMatch(value)) {
                          return "invalid Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          ///////////////////////////////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  const TextUtils(
                    text: 'Kitchen Count',
                    fontWeight: FontWeightManager.light,
                    fontSize: FontSize.s16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: ProfileTextFromFiled(
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Theme.of(buildContext).iconTheme.color!,
                      icon: Icons.kitchen,
                      hintText: '0',
                      textInputType: TextInputType.number,
                      function: (value) {
                        _createPostController.kitchenCount = value;
                      },
                      validator: (value) {
                        if (!RegExp(validationNumber).hasMatch(value)) {
                          return "invalid Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  const TextUtils(
                    text: 'Storey Count',
                    fontWeight: FontWeightManager.light,
                    fontSize: FontSize.s16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: ProfileTextFromFiled(
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Theme.of(buildContext).iconTheme.color!,
                      icon: Icons.store,
                      hintText: '0',
                      textInputType: TextInputType.number,
                      function: (value) {
                        _createPostController.storyCount = value;
                      },
                      validator: (value) {
                        if (!RegExp(validationNumber).hasMatch(value)) {
                          return "invalid Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          ///////////////////////////////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  const TextUtils(
                    text: 'Latitude',
                    fontWeight: FontWeightManager.light,
                    fontSize: FontSize.s16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: ProfileTextFromFiled(
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Theme.of(buildContext).iconTheme.color!,
                      icon: Icons.location_on_outlined,
                      hintText: '0.0',
                      textInputType: TextInputType.number,
                      function: (value) {
                        _createPostController.longitude = value;
                      },
                      validator: (value) {
                        if (!RegExp(validationNumber).hasMatch(value)) {
                          return "invalid Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  const TextUtils(
                    text: 'Longitude',
                    fontWeight: FontWeightManager.light,
                    fontSize: FontSize.s16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: ProfileTextFromFiled(
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Theme.of(buildContext).iconTheme.color!,
                      icon: Icons.location_on_outlined,
                      hintText: '0.0',
                      textInputType: TextInputType.number,
                      function: (value) {
                        _createPostController.longitude = value;
                      },
                      validator: (value) {
                        if (!RegExp(validationNumber).hasMatch(value)) {
                          return "invalid Number";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          ///////////////////////////////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.other_houses_outlined,
                    color: Theme.of(buildContext).iconTheme.color,
                  ),
                  const SizedBox(
                    width: AppSize.s2,
                  ),
                  TextUtils(
                    color: Theme.of(buildContext).textTheme.bodyMedium!.color,
                    text: "BlKony",
                    fontWeight: FontWeightManager.light,
                    fontSize: FontSize.s14,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.022,
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      _createPostController.chengCheckBoxBlkony();
                    },
                    icon: Icon(
                      _createPostController.isCheckBoxBlkony.value
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: Theme.of(buildContext).iconTheme.color,
                    ),
                  ),
                ],
              ),
              /*===================================================================*/
              Row(
                children: [
                  Icon(
                    Icons.local_parking,
                    color: Theme.of(buildContext).iconTheme.color,
                  ),
                  TextUtils(
                    color: Theme.of(buildContext).textTheme.bodyMedium!.color,
                    text: "Parking",
                    fontWeight: FontWeightManager.light,
                    fontSize: FontSize.s14,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.004,
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      _createPostController.chengCheckBoxParking();
                    },
                    icon: Icon(
                      _createPostController.isCheckBoxParking.value
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: Theme.of(buildContext).iconTheme.color,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ///////////////////////////////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.elevator_outlined,
                    color: Theme.of(buildContext).iconTheme.color,
                  ),
                  TextUtils(
                    color: Theme.of(buildContext).textTheme.bodyMedium!.color,
                    text: "Elevator",
                    fontWeight: FontWeightManager.light,
                    fontSize: FontSize.s14,
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      _createPostController.chengCheckBoxElevator();
                    },
                    icon: Icon(
                      _createPostController.isCheckBoxElevator.value
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: Theme.of(buildContext).iconTheme.color,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.wifi,
                    color: Theme.of(buildContext).iconTheme.color,
                  ),
                  TextUtils(
                    color: Theme.of(buildContext).textTheme.bodyMedium!.color,
                    text: "WiFi",
                    fontWeight: FontWeightManager.light,
                    fontSize: FontSize.s14,
                  ), SizedBox(
                    width: MediaQuery.of(context).size.width * 0.06,
                  ),

                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      _createPostController.chengCheckBoxWiFi();
                    },

                    icon: Icon(
                      _createPostController.isCheckBoxWiFi.value
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: Theme.of(buildContext).iconTheme.color,
                    ),
                  ),
                ],
              ),
            ],
          ),
          ///////////////////////////////////////////////////////////////////////
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.security,
                    color: Theme.of(buildContext).iconTheme.color,
                  ),
                  const SizedBox(
                    width: AppSize.s2,
                  ),
                  TextUtils(
                    color: Theme.of(buildContext).textTheme.bodyMedium!.color,
                    text: "Gard",
                    fontWeight: FontWeightManager.light,
                    fontSize: FontSize.s14,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      _createPostController.chengCheckBoxSecurityGard();
                    },
                    icon: Icon(
                      _createPostController.isCheckBoxSecurityGard.value
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: Theme.of(buildContext).iconTheme.color,
                    ),
                  ),
                ],
              ),
              /*===================================================================*/
              Row(
                children: [
                  Icon(
                    Icons.camera,
                    color: Theme.of(buildContext).iconTheme.color,
                  ),
                  TextUtils(
                    color: Theme.of(buildContext).textTheme.bodyMedium!.color,
                    text: "Security",
                    fontWeight: FontWeightManager.light,
                    fontSize: FontSize.s14,
                  ),
                  IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      _createPostController.chengCheckBoxSecurityCameras();
                    },
                    icon: Icon(
                      _createPostController.isCheckBoxSecurityCameras.value
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: Theme.of(buildContext).iconTheme.color,
                    ),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    ));
  }
}
