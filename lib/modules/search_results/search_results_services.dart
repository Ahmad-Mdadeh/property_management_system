import 'package:get/get.dart';
import 'package:property_management_system/models/search.dart';
import 'package:http/http.dart' as http;
import 'package:property_management_system/resources/server_manager.dart';

class SearchResultsService {
  var url = Uri.parse(
    ServerSet.domainNameServer + ServerSet.searchEndPoints,
  );

  List? result;

  Future getSearchProperties(String token) async {
    try {
      http.Response response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        result = searchFromJson(response.body);
        return result;
      }
    } catch (e) {
      Get.snackbar('error!', '$e');
    }
    return [];
  }
}
