import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class SettingController extends GetxController {
  Artboard? riveArtBoard;
  RxBool timer = false.obs;
  RxBool isLightMode =
      (WidgetsBinding.instance.window.platformBrightness == Brightness.light)
          .obs;
  late RiveAnimationController controllerToDark;
  late RiveAnimationController controllerToLight;

  @override
  void onInit() {
    // controllerToDark = SimpleAnimation("to dark");
    // controllerToLight = SimpleAnimation("to light");
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

  void remove() {
    riveArtBoard?.artboard.removeController(controllerToLight);
    riveArtBoard?.artboard.removeController(controllerToDark);
  }
}
