import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/onBoarding/on_boarding_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/resources/values_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onBoardingController = Get.put(OnBoardingController());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: onBoardingController.pageController,
              onPageChanged: onBoardingController.selectedPageIndex,
              itemCount: onBoardingController.onBoardingPages.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      onBoardingController.onBoardingPages[index].imageAsset,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                    const SizedBox(height: AppSize.s20),
                    TextUtils(
                      textAlign: TextAlign.center,
                      text: onBoardingController.onBoardingPages[index].title,
                      color: ColorManager.black,
                      fontWeight: FontWeightManager.medium,
                      fontSize: FontSize.s22,
                    ),
                    const SizedBox(height: AppSize.s24),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 64.0,
                      ),
                      child: TextUtils(
                        textAlign: TextAlign.center,
                        text: onBoardingController
                            .onBoardingPages[index].description,
                        color: ColorManager.grey2,
                        fontWeight: FontWeightManager.regular,
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: 35,
              left: 20,
              child: Row(
                children: [
                  Obx(
                    () => AnimatedSmoothIndicator(
                      activeIndex: onBoardingController.selectedPageIndex.value,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        dotColor: ColorManager.lightGrey,
                        dotHeight: AppSize.s10,
                        dotWidth: AppSize.s10,
                        activeDotColor: ColorManager.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                backgroundColor: ColorManager.primary,
                elevation: 0,
                onPressed: onBoardingController.forwardAction,
                child: Obx(() {
                  return onBoardingController.isLastPage
                      ? const Text(
                          'Start',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(
                            right: AppPadding.p2,
                          ),
                          child: SvgPicture.asset(
                            "assets/images/right_arrow_ic.svg",
                            width: AppSize.s16,
                          ),
                        );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
