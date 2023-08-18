import 'package:get/get.dart';
import 'package:property_management_system/models/auth.dart';
import 'package:property_management_system/models/user.dart';
import 'package:property_management_system/resources/server_manager.dart';
import 'package:http/http.dart' as http;

class OtpService {
  String message = "";

  Future<bool> userVerification(
      String phone, String name, String password, String otp) async {
    var url = Uri.parse(
        ServerSet.domainNameServer + ServerSet.userVerificationEndPoints);
    try {
      var response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
        },
        body: {
          "phone": phone,
          "name": name,
          "password": password,
          "otp": otp,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var status = authFromJson(response.body).success;
        Users.token = authFromJson(response.body).accessToken!;
        return status;
      } else if (response.statusCode == 401) {
        message = authFromJson(response.body).message;
        var status = authFromJson(response.body).success;
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
