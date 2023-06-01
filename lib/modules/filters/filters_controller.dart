import 'package:get/get.dart';

class FiltersController extends GetxController {
  RxBool isSelectedRent = false.obs;
  RxBool isSelectedSell = false.obs;
  RxBool isSelectedHouse = false.obs;
  RxBool isSelectedLand = false.obs;
  RxBool isSelectedVilla = false.obs;
  RxBool isSelectedWareHouse = false.obs;
  RxBool isSelectedAll = false.obs;

  void toggleRent() {
    isSelectedRent.toggle();
  }

  void toggleSell() {
    isSelectedSell.toggle();
  }

  void toggleHouse() {
    isSelectedHouse.toggle();
  }

  void toggleLand() {
    isSelectedLand.toggle();
  }

  void toggleVilla() {
    isSelectedVilla.toggle();
  }

  void toggleWareHouse() {
    isSelectedWareHouse.toggle();
  }

  void toggleAll() {
    isSelectedAll.toggle();
  }
}
