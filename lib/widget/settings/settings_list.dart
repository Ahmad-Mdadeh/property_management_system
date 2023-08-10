import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class SittingsList extends StatelessWidget {
  String _selectedLang = 'en';

  SittingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p20,
              right: AppPadding.p20,
            ),
            child: Container(
              width: 40,
              height: 43,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                borderRadius: BorderRadius.circular(
                  AppSize.s8,
                ),
              ),
              child: const Icon(Icons.language_rounded),
            ),
          ),
          TextUtils(
            text: 'language'.tr,
            color: Theme.of(context).textTheme.bodyMedium!.color,
            fontWeight: FontWeightManager.medium,
            fontSize: FontSize.s15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.p103,
            ),
            child: DropdownButton(
              items: const [
                DropdownMenuItem(
                  child: Text('en'),
                  value: 'en',
                ),
                DropdownMenuItem(
                  child: Text('ar'),
                  value: 'ar',
                ),
                DropdownMenuItem(
                  child: Text('fr'),
                  value: 'fr',
                ),
              ],
              value: _selectedLang,
              onChanged: (value) {
                Get.updateLocale(
                  Locale(value!),
                );
                // _selectedLang = Locale(value!) as String;
              },

              // child: Container(
              //   width: 33,
              //   height: 33,
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       color: Theme.of(context).colorScheme.primaryContainer,
              //       width: 1.5,
              //     ),
              //     borderRadius: BorderRadius.circular(
              //       7.0,
              //     ),
              //   ),
              //   child: Icon(
              //     Icons.arrow_forward_ios_outlined,
              //     color: Theme.of(context).colorScheme.onPrimaryContainer,
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
