import 'package:get/get.dart';
import 'package:property_management_system/models/properties.dart';
import 'package:property_management_system/resources/server_manager.dart';
import 'package:http/http.dart' as http;

class HomeService {
  Future getProperties(String token) async {
    var url = Uri.parse(
      ServerSet.domainNameServer + ServerSet.showPropertiesEndPoints,
    );
    try {
      http.Response response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        List<AllProperties> properties = allPropertiesFromJson(response.body);
        return properties;
      }
    } catch (e) {
      Get.snackbar("Error !", e.toString());
    }
  }

  Future getResultsSearch(String token, String input) async {
    var url = Uri.parse(
      "${ServerSet.domainNameServer}${ServerSet.showPropertiesEndPoints}?search=$input",
    );
    try {
      http.Response response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },

      );
      if (response.statusCode == 200) {
        List<AllProperties> propertiesSearch = allPropertiesFromJson(response.body);
        return propertiesSearch;
      }
    } catch (e) {
      Get.snackbar("Error !", e.toString());
    }
  }
}
