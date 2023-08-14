import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/models/properties.dart';
import 'package:property_management_system/models/user.dart';
import 'package:property_management_system/modules/filters/filters_services.dart';
import 'package:property_management_system/modules/home/home_service.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late HomeService _homeService;
  late FilterService _filterService;
  RxInt isSelected = 0.obs;
  String? category;

  late List<AllProperties> allProperties;

  RxBool isLoadingProperties = false.obs;

  List typePropertiesName = [
    'All'.tr,
    'House'.tr,
    'Office'.tr,
    'Villa'.tr,
    'Commercial'.tr,
    'Apartment'.tr,
    'Land'.tr,
  ];

  @override
  void onInit() {
    _homeService = HomeService();
    _filterService = FilterService();
    tabController =
        TabController(vsync: this, length: typePropertiesName.length);
    getAllProperties();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Future<void> getAllProperties() async {
    allProperties = await _homeService.getProperties(Users.token);
    isLoadingProperties.value = true;
  }

  Future<void> getAllPropertiesByFilterCategory() async {
    if (category != "All") {
      isLoadingProperties.value = false;
      allProperties = await _filterService.filterByCategoryProperties(
          Users.token, category!);
      isLoadingProperties.value = true;
    } else {
      isLoadingProperties.value = false;
      allProperties = await _homeService.getProperties(Users.token);
      isLoadingProperties.value = true;
    }
  }
}
