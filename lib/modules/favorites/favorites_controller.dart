import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:property_management_system/models/favorites.dart';
import 'package:property_management_system/models/properties.dart';
import 'package:property_management_system/models/user.dart';
import 'package:property_management_system/modules/favorites/favorites_service.dart';

class FavoritesController extends GetxController {
  final FavoritesService _favoritesService = FavoritesService();
  late List<AllProperties> favoritesProperties;
  late Favorites favorites;
  RxBool isEmpty = false.obs;
  String postType = "";
  int idProperties = 0;
  RxBool isLoading = false.obs;
  RxList idList = [].obs;

  @override
  void onInit() {
    getFavoritesProperties();
    super.onInit();
  }

  Future<void> getFavoritesProperties() async {
    favoritesProperties =
        await _favoritesService.getFavoritesProperties(Users.token);
    idList.value =
        (favoritesProperties.map((element) => element.id ?? -1).toList()).obs;
    if (favoritesProperties.isNotEmpty) {
      isEmpty.value = true;
    }
    isLoading.value = true;
  }

  Future<void> addOrRemoveFavoritesProperties() async {
    favorites = await _favoritesService.addOrRemoveFavoritesProperties(
        Users.token, postType, idProperties);
    if (idList.contains(idProperties)) {
      idList.remove(idProperties);
    } else {
      idList.add(idProperties);
    }
    if (idList.isEmpty) {
      isEmpty.value = false;
    }


  }


  Future<void> refreshIndicator() async {
    isLoading.value = false;
    await getFavoritesProperties();
  }
}
