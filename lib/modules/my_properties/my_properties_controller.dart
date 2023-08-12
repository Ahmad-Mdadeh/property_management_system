import 'package:get/get.dart';
import 'package:property_management_system/models/my_properties.dart';
import 'package:property_management_system/models/user.dart';
import 'package:property_management_system/modules/my_properties/my_properties_service.dart';

class MyPropertiesController extends GetxController {
  RxBool isSelectedSell = false.obs;
  RxBool isSelectedRent = true.obs;
  RxBool isLoading = false.obs;
  late List post;
  late List<RentPost> postRent;
  late List<SalePost> postSale;
  String postType = "";


  final MyPropertiesService _propertiesService = MyPropertiesService();

  @override
  void onInit() async {
    getTypeMyProperties();
    super.onInit();
  }

  void getTypeMyProperties() async {
    post = await _propertiesService.getMyProperties(User.token);
    if (post.isNotEmpty) {
      postRent = post[0];
      postSale = post[1];
      isLoading.value = true;
    }
  }
}
