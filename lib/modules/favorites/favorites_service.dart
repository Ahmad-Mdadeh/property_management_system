import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_management_system/models/favorites.dart';
import 'package:property_management_system/models/properties.dart';
import 'package:property_management_system/modules/settings/settings_controller.dart';
import 'package:property_management_system/resources/color_manager.dart';
import 'package:property_management_system/resources/server_manager.dart';
import 'package:http/http.dart' as http;

class FavoritesService {
  final _settingController = Get.put(SettingController());

  Future getFavoritesProperties(String token) async {
    var url = Uri.parse(
      ServerSet.domainNameServer + ServerSet.showFavoritesPropertiesEndPoints,
    );
    try {
      http.Response response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        List<AllProperties> properties = allPropertiesFromJson(response.body);
        return properties;
      }
    } catch (e) {
      Get.snackbar("Error !", e.toString());
      return [];
    }
  }

  Future addOrRemoveFavoritesProperties(
      String token, String postType, id) async {
    var url = Uri.parse(
      "${ServerSet.domainNameServer}${ServerSet.showPropertiesEndPoints}/$id/favorite",
    );
    try {
      http.Response response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: {
          "posttype": postType,
        },
      );
      if (response.statusCode == 200) {
        var properties = favoritesFromJson(response.body);
        return properties;
      }
    } catch (e) {
      Get.snackbar(
        "Error !",
        e.toString(),
      );
    }
  }
}
