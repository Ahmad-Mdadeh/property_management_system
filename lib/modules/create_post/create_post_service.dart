import 'package:get/get.dart';
import 'package:property_management_system/models/create_post.dart';
import 'package:property_management_system/resources/server_manager.dart';
import 'package:http/http.dart' as http;

class CreatePostService {
  String message = "";
  bool success = false;

  Future getCreatePost({
    required String token,
    required String postType,
    required String propertyType,
    String? price,
    String? monthlyRent,
    String? maxDuration,
    required String latitude,
    required String longitude,
    required String name,
    required String address,
    String? roomCount,
    String? bathroomCount,
    String? kitchenCount,
    String? storey,
    String? area,
    required String about,
    String? balkony,
    String? gym,
    String? pool,
    String? parking,
    String? securityCameras,
    String? elevator,
    String? wifi,
    String? securityGard,
    String? garden,
  }) async {
    var url = Uri.parse(
      ServerSet.domainNameServer + ServerSet.showPropertiesEndPoints,
    );

    try {
      http.Response response = await http.post(
        url,
        body: {
          "posttype": postType,
          "property_type": propertyType,
          "price": price,
          "monthly_rent": monthlyRent,
          "max_duration": maxDuration,
          "latitude": latitude,
          "longitude": longitude,
          "name": name,
          "address": address,
          "room_count": roomCount,
          "bathroom_count": bathroomCount,
          "kitchen_count": kitchenCount,
          "storey": storey,
          "area": area,
          "about": about,
          "balkony": balkony,
          "gym": gym,
          "pool": pool,
          "parking": parking,
          "security_cameras": securityCameras,
          "elevator": elevator,
          "Wi-Fi": wifi,
          "security_gard": securityGard,
          "garden": garden
        },
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        message = createPostFromJson(response.body).message!;
        success = createPostFromJson(response.body).success!;
        return success;
      } else {
        message = createPostFromJson(response.body).message!;
        success = createPostFromJson(response.body).success!;
        return success;
      }
    } catch (e) {
      Get.snackbar(
        "Error !",
        e.toString(),
      );
    }
  }
}
