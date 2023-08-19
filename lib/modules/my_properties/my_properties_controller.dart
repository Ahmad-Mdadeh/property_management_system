import 'package:get/get.dart';
import 'package:property_management_system/models/my_properties.dart';
import 'package:property_management_system/models/user.dart';
import 'package:property_management_system/modules/my_properties/my_properties_service.dart';
import 'package:property_management_system/resources/color_manager.dart';

class MyPropertiesController extends GetxController {
  RxBool isSelectedSell = false.obs;
  RxBool isSelectedRent = true.obs;
  RxBool isLoading = false.obs;
  RxBool checkDelete = false.obs;
  late RxList post = [].obs;
  late RxList postRent = <RentPost>[].obs;
  late RxList postSale = <SalePost>[].obs;
  String postType = "";
  int id = 0;

  final MyPropertiesService _propertiesService = MyPropertiesService();

  @override
  void onInit() async {
    await getTypeMyProperties();
    super.onInit();
  }

  Future<void> getTypeMyProperties() async {
    post.value = await _propertiesService.getMyProperties(Users.token);
    if (post.isNotEmpty) {
      postRent.value = post[0];
      postSale.value = post[1];
      isLoading.value = true;
    }
  }

  Future<void> deleteMyProperty() async {
    checkDelete.value = await _propertiesService.getDeleteMyProperties(
        Users.token, postType, id);
  }

  void checkIsDeleteMyProperty() async {
    isLoading.value = false;
    await deleteMyProperty();
    await getTypeMyProperties();
    Get.snackbar(
      _propertiesService.success.toString().toUpperCase(),
      _propertiesService.message.toString(),
      colorText: ColorManager.white,
      snackPosition: SnackPosition.TOP,
    );
  }
}
