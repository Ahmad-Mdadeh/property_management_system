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
  late final Image image;
  final ProfileService _profileService = ProfileService();
  late InfoProfile infoProfile;
  RxBool isLoading = false.obs;
  RxBool isUpdate = false.obs;
  late String name;
  RxString networkImage = "".obs;

  final picker = ImagePicker();
  late File selectedImagePath;

  RxBool load = false.obs;

  @override
  void onInit() async {
    await getInfoProfile();
    super.onInit();
  }

  getImage() {
    return networkImage.value.isEmpty ? const CircleAvatar(
      radius: 55.0,
      backgroundImage: AssetImage("assets/images/empty_proile.png"),
    )
        : ! load.value ? CircleAvatar(
      radius: 55.0,
      backgroundImage: NetworkImage(
        networkImage.value,
      ),
    ) : CircleAvatar(
      radius: 55.0,
      backgroundImage: FileImage(
        selectedImagePath,
      ),
    );
  }

  Future<void> getImagePicker(ImageSource src) async {
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
    isLoading.value = true;
    networkImage.value =
    infoProfile.user!.profilePhotoUrl != null ? ServerSet.domainNameServer +
        infoProfile.user!.profilePhotoUrl! : '';
  }

  Future<void> updateInfoProfile() async {
    await _profileService.updateInfoProfile(Users.token, name);
    if (load.value) {
      await _profileService.uploadImage(selectedImagePath, Users.token);
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
      Get.back(closeOverlays: true);
    }
  }

}
