import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/models/properties.dart';
import 'package:property_management_system/models/user.dart';
import 'package:property_management_system/modules/home/home_service.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late HomeService _homeService;
  RxInt isSelected = 0.obs;

  late List<AllProperties> allProperties;

  RxBool isLoadingProperties = false.obs;

  List typePropertiesName = [
    'house'.tr,
    'office'.tr,
    'villa'.tr,
    'commercial'.tr,
    'apartment'.tr,
    'lands'.tr,
  ];

  @override
  void onInit() {
    _homeService = HomeService();
    tabController = TabController(vsync: this, length: 4);
    getAllProperties();
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void getAllProperties() async {
    allProperties = await _homeService.getProperties(User.token);
    isLoadingProperties.value = true;
  }
}
