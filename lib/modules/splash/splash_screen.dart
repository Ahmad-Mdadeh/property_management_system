import 'dart:async';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:property_management_system/modules/onBoarding/on_boarding_screen.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/color_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const SplashScreenSub();
  }
}

class SplashScreenSub extends StatefulWidget {
  const SplashScreenSub({Key? key}) : super(key: key);

  @override
  _SplashScreenSubState createState() => _SplashScreenSubState();
}

class _SplashScreenSubState extends State<SplashScreenSub>
    with TickerProviderStateMixin {
  double _containerSize = 1.5;
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
            _containerSize = 2;
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
            seconds: 2,
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
