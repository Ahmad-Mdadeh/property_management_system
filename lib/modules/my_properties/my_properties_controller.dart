import 'package:get/get.dart';
import 'package:property_management_system/models/properties.dart';
import 'package:property_management_system/models/user.dart';
import 'package:property_management_system/modules/my_properties/my_properties_service.dart';

class MyPropertiesController extends GetxController {
  RxBool isSelectedRent = true.obs;
  RxBool isSelectedSell = false.obs;
  RxBool isSelected = false.obs;

  // String postType = "";
  late List<MyProperties> myPropertiesRent = [];
  late List<MyProperties> myPropertiesSale = [];
  final MyPropertiesService _propertiesService =MyPropertiesService();

  @override
  void onInit() async {
    myPropertiesRent =
        await _propertiesService.getProperties(User.token, "rent");
    myPropertiesSale =
        await _propertiesService.getProperties(User.token, "sale");
    super.onInit();
  }

  void getTypeMyProperties(String postType) async {
    myPropertiesRent =
        await _propertiesService.getProperties(User.token, postType);
    myPropertiesSale =
        await _propertiesService.getProperties(User.token, postType);
  }
}
