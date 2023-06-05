import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../resources/color_manager.dart';
import '../../resources/text_manager.dart';
import '../../resources/values_manager.dart';
import '../property_detail/property_details_controller.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});
  final PropertyDetailsController mapController =
      Get.put(PropertyDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.darkPrimary,
        leading: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorManager.primary,
          ),
        ),
        actionsIconTheme: IconThemeData(color: ColorManager.primary),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: AppPadding.p20),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.share),
            ),
          ),
        ],
        title: const TextUtils(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          text: 'Property Location',
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          buildingsEnabled: true,
          // liteModeEnabled: true,
          compassEnabled: true,
          myLocationEnabled: true,
          // scrollGesturesEnabled: true,
          myLocationButtonEnabled: true,
          // mapType: mapController.mapType.value,
          mapType: MapType.satellite,
          onMapCreated: mapController.onMapCreated,
          markers: mapController.markers.toSet(),
          trafficEnabled: true,

          initialCameraPosition: CameraPosition(
            target: mapController.initialPosition.value,
            zoom: 17.0,
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     mapController.changeMapType();
      //   },
      //   child: const Icon(Icons.layers),
      // ),
    );
  }
}
