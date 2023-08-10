import 'package:get/get.dart';
import 'package:property_management_system/models/properties.dart';
import 'package:property_management_system/resources/server_manager.dart';
import 'package:http/http.dart' as http;

class HomeService {
  var url = Uri.parse(
    ServerSet.domainNameServer + ServerSet.showPropertiesEndPoints,
  );

  Future getProperties(String token) async {
    try {
      http.Response response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        List<AllProperties> properties = allPropertiesFromJson(response.body);
        return properties;
      }
    } catch (e) {
      Get.snackbar("Error !", e.toString());
    }
  }
}
