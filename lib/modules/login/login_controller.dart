import 'package:get/get.dart';

class LoginController extends GetxController {
  String phoneNumber = '';

  String numericPhoneNumber = '';

  RxString password = ''.obs;

  RxString userName = ''.obs;
  RxBool isObscured = true.obs;


  void initializeNumericPhoneNumber() {
    phoneNumber = phoneNumber.replaceAll(
      'PhoneNumber(countryISOCode: SY, countryCode: +963, number: ',
      '',
    );
    numericPhoneNumber = phoneNumber.replaceAll(
      ')',
      '',
    );
  }
}
