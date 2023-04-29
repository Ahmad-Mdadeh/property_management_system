import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: SvgPicture.asset(
                  "assets/images/WhatsApp-Image-2023-04-28-at-13.35.55.svg",
                ),
              ),
          ),
          Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: SvgPicture.asset(
                  "assets/images/WhatsApp-Image-2023-04-28-at-13.35.55.svg",
                ),
              ),
          ),
          Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: SvgPicture.asset(
                  "assets/images/WhatsApp-Image-2023-04-28-at-13.35.55.svg",
                ),
              ),
          ),
        ],
      ),
    );
  }
}
