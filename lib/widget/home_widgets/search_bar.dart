import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import '../../resources/color_manager.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBarAnimation(
      buttonColour: ColorManager.lightPrimary,
      cursorColour: ColorManager.lightPrimary,
      // searchBoxWidth: MediaQuery.of(context).size.width / 1.075,
      searchBoxColour: ColorManager.darkPrimary,
      enteredTextStyle:
          TextStyle(fontFamily: 'Outfit', color: ColorManager.white),
      textEditingController: TextEditingController(),
      isOriginalAnimation: true,
      enableKeyboardFocus: true,
      onExpansionComplete: () {
        debugPrint('do something just after searchbox is opened.');
      },
      onCollapseComplete: () {
        debugPrint('do something just after searchbox is closed.');
      },
      onPressButton: (isSearchBarOpens) {
        debugPrint(
            'do something before animation started. It\'s the ${isSearchBarOpens ? 'opening' : 'closing'} animation');
      },
      trailingWidget: Icon(
        Icons.search,
        size: 20,
        color: ColorManager.darkPrimary,
      ),
      secondaryButtonWidget: Icon(
        Icons.close,
        size: 20,
        color: ColorManager.darkPrimary,
      ),
      // buttonWidget: buildElevatedButton('Search', Icons.search));
      buttonWidget: Icon(Icons.search, size: 25, color: ColorManager.dark),
    );
  }
}
