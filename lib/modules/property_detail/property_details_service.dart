import 'package:get/get.dart';
import 'package:property_management_system/models/properties_details.dart';
import 'package:property_management_system/resources/server_manager.dart';
import 'package:http/http.dart' as http;

class PropertiesDetailsService {
  Future getPropertiesDetails(String token, int id, String postType) async {
    var url = Uri.parse(
        "${ServerSet.domainNameServer}${ServerSet.showPropertiesEndPoints}/$id?posttype=$postType");
    try {
      var response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        PropertiesDetails propertiesDetails =
            propertiesDetailsFromJson(response.body);
        return propertiesDetails;
      }
    } catch (e) {
      Get.snackbar(
        "Error !",
        e.toString(),
      );
    }
  }
}
