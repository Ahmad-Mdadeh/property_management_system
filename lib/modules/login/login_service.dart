import 'package:get/get.dart';
import 'package:property_management_system/models/auth.dart';
import 'package:property_management_system/models/user.dart';
import 'package:property_management_system/resources/server_manager.dart';
import 'package:http/http.dart' as http;

class LoginService {
  String message = "";

  var url = Uri.parse(ServerSet.domainNameServer + ServerSet.loginEndPoints);

  Future<bool> loginWithPhoneNumber(
    String phone,
    String password,
  ) async {
    try {
      var response = await http.post(
        url,
        body: {
          "phone": phone,
          "password": password,
        },
      );
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var status = authFromJson(response.body).status;
        Users.token = authFromJson(response.body).accessToken!;
        return status;
      } else if (response.statusCode == 401) {
        message = authFromJson(response.body).message;
        var status = authFromJson(response.body).status;
        return status;
      }
    } catch (e) {
      Get.snackbar(
        "Error !",
        e.toString(),
      );
    }
    return false;
  }
}
