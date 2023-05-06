import 'package:get/get.dart';

class LoginController extends GetxController {
  String phoneNumber = '';

   String numericPhoneNumber='';

  void initializeNumericPhoneNumber() {
    phoneNumber = phoneNumber.replaceAll('PhoneNumber(countryISOCode: SY, countryCode: +963, number: ', '');
    numericPhoneNumber = phoneNumber.replaceAll(')', '');

  }

  RxString userName = ''.obs;
}
