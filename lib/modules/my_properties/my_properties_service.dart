import 'package:property_management_system/models/my_properties.dart';
import 'package:property_management_system/resources/server_manager.dart';
import 'package:http/http.dart' as http;

class MyPropertiesService {
  List<Post>? _salePosts;
  List<Post>? _rentPosts;

  Future<List<List<Post>>> getMyProperties(String token) async {
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
}
