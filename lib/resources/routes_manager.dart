import 'package:get/get.dart';
import 'package:property_management_system/bindings/login_binding.dart';
import 'package:property_management_system/bindings/on_boarding_binding.dart';

import 'package:property_management_system/modules/home/home_screen.dart';

import 'package:property_management_system/modules/base/base_screen.dart';

import 'package:property_management_system/modules/login/login_screen.dart';
import 'package:property_management_system/modules/onBoarding/on_boarding_screen.dart';
import 'package:property_management_system/modules/property_detail/property_details_screen.dart';
import 'package:property_management_system/modules/splash/splash_screen.dart';



class AppRoutes {
  static const splash = Routes.splash;
  static const onBoarding = Routes.onBoarding;
  static const baseScreen = Routes.baseScreen;
  static const login = Routes.login;
  static const propertyDetails = Routes.propertyDetails;
  static const home = Routes.home;

  static final getPages = [
    GetPage(name: Routes.splash, page: () =>  BaseScreen()),
    GetPage(name: Routes.onBoarding, page: () => const OnBoardingScreen(), binding: OnBoardingBinding()),
    GetPage(name: Routes.login, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(name: Routes.propertyDetails, page: () => const PropertyDetailsScreen()),
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.onBoarding, page: () =>   const OnBoardingScreen(),binding: OnBoardingBinding()),
    GetPage(name: Routes.login, page: () =>   LoginScreen(),binding: LoginBinding()),
    GetPage(name: Routes.propertyDetails, page: () => const PropertyDetailsScreen()),
    // GetPage(name: Routes.home, page: () =>   HomeScreen()),

    // GetPage(name: Routes.register, page: () => const Register(),binding: RegisterBinding()),
    // GetPage(name: Routes.warehouse, page: () =>  WareHouse(),binding: WareHouseBinding()),
    // GetPage(name: Routes.warehouseDetails, page: () =>  WareHouseDetails(),binding: WareHouseBinding()),
  ];
}

class Routes {
  static const splash = '/splash';
  static const onBoarding = '/onBoarding';
  static const baseScreen = '/BaseScreen';
  static const login = '/login';
  static const propertyDetails = '/property_details';
  static const home = '/home';
}
