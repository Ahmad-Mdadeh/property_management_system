import 'package:property_management_system/models/auth.dart';
import 'package:property_management_system/models/my_properties.dart';
import 'package:property_management_system/resources/server_manager.dart';
import 'package:http/http.dart' as http;

class MyPropertiesService {
  List<SalePost>? _salePosts;
  List<RentPost>? _rentPosts;
  String message = "";
  bool success = false;

  Future getMyProperties(String token) async {
    var url = Uri.parse(
      ServerSet.domainNameServer + ServerSet.showMyPropertiesEndPoints,
    );
    http.Response response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      _salePosts = myPropertiesFromJson(response.body).salePosts;
      _rentPosts = myPropertiesFromJson(response.body).rentPosts;
      return [_rentPosts!, _salePosts!];
    }
    return [];
  }


  Future getDeleteMyProperties(String token, String postType, int id) async {
    var url = Uri.parse(
      "${ServerSet.domainNameServer}${ServerSet
          .showPropertiesEndPoints}/$id?posttype=$postType",
    );
    http.Response response = await http.delete(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      success = authFromJson(response.body).success;
      message = authFromJson(response.body).message;
      return success;
    } else {
      message = authFromJson(response.body).message;
      success = authFromJson(response.body).success;
      return success;
    }
  }
}