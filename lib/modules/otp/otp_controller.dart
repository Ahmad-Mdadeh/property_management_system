import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final phonenumber = ''.obs;
  var otp = "".obs;

  void setOTP(String value) {
    otp.value = value;
  }

  
    
  void submit() {
    if (formKey.currentState!.validate()) {
      // Do something when the number is submitted
    }
  }
}
