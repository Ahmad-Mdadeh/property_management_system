import 'package:flutter/material.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';

import '../../resources/assets_manager.dart';
import '../../resources/values_manager.dart';
import '../../widget/home_widgets/featured_property_card.dart';
import '../../widget/home_widgets/most_viewed_property_card.dart';
import '../../widget/home_widgets/property_type_button.dart';
import '../../widget/home_widgets/slide_show.dart';
import '../../widget/property_details/circular_button.dart';
import '../../widget/property_details/text_tag.dart';

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
            left: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SlideShow(),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      buildPropertyButton('Villa', Icons.villa_rounded,
                          ColorManager.darkPrimary),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 35,
                      ),
                      buildPropertyButton('Land', Icons.landscape_rounded,
                          ColorManager.darkPrimary),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 35,
                      ),
                      buildPropertyButton(
                          'House', Icons.home, ColorManager.darkPrimary),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 35,
                      ),
                      buildPropertyButton('More', Icons.more_horiz_rounded,
                          ColorManager.darkPrimary),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 35,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  top: 12,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUtils(
                        text: 'Featured Properties',
                        color: ColorManager.white,
                        fontWeight: FontWeightManager.regular,
                        fontSize: FontSize.s16,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: TextUtils(
                          text: 'See All',
                          color: ColorManager.lightGrey,
                          fontWeight: FontWeightManager.light,
                          fontSize: FontSize.s12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          HomePropertyCard(),
                          HomePropertyCard(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  top: 12,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUtils(
                        text: 'Most Viewed',
                        color: ColorManager.white,
                        fontWeight: FontWeightManager.regular,
                        fontSize: FontSize.s16,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: TextUtils(
                          text: 'See All',
                          color: ColorManager.lightGrey,
                          fontWeight: FontWeightManager.light,
                          fontSize: FontSize.s12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 1.9,
                  child: GridView.count(
                    childAspectRatio: 0.6,
                    shrinkWrap: false,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: const [
                      MostViewedPropertyCard(),
                      MostViewedPropertyCard(),
                      MostViewedPropertyCard(),
                      MostViewedPropertyCard(),
                      MostViewedPropertyCard(),
                      MostViewedPropertyCard(),
                      MostViewedPropertyCard(),
                      MostViewedPropertyCard(),
                      MostViewedPropertyCard(),
                      MostViewedPropertyCard()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
