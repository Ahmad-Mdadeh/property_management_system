import 'package:get/get.dart';

import '../../widget/property_detail/image_overlay.dart';

class NavigationController extends GetxController {
//   void goToImageOverlay(String imagePath) {
//     Get.to(() => ImageOverlay(
//           imagePath: imagePath,
//           onTap: () => Get.back(),
//         ));
//   }
// }
  void goToImageOverlay(String imagePath) {
    Get.dialog(
      ImageOverlay(
        imagePath: imagePath,
        onTap: () => Get.back(),
      ),
    );
  }
}
