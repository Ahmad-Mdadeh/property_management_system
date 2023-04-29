import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<BoxShadow> createBoxShadows(
      Color color,
      double opacity,
      double xOffset,
      double yOffset,
      double spreadRadius,
      double blurRadius,
    ) {
      return [
        BoxShadow(
          color: color.withOpacity(opacity),
          spreadRadius: spreadRadius,
          blurRadius: blurRadius,
          offset: Offset(xOffset, yOffset),
        ),
      ];
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        // alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.elliptical(60, 20),
                    bottomRight: Radius.elliptical(60, 20)),
                boxShadow: createBoxShadows(Colors.grey, 0.5, 5, 5, 5, 7)),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.elliptical(60, 20),
                  bottomRight: Radius.elliptical(60, 20)),
              child: Image.asset(
                'assets/images/white-building.jpg',
                height: size.height * 0.6,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Welcome in Propertunity',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 25),
                Container(
                  width: size.width,
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                      boxShadow:
                          createBoxShadows(Colors.grey, 0.5, 0, 3, 5, 7)),
                  child: IntlPhoneField(
                    cursorColor: Colors.black,
                    cursorHeight: 20,
                    disableLengthCheck: true,
                    flagsButtonMargin: const EdgeInsets.all(5),
                    // invalidNumberMessage:
                    //     'The Number That you Enterd is not correct please try again',
                    // showCountryFlag: false,
                    decoration: const InputDecoration(
                      labelText: 'Enter Your Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                      ),
                    ),
                    initialCountryCode: 'SY',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                      boxShadow:
                          createBoxShadows(Colors.grey, 0.5, 0, 3, 5, 7)),
                  child: ElevatedButton(
                    onPressed: () {
                      print('pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                          side: const BorderSide(color: Colors.black)),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
