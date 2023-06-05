import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/filters/filters_screen.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/font_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:property_management_system/resources/values_manager.dart';

import '../../widget/home_widgets/featured_property_card.dart';
import '../../widget/home_widgets/most_viewed_property_card.dart';
import '../../widget/home_widgets/property_type_button.dart';
import '../../widget/home_widgets/slide_show.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(
              AppSize.s24,
            ),
            bottomLeft: Radius.circular(
              AppSize.s24,
            ),
          ),
        ),
        title: const TextUtils(
          text: "HOME",
          fontWeight: FontWeightManager.regular,
          fontSize: FontSize.s20,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            left: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                          border: settingController.isLightMode.value
                              ? Border.all(
                                  color: ColorManager.black.withOpacity(0.05),
                                )
                              : null,
                          color: Theme.of(context).appBarTheme.backgroundColor,
                        ),
                        child: TextField(
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                            fontFamily: 'Outfit',
                          ),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                              fontFamily: 'Outfit',
                            ),
                            hintText: 'Search',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 16.0,
                            ),
                          ),
                          onChanged: (value) {},
                          cursorColor: ColorManager.primary,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: settingController.isLightMode.value
                            ? Border.all(
                                color: ColorManager.black.withOpacity(0.05),
                              )
                            : null,
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                        color: Theme.of(context).appBarTheme.backgroundColor,
                      ),
                      margin: const EdgeInsets.only(right: 8.0, left: 8.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.filter_list,
                          color: Theme.of(context).iconTheme.color,
                        ),
                        onPressed: () {
                          Get.to(
                            FiltersScreen(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 5.5,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: true,
                  viewportFraction: 1,
                  initialPage: 0,
                  autoPlayCurve: Curves.easeInOutCubicEmphasized,
                  animateToClosest: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                ),
                items: const [
                  SlideShow(),
                  SlideShow(),
                  SlideShow(),
                  SlideShow(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      buildPropertyButton(
                        'Villa',
                        Icons.villa_rounded,
                        Theme.of(context).appBarTheme.backgroundColor!,
                        Theme.of(context).iconTheme.color!,
                        Theme.of(context).textTheme.bodyMedium!.color!,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 35,
                      ),
                      buildPropertyButton(
                        'Land',
                        Icons.landscape_rounded,
                        Theme.of(context).appBarTheme.backgroundColor!,
                        Theme.of(context).iconTheme.color!,
                        Theme.of(context).textTheme.bodyMedium!.color!,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 35,
                      ),
                      buildPropertyButton(
                        'House',
                        Icons.home,
                        Theme.of(context).appBarTheme.backgroundColor!,
                        Theme.of(context).iconTheme.color!,
                        Theme.of(context).textTheme.bodyMedium!.color!,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 35,
                      ),
                      buildPropertyButton(
                        'WareHouse',
                        Icons.warehouse,
                        Theme.of(context).appBarTheme.backgroundColor!,
                        Theme.of(context).iconTheme.color!,
                        Theme.of(context).textTheme.bodyMedium!.color!,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 35,
                      ),
                      buildPropertyButton(
                        'More',
                        Icons.more_horiz_rounded,
                        Theme.of(context).appBarTheme.backgroundColor!,
                        Theme.of(context).iconTheme.color!,
                        Theme.of(context).textTheme.bodyMedium!.color!,
                      ),
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
                  padding: const EdgeInsets.fromLTRB(0, 14, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUtils(
                        text: 'Featured Properties',
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                        fontWeight: FontWeightManager.regular,
                        fontSize: FontSize.s18,
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
                    padding: const EdgeInsets.fromLTRB(8, 4, 0, 0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          HomePropertyCard(),
                          HomePropertyCard(),
                          HomePropertyCard(),
                          HomePropertyCard(),
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
                  padding: const EdgeInsets.fromLTRB(0, 14, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUtils(
                        text: 'Most Viewed',
                        color: Theme.of(context).textTheme.bodyMedium!.color,
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
                  height: MediaQuery.of(context).size.height * 1.92,
                  child: GridView.count(
                    childAspectRatio: 0.57,
                    shrinkWrap: false,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    children: [
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
