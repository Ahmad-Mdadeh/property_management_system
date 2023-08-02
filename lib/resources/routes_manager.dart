import 'package:get/get.dart';
import 'package:property_management_system/bindings/login_binding.dart';
import 'package:property_management_system/bindings/on_boarding_binding.dart';
import 'package:property_management_system/bindings/register_binding.dart';
import 'package:property_management_system/modules/base/base_screen.dart';
import 'package:property_management_system/modules/filters/filters_screen.dart';
import 'package:property_management_system/modules/home/home_screen.dart';
import 'package:property_management_system/modules/otp/otp_screen.dart';
import 'package:property_management_system/modules/properties_type/properties_type_screen.dart';
import 'package:property_management_system/modules/register/register_screen.dart';
import 'package:property_management_system/modules/onBoarding/on_boarding_screen.dart';
import 'package:property_management_system/modules/register/register_screen.dart';
import 'package:property_management_system/modules/splash/splash_screen.dart';

import '../bindings/register_binding.dart';
import '../modules/login/login_screen.dart';

class AppRoutes {
  static const splash = Routes.splash;
  static const onBoarding = Routes.onBoarding;
  static const baseScreen = Routes.baseScreen;
  static const login = Routes.login;
  static const register = Routes.register;
  static const propertyDetails = Routes.propertyDetails;
  static const home = Routes.home;
  static const filters = Routes.filters;
  static const map = Routes.map;
  static const propertyTypes = Routes.propertyTypes;

  static final getPages = [
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
    GetPage(
        name: Routes.onBoarding,
        page: () => const OnBoardingScreen(),
        binding: OnBoardingBinding()),
    GetPage(
        name: Routes.login, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(
        name: Routes.register,
        page: () => RegisterScreen(),
        binding: RegisterBinding()),
    GetPage(name: Routes.baseScreen, page: () => BaseScreen()),
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.filters, page: () => FiltersScreen()),
    GetPage(name: Routes.propertyTypes, page: () => const PropertyTypesScreen())
  ];
}

class Routes {
  static const splash = '/splash';
  static const onBoarding = '/onBoarding';
  static const baseScreen = '/BaseScreen';
  static const login = '/login';
  static const register = '/register';
  static const propertyDetails = '/property_details';
  static const home = '/home';
  static const filters = '/filters';
  static const map = '/map';
  static const propertyTypes = '/propertTypes';
}
