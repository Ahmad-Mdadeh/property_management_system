import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:property_management_system/models/properties_details.dart';
import 'package:property_management_system/models/user.dart';
import 'package:property_management_system/modules/property_detail/property_details_service.dart';
import 'package:property_management_system/widget/property_details/image_overlay.dart';
import 'package:share/share.dart';

  class PropertyDetailsController extends GetxController {
  late String propertyName;

  late String propertyType;

  late String propertyStatus;

  late String price;

  late String mapLink;
  final PropertiesDetailsService _propertiesDetailsService =
      PropertiesDetailsService();
  // Rx<LatLng> initialPosition = const LatLng(32.716323, 36.573041).obs;
  Rx<MapType> mapType = MapType.normal.obs;
  RxList<Marker> markers = <Marker>[].obs;
  late PropertiesDetails propertyDetails;
  RxBool isLoading = false.obs;
  var arguments = Get.arguments;
  late int id;
  late String postType;

  @override
  void onInit() async {
    await getPropertiesDetails();
    propertyName = propertyDetails.property!.categoryType!.tr;
    propertyType = propertyDetails.property!.categoryType!.tr;
    propertyStatus = propertyDetails.posttype!.tr.toUpperCase();
    price = (propertyDetails.monthlyRent).toString();
    mapLink = Uri(
      scheme: 'https',
      host: 'www.google.com',
      path: '/maps',
      queryParameters: {
        'q': '25.1972,55.2744',
      },
    ).toString();
    super.onInit();
  }

    onMapCreated(LatLng latLng) {
    markers.assignAll(
      [
         Marker(

          markerId: const MarkerId(''),
          position: latLng,
          infoWindow: const InfoWindow(
            title: '',
            snippet: '',
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

  Future<void> getPropertiesDetails() async {
    postType = arguments[1];
    id = arguments[0];
    propertyDetails = await _propertiesDetailsService.getPropertiesDetails(
      Users.token,
      id,
      postType,
    );
    isLoading.value = true;
  }

  void shareLink(){
    Share.share(
      'Property Name: $propertyName\nProperty Type: $propertyType\nProperty Status: $propertyStatus\nPrice: $price\nYou Can See The Location here: $mapLink\nFor more info Download PrepertUnity',
    );
  }
}
