import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:property_management_system/widget/property_details/image_overlay.dart';

class PropertyDetailsController extends GetxController {
  Rx<LatLng> initialPosition = const LatLng(33.5138, 36.2765).obs;
  RxList<Marker> markers = <Marker>[].obs;
  Rx<MapType> mapType = MapType.normal.obs;

  void onMapCreated(GoogleMapController controller) {
    markers.assignAll(
      [
        const Marker(
          markerId: MarkerId('mazzeh_marker'),
          position: LatLng(33.5138, 36.2765),
          infoWindow: InfoWindow(
            title: 'Mazzeh',
            snippet: 'Damascus',
          ),
        ),
      ],
    );
  }

  void changeMapType() {
    final currentMapType = mapType.value;
    final newMapType =
    currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
    // Update the map type
    mapType(newMapType);
  }

  void goToImageOverlay(String imagePath) {
    Get.dialog(
      ImageOverlay(
        imagePath: imagePath,
        onTap: () => Get.back(),
      ),
    );
  }
}