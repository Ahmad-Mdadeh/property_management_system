import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/login/login_screen.dart';
import 'package:property_management_system/resources/assets_manager.dart';
import 'package:property_management_system/resources/strings_manager.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();

  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;

  forwardAction() {
    if (isLastPage)  {
      Get.to(
        const LoginScreen(),
        transition: Transition.circularReveal,
        duration: const Duration(
          seconds: 2,
        ),
      );
    } else {
      pageController.nextPage(
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    }
  }

  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo(
      imageAsset: ImagesAssets.housePlaceOnBoarding,
      title: AppStrings.onBoardingTitle1,
      description: AppStrings.onBoardingSubTitle1,
    ),
    OnBoardingInfo(
      imageAsset: ImagesAssets.houseSaleOnBoarding,
      title: AppStrings.onBoardingTitle2,
      description: AppStrings.onBoardingSubTitle2,
    ),
    OnBoardingInfo(
      imageAsset: ImagesAssets.houseSearchingOnBoarding,
      title: AppStrings.onBoardingTitle3,
      description: AppStrings.onBoardingSubTitle3,
    ),
  ];
}

class OnBoardingInfo {
  final String imageAsset;
  final String title;
  final String description;

  OnBoardingInfo(
      {required this.imageAsset,
      required this.title,
      required this.description});
}
