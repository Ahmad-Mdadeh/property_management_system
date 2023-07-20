import 'package:get/get.dart';
import 'package:property_management_system/models/otp.dart';
import 'package:property_management_system/models/user.dart';
import 'package:property_management_system/resources/server_manager.dart';
import 'package:http/http.dart' as http;

class OtpService {
  dynamic message ;

  Future<RxBool> userVerification(
      String otp, String name, String password) async {
    var url = Uri.parse(
        "${ServerSet.domainNameServer}${ServerSet.userVerificationServer}phone=+48459434536&name=$name&password=$password&otp=$otp");
    var response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var verification = testFromJson(response.body);
      if (verification.status == "Your OTP has been expired") {
        message = verification.status!;
        return false.obs;
      } else if (verification.status == "Your OTP is not correct") {
        message = verification.status!;
        return false.obs;
      } else if (verification.status == true) {
        User.token = verification.accessToken!;
        return true.obs;
      }
    }
    return true.obs;
  }
}
