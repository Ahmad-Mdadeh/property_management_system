import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class LanguageList extends StatefulWidget {
  const LanguageList({super.key});

  @override
  State<LanguageList> createState() => _LanguageListState();
}

class _LanguageListState extends State<LanguageList> {
  SettingController sittingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 25,
              right: MediaQuery.of(context).size.width / 25,
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
              child: const Icon(Icons.language_rounded,),
            ),
          ),
          TextUtils(
            text: 'language'.tr,
            color: Theme.of(context).textTheme.bodyMedium!.color,
            fontWeight: FontWeightManager.medium,
            fontSize: FontSize.s14,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
          ),
          DropdownButton(
            // dropdownColor: ,
            items: const [
              DropdownMenuItem(
                value: 'en',
                child: Text(
                  'English',
                  style: TextStyle(fontFamily: 'Outfit'),
                ),
              ),
              DropdownMenuItem(
                value: 'ar',
                child: Text(
                  'العربية',
                  style: TextStyle(fontFamily: 'Outfit'),
                ),
              ),
              DropdownMenuItem(
                value: 'fr',
                child: Text(
                  'Francais',
                  style: TextStyle(fontFamily: 'Outfit'),
                ),
              ),
            ],
            value: sittingController.selectedLang,
            onChanged: (value) {
              setState(() {
                if (value == 'ar') {
                  sittingController.isArabic.value = true;
                  sittingController.selectedL.value = value!;
                } else {
                  sittingController.isArabic.value = false;
                }
                sittingController.selectedLang = value!;
              });
              Get.updateLocale(
                Locale(value!),
              );
            },
          ),
        ],
      ),
    );
  }
}
