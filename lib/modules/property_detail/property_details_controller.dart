import 'package:get/get.dart';
import 'package:property_management_system/widget/property_details/image_overlay.dart';


class NavigationController extends GetxController {

  void goToImageOverlay(String imagePath) {
    Get.dialog(
      ImageOverlay(
        imagePath: imagePath,
        onTap: () => Get.back(),
      ),
    );
  }
}
