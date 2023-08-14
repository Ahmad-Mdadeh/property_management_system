import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:property_management_system/models/info_profile.dart';
import 'package:property_management_system/models/user.dart';
import 'package:property_management_system/modules/profile/profile_service.dart';
import 'package:property_management_system/resources/server_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';

class ProfileController extends GetxController {
  final ProfileService _profileService = ProfileService();
  late InfoProfile infoProfile;
  RxBool isLoading = false.obs;
  RxBool isUpdate = false.obs;
  late String name;
  RxString networkImage="".obs ;

  final picker = ImagePicker();
  late File selectedImagePath ;

  RxBool load = false.obs;

  @override
  void onInit() async {
    await getInfoProfile();
    super.onInit();
  }

  Future<void> getImage(ImageSource src) async {
    final pickedFile = await picker.pickImage(source: src);
    if (pickedFile != null) {
      selectedImagePath = File(pickedFile.path);
      Get.back();
      load.value = true;
    } else {
      Get.snackbar(
        'Error',
        'Pleas select image',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.deepPurple,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
      Get.back();
    }
  }

  Future<void> getInfoProfile() async {
    infoProfile = await _profileService.getInfoProfile(Users.token);
    networkImage.value = ServerSet.domainNameServer + infoProfile.user!.profilePhotoUrl!;
    isLoading.value = true;
  }

  Future<void> updateInfoProfile() async {
    await _profileService.updateInfoProfile(Users.token, name);
    if(load.value) {
      await _profileService.uploadImage(selectedImagePath,Users.token);
    }
    isUpdate.value = true;
  }

  void checkUpdate() async {
    Get.dialog(
      barrierDismissible: false,
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
    await updateInfoProfile();
    if (isUpdate.value) {
      isLoading.value = false;
      await getInfoProfile();
      print("================================");
      print(networkImage.value);
      Get.back(closeOverlays: true);
    }
  }
}
