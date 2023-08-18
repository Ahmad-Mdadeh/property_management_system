import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/create_post/create_post_controller.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:property_management_system/widget/profile/profile_text_from_filed.dart';
import 'package:property_management_system/resources/strings_manager.dart';

class LandFiled extends StatelessWidget {
  LandFiled({Key? key, required this.buildContext}) : super(key: key);
  final _createPostController = Get.put(CreatePostController());
  final BuildContext buildContext;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              function: (value) {_createPostController.priceOrMonthlyRent = value;},
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
              function: (value) {_createPostController.about  =value;},
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
              function: (value) {_createPostController.address=value;},
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
              function: (value) {_createPostController.area= value;},
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
                      function: (value) {_createPostController.latitude = value;},
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
                      function: (value) {_createPostController.longitude = value;},
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
        ],
      ),
    );
  }
}
