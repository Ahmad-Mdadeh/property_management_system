import 'package:property_management_system/resources/server_manager.dart';
import 'package:get/get.dart';
import 'package:property_management_system/models/properties.dart';
import 'package:http/http.dart' as http;

class FilterService {

  Future filterByCategoryProperties(String token,String category) async {
    var url = Uri.parse(
      "${ServerSet.domainNameServer}${ServerSet.showPropertiesEndPoints}?category=$category",
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
        List<AllProperties> filterProperties = allPropertiesFromJson(response.body);
        return filterProperties;
      }
    } catch (e) {
      Get.snackbar("Error !", e.toString());
      return [];
    }
  }
}