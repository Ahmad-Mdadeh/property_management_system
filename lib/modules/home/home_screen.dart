import 'package:flutter/material.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';

import '../../resources/values_manager.dart';
import '../../widget/home_widgets/property_type_button.dart';
import '../../widget/home_widgets/search_bar.dart';
import '../../widget/home_widgets/slide_show.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.dark,
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: AppPadding.p20),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.filter_alt_outlined,
                  size: AppSize.s28,
                ),
              )),
        ],
        title: TextUtils(
          text: "HOME",
          color: ColorManager.white,
          fontWeight: FontWeightManager.medium,
          fontSize: FontSize.s17,
        ),
        centerTitle: true,
        backgroundColor: ColorManager.dark,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: AppPadding.p8, left: AppPadding.p8, right: AppPadding.p8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBar(),
              const SlideShow(),
              Padding(
                padding: const EdgeInsets.only(
                    top: AppPadding.p8,
                    bottom: AppPadding.p8,
                    right: AppPadding.p8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: AppSize.s8,
                      ),
                      buildPropertyButton('Villa', Icons.villa_rounded,
                          ColorManager.darkPrimary),
                      const SizedBox(
                        width: AppSize.s10,
                      ),
                      buildPropertyButton('Land', Icons.landscape_rounded,
                          ColorManager.darkPrimary),
                      const SizedBox(
                        width: AppSize.s10,
                      ),
                      buildPropertyButton(
                          'House', Icons.home, ColorManager.darkPrimary),
                      const SizedBox(
                        width: AppSize.s10,
                      ),
                      buildPropertyButton('More', Icons.more_horiz_rounded,
                          ColorManager.darkPrimary),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextUtils(
                          text: 'Featured Properties',
                          color: ColorManager.white,
                          fontWeight: FontWeightManager.regular,
                          fontSize: FontSize.s18,
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: TextUtils(
                                text: 'See All',
                                color: ColorManager.lightGrey,
                                fontWeight: FontWeightManager.light,
                                fontSize: FontSize.s12))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
