import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../resources/color_manager.dart';

class AuthOTPField extends StatelessWidget {
  const AuthOTPField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      textStyle: TextStyle(color: ColorManager.black,),
      appContext: context,
      pastedTextStyle: TextStyle(
        color: Colors.green.shade600,
        fontWeight: FontWeight.bold,
      ),
      length: 5,
      animationType: AnimationType.fade,
      validator: (v) {
        if (v!.length < 5) {
          return "Enter full OTP";
        } else {
          return null;
        }
      },
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        disabledColor:Theme.of(context).iconTheme.color,
        activeColor:Theme.of(context).iconTheme.color,
        errorBorderColor: ColorManager.error,
        inactiveColor: Theme.of(context).iconTheme.color,
        selectedColor:Theme.of(context).iconTheme.color,
        inactiveFillColor: ColorManager.white,
        selectedFillColor: ColorManager.ofWhite,
        borderRadius: BorderRadius.circular(
          5,
        ),
        fieldHeight: 47,
        fieldWidth: 45,
        activeFillColor: Colors.white,
      ),
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.black12,
          blurRadius: 10,
        )
      ],
      onChanged: (String value) {},
    );
  }
}
