import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/modules/home/home_controller.dart';
import 'package:property_management_system/modules/search_results/search_results_controller.dart';
import 'package:property_management_system/modules/search_results/search_results_screen.dart';

import '../../resources/color_manager.dart';

class SearchBar extends StatelessWidget {
  final SearchResultsController _searchResultsController =
      Get.put(SearchResultsController());
  SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Theme.of(context).textTheme.bodyMedium!.color,
        fontFamily: 'Outfit',
      ),
      decoration: InputDecoration(
        hintStyle: TextStyle(
          color: Theme.of(context).textTheme.bodyMedium!.color,
          fontFamily: 'Outfit',
        ),
        hintText: 'search'.tr,
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
      cursorColor: ColorManager.primary,
      onSubmitted: (value) {
        Get.to(SearchResult());
        _searchResultsController.getSearchResult(value);
      },
    );
  }
}
