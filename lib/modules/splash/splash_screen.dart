import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:property_management_system/modules/login/login_screen.dart';
import 'package:property_management_system/resources/assets_manager.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({Key? key}) : super(key: key);

  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  Widget build(BuildContext context) {
    return const SplashScreen1Sub();
  }
}

class SplashScreen1Sub extends StatefulWidget {
  const SplashScreen1Sub({Key? key}) : super(key: key);

  @override
  _SplashScreen1SubState createState() => _SplashScreen1SubState();
}

class _SplashScreen1SubState extends State<SplashScreen1Sub>
    with TickerProviderStateMixin {
  double _containerSize = 1.5;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3,),);


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
        Get.offAll(
          const LoginScreen(),
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

    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
            // decoration: ColorManager.gradientBackColor,
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 3000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 3000),
                curve: Curves.fastLinearToSlowEaseIn,
                height: 200,
                width: 200,
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  ImagesAssets.splashLogo,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
