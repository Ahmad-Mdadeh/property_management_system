import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/login/login_screen.dart';
import 'package:property_management_system/modules/settings/settings_service.dart';
import 'package:property_management_system/utils/theme_service.dart';
import 'package:rive/rive.dart';
import 'package:property_management_system/models/user.dart';

class SettingController extends GetxController {
  final SettingService _settingService = SettingService();
  Artboard? riveArtBoard;
  RxBool timer = false.obs;
  RxBool isLightMode = ThemeService.sunOrMoon;
  late RiveAnimationController controllerToDark;
  late RiveAnimationController controllerToLight;
  String selectedLang = 'en';
  RxString selectedL = 'en'.obs;
  RxBool isArabic = false.obs;
  RxBool isLogout = false.obs;

  @override
  void onInit() {
    controllerToDark = SimpleAnimation("sunToMoonAniamtion");
    controllerToLight = SimpleAnimation("moonToSunAnimation");
    rootBundle.load('assets/rive/moon_to_sun_animated_icon.riv').then(
      (data) {
        final file = RiveFile.import(data);
        final artBoard = file.mainArtboard;
        artBoard.addController(
          isLightMode.value ? controllerToDark : controllerToLight,
        );
        riveArtBoard = artBoard;
        timer.value = true;
      },
    );

    super.onInit();
  }

  Future<void> signOutFromApp() async {
    await _settingService.logOutFromApp(Users.token);
    Get.offAll(
      transition: Transition.fade,
      () => LoginScreen(),
    );
  }

  void remove() {
    riveArtBoard?.artboard.removeController(controllerToLight);
    riveArtBoard?.artboard.removeController(controllerToDark);
  }
}
