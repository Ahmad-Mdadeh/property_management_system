import 'dart:io';

import 'package:path/path.dart';
import 'package:get/get.dart';
import 'package:property_management_system/models/info_profile.dart';
import 'package:property_management_system/resources/server_manager.dart';
import 'package:http/http.dart' as http;

class ProfileService {
  Future getInfoProfile(String token) async {
    var url = Uri.parse(ServerSet.domainNameServer + ServerSet.showProfile);
    try {
      http.Response response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var infoProfile = infoProfileFromJson(response.body);
        return infoProfile;
      }
    } catch (e) {
      Get.snackbar(
        "Error !",
        e.toString(),
      );
    }
  }

  Future updateInfoProfile(String token, String name) async {
    var url = Uri.parse(
        "${ServerSet.domainNameServer}${ServerSet.editProfile}name=$name");
    try {
      http.Response response = await http.put(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        var infoProfile = infoProfileFromJson(response.body);
        return infoProfile;
      }
    } catch (e) {
      Get.snackbar(
        "Error !",
        e.toString(),
      );
    }
  }

  Future uploadImage(File file, String token) async {
    var url =
        Uri.parse(ServerSet.domainNameServer + ServerSet.uploadPhotoProfile);
    http.MultipartRequest multipartRequest = http.MultipartRequest(
      "POST",
      url,
    );
    var length = await file.length();
    var stream = http.ByteStream(
      file.openRead(),
    );
    http.MultipartFile multipartFile = http.MultipartFile(
      "image",
      stream,
      length,
      filename: basename(
        file.path,
      ),
    );
    multipartRequest.headers['Authorization'] = 'Bearer $token';
    multipartRequest.files.add(
      multipartFile,
    );
    var request = await multipartRequest.send();
    var response = await http.Response.fromStream(
      request,
    );

  }
}
