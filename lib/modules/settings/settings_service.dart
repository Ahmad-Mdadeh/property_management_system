import 'package:get/get.dart';
import 'package:property_management_system/resources/server_manager.dart';
import 'package:http/http.dart' as http;

class SettingService {
  Future logOutFromApp(String token) async {
    var url = Uri.parse(ServerSet.domainNameServer + ServerSet.logoutEndPoints);
    try {
      http.Response response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if(response.statusCode==200){
      }
    } catch (e) {
      Get.snackbar(
        "Error !",
        e.toString(),
      );
    }
  }
}
