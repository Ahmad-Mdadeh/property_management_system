import 'package:get/get.dart';
import 'package:property_management_system/models/favorites.dart';
import 'package:property_management_system/models/properties.dart';
import 'package:property_management_system/models/user.dart';
import 'package:property_management_system/modules/favorites/favorites_service.dart';

class FavoritesController extends GetxController {
  final RxBool isHighlighted = true.obs;

  // final RxBool isFavorite = false.obs;
  final FavoritesService _favoritesService = FavoritesService();
  late List<AllProperties> favoritesProperties;
  late Favorites favorites;
  String postType = "";
  int idProperties = 0;
  RxBool isLoadingHart = true.obs;

  RxBool isLoading = false.obs;
  late RxList idList = [].obs;

  @override
  void onInit() {
    getFavoritesProperties();
    super.onInit();
  }

  Future<void> getFavoritesProperties() async {
    favoritesProperties =
    await _favoritesService.getFavoritesProperties(User.token);
    idList =
        (favoritesProperties.map((element) => element.id ?? -1).toList()).obs;
    isLoading.value = true;
  }

  void addOrRemoveFavoritesProperties() async {
    favorites = await _favoritesService.addOrRemoveFavoritesProperties(
        User.token, postType, idProperties);
    if (idList.contains(idProperties)) {
      idList.remove(idProperties);
    } else {
      idList.add(idProperties);
    }
    isLoadingHart.value = true;
  }

  Future <void> refreshIndicator() async{
    isLoading.value = false;
    getFavoritesProperties();

  }
}
