import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';

class AuthIntlPhoneField extends StatelessWidget {
  const AuthIntlPhoneField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      dropdownTextStyle: const TextStyle(
        fontWeight: FontWeightManager.medium,
      ),
      initialCountryCode: 'SY',
      cursorColor: ColorManager.primary,
      style: TextStyle(
        color: ColorManager.primary,
      ),
      cursorHeight: 20,
      disableLengthCheck: true,
      dropdownIcon: Icon(
        Icons.arrow_drop_down,
        color: ColorManager.primary,
      ),
      decoration: InputDecoration(

        fillColor: Colors.grey.shade200,
        filled: true,
        label: const Text(
          'phone number',
          style: TextStyle(
            fontFamily: 'Outfit',
            fontWeight: FontWeightManager.medium,
            fontSize: FontSize.s14,
          ),
        ),
        labelStyle: const TextStyle(
          color: Colors.black54,
          fontSize: FontSize.s14,
          fontWeight: FontWeightManager.medium,
        ),
        hintStyle: const TextStyle(color: Colors.grey),
        focusColor: const Color(0xFF097C7D),
        hoverColor: const Color(0xFF097C7D),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(
              0xFF097C7D,
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF097C7D),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
      ),
    );
  }
}
