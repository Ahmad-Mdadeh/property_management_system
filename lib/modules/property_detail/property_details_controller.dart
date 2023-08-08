import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:property_management_system/models/properties_details.dart';
import 'package:property_management_system/models/user.dart';
import 'package:property_management_system/modules/property_detail/property_details_service.dart';
import 'package:property_management_system/widget/property_details/image_overlay.dart';

class PropertyDetailsController extends GetxController {
  final PropertiesDetailsService _propertiesDetailsService =
      PropertiesDetailsService();
  Rx<LatLng> initialPosition = const LatLng(33.5138, 36.2765).obs;
  Rx<MapType> mapType = MapType.normal.obs;
  RxList<Marker> markers = <Marker>[].obs;
  late PropertiesDetails propertyDetails;
  RxBool isLoading = false.obs;
  var arguments = Get.arguments;
  late int id;
  late String postType;

  @override
  void onInit() {
    getPropertiesDetails();
    super.onInit();
  }

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

  void getPropertiesDetails() async {
    postType = arguments[1];
    id = arguments[0];
    propertyDetails = await _propertiesDetailsService.getPropertiesDetails(
      User.token,
      id,
      postType,
    );
    isLoading.value = true;
  }
}
