import 'package:get/get.dart';

class RegisterController extends GetxController {
  String phoneNumber = '';

  String numericPhoneNumber = '';

  RxString userName = ''.obs;

  Rx password = ''.obs;

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
