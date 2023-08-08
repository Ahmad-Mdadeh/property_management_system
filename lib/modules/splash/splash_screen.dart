import 'dart:async';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/onBoarding/on_boarding_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenSubState createState() => _SplashScreenSubState();
}

class _SplashScreenSubState extends State<SplashScreen> with TickerProviderStateMixin {
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    );

    _controller.forward();

    Timer(
      const Duration(milliseconds: 500),
      () {
        setState(
          () {
            _containerOpacity = 1;
          },
        );
      },
    );

    Timer(
      const Duration(milliseconds: 2000),
      () {
        Get.off(
          () => const OnBoardingScreen(),
          transition: Transition.native,
          duration: const Duration(
            seconds:3,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        body: Center(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 4000),
            curve: Curves.fastLinearToSlowEaseIn,
            opacity: _containerOpacity,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 3000),
              curve: Curves.fastLinearToSlowEaseIn,
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 0.45,
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/splash-logo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
