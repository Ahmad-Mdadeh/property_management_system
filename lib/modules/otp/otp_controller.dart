import 'package:get/get.dart';

class OtpController extends GetxController {
  var argument = Get.arguments;
  late String phoneNumber;

  @override
  void onInit() {
    phoneNumber = argument;

    super.onInit();
  }
}
