import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:property_management_system/modules/property_detail/property_details_controller.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';


class MapScreen extends StatelessWidget {
  final BuildContext contextMapScreen;
final LatLng latLng;
  MapScreen({super.key, required this.contextMapScreen, required this.latLng});

  final PropertyDetailsController mapController = Get.put(PropertyDetailsController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(contextMapScreen).appBarTheme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(contextMapScreen).iconTheme.color,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: AppPadding.p20),
            child: GestureDetector(
              onTap: () {},
              child:  Icon(
                Icons.share,
                color: Theme.of(contextMapScreen).iconTheme.color,
              ),
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
          compassEnabled: true,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          mapType: MapType.satellite,
          onMapCreated: (controller) => mapController.onMapCreated(latLng),
          markers: mapController.markers.toSet(),
          trafficEnabled: true,
          initialCameraPosition: CameraPosition(
            target: latLng,
            zoom: 17.0,
          ),
        ),
      ),
    );
  }
}
