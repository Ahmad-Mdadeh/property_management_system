import 'package:get/get.dart';
import 'package:property_management_system/modules/onBoarding/on_boarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OnBoardingController>(OnBoardingController());
  }
}
