import 'package:get/get.dart';

import 'package:property_management_system/modules/splash/splash_screen.dart';


class AppRoutes {
  static const splash = Routes.splash;
  static const onBoarding = Routes.onBoarding;
  static const login = Routes.login;
  static const register = Routes.register;
  static const home = Routes.home;
  static const warehouse = Routes.warehouse;
  static const warehouseDetails = Routes.warehouseDetails;

  static final getPages = [
    // GetPage(name: Routes.splash, page: () =>  const SplashScreen1()),
    // GetPage(name: Routes.onBoarding, page: () =>  OnBoarding(),binding : OnBoardingBinding()),
    GetPage(name: Routes.login, page: () =>  const SplashScreen1()),
    // GetPage(name: Routes.home, page: () =>   HomeScreen()),
    // GetPage(name: Routes.register, page: () => const Register(),binding: RegisterBinding()),
    // GetPage(name: Routes.warehouse, page: () =>  WareHouse(),binding: WareHouseBinding()),
    // GetPage(name: Routes.warehouseDetails, page: () =>  WareHouseDetails(),binding: WareHouseBinding()),
  ];
}

class Routes {
  static const splash = '/splash';
  static const onBoarding = '/onBoarding';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const warehouse = '/warehouse';
  static const warehouseDetails = '/warehouseDetails';
}
