import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:property_management_system/models/user.dart';
import 'package:property_management_system/modules/create_post/create_post_service.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class CreatePostController extends GetxController {
  String postType = "";
  RxBool isSelectRent = false.obs;
  RxBool isSelectSale = false.obs;
  RxString categoryDropDownCheng = "House".obs;
  RxBool isCheckBoxGym = false.obs;
  RxBool isCheckBoxPool = false.obs;
  RxBool isCheckBoxParking = false.obs;
  RxBool isCheckBoxSecurityCameras = false.obs;
  RxBool isCheckBoxSecurityGard = false.obs;
  RxBool isCheckBoxWiFi = false.obs;
  RxBool isCheckBoxGarden = false.obs;
  RxBool isCheckBoxBlkony = false.obs;
  RxBool isCheckBoxElevator = false.obs;
  RxBool checkIsCreate = false.obs;

  String priceOrMonthlyRent = "0";
  String maxDuration = "0";
  String about = "0";
  String address = "0";
  String area = "0";
  String roomCount = "0";
  String bathRoomCount = "0";
  String kitchenCount = "0";
  String storyCount = "0";
  String latitude = "0";
  String longitude = "0";

  final CreatePostService _createPostService = CreatePostService();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void chengCheckBoxGym() async {
    isCheckBoxGym(!(isCheckBoxGym.value));
  }

  void chengCheckBoxPool() async {
    isCheckBoxPool(!(isCheckBoxPool.value));
  }

  void chengCheckBoxParking() async {
    isCheckBoxParking(!(isCheckBoxParking.value));
  }

  void chengCheckBoxSecurityCameras() async {
    isCheckBoxSecurityCameras(!(isCheckBoxSecurityCameras.value));
  }

  void chengCheckBoxWiFi() async {
    isCheckBoxWiFi(!(isCheckBoxWiFi.value));
  }

  void chengCheckBoxGarden() async {
    isCheckBoxGarden(!(isCheckBoxGarden.value));
  }

  void chengCheckBoxBlkony() async {
    isCheckBoxBlkony(!(isCheckBoxBlkony.value));
  }

  void chengCheckBoxElevator() async {
    isCheckBoxElevator(!(isCheckBoxElevator.value));
  }

  void chengCheckBoxSecurityGard() async {
    isCheckBoxSecurityGard(!(isCheckBoxSecurityGard.value));
  }

  Future<void> getCreatePost() async {
    checkIsCreate.value = await _createPostService.getCreatePost(
      token: Users.token,
      postType: isSelectRent.value ? "rent" : "sale",
      propertyType: categoryDropDownCheng.value,
      longitude: longitude,
      latitude: latitude,
      name: "SSSSSSSSSSSS",
      address: address,
      about: about,
      price: priceOrMonthlyRent,
      monthlyRent: priceOrMonthlyRent,
      area: area,
      bathroomCount: bathRoomCount,
      kitchenCount: kitchenCount,
      maxDuration: maxDuration,
      roomCount: roomCount,
      storey: storyCount,
      balkony: isCheckBoxBlkony.value ? "1" : "0",
      elevator: isCheckBoxElevator.value ? "1" : "0",
      garden: isCheckBoxGarden.value ? "1" : "0",
      gym: isCheckBoxGym.value ? "1" : "0",
      parking: isCheckBoxParking.value ? "1" : "0",
      pool: isCheckBoxPool.value ? "1" : "0",
      securityCameras: isCheckBoxSecurityCameras.value ? "1" : "0",
      securityGard: isCheckBoxSecurityGard.value ? "1" : "0",
      wifi: isCheckBoxWiFi.value ? "1" : "0",
    );
  }

  void checkCreatePost() async {
    Get.dialog(
      barrierDismissible: true,
      Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              "assets/json/loading.json",
              width: double.infinity,
              height: AppSize.s150,
            ),
          ],
        ),
      ),
    );
    await getCreatePost();
    if (checkIsCreate.value) {
      Get.back(closeOverlays: true);
      Get.snackbar(_createPostService.success.toString().toUpperCase(),
          _createPostService.message.toString(),
          snackPosition: SnackPosition.TOP, colorText: ColorManager.white);
    }
    if (!checkIsCreate.value) {
      Get.back();
      Get.snackbar(_createPostService.success.toString().toUpperCase(),
          _createPostService.message.toString(),
          snackPosition: SnackPosition.TOP, colorText: ColorManager.white);
    }
  }

  void clearInfo(){
     priceOrMonthlyRent = "0";
     maxDuration = "0";
     about = "0";
     address = "0";
     area = "0";
     roomCount = "0";
     bathRoomCount = "0";
     kitchenCount = "0";
     storyCount = "0";
     latitude = "0";
     longitude = "0";
      isCheckBoxGym = false.obs;
      isCheckBoxPool = false.obs;
      isCheckBoxParking = false.obs;
      isCheckBoxSecurityCameras = false.obs;
      isCheckBoxSecurityGard = false.obs;
      isCheckBoxWiFi = false.obs;
      isCheckBoxGarden = false.obs;
      isCheckBoxBlkony = false.obs;
      isCheckBoxElevator = false.obs;
      checkIsCreate = false.obs;
  }
}
