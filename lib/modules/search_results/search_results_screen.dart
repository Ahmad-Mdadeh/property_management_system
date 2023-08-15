import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/search_results/search_results_controller.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/text_manager.dart';
import 'package:property_management_system/widget/home_widgets/home_property_card.dart';
import 'package:property_management_system/widget/my_properties/my_properties_card.dart';
import 'package:property_management_system/widget/property_details/property_card.dart';

class SearchResult extends StatelessWidget {
  final SearchResultsController _searchResultController =
      Get.put(SearchResultsController());

  final _settingController = Get.put(SettingController());

  SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        title: const TextUtils(
            text: 'Result', fontWeight: FontWeight.normal, fontSize: 20),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
