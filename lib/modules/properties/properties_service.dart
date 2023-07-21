import 'package:property_management_system/models/properties.dart';
import 'package:property_management_system/resources/server_manager.dart';
import 'package:http/http.dart' as http;

class PropertiesService {
  Future properties(String token, String postType) async {
    var url = Uri.parse(
      "${ServerSet.domainNameServer}${ServerSet.showMyPropertiesServer}posttype=rent",
    );
    http.Response response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      var myProperties = myPropertiesFromJson(response.body);
      print(myProperties[0].propertyType);
    }
  }
}
