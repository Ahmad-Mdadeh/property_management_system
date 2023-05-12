import 'package:get/get.dart';
import '../bindings/login_binding.dart';
import '../bindings/on_boarding_binding.dart';
import '../modules/login/login_screen.dart';
import '../modules/onBoarding/on_boarding_screen.dart';
import '../modules/splash/splash_screen.dart';
import '../modules/property_details/property_details_screen.dart';

class AppRoutes {
  static const splash = Routes.splash;
  static const onBoarding = Routes.onBoarding;
  static const baseScreen = Routes.baseScreen;
  static const login = Routes.login;
  static const register = Routes.register;
  static const home = Routes.home;
  static const propertyDetails = Routes.propertyDetails;

  static final getPages = [
    GetPage(name: Routes.splash, page: () => const SplashScreen1()),
    GetPage(
        name: Routes.onBoarding,
        page: () => const OnBoardingScreen(),
        binding: OnBoardingBinding()),
    GetPage(
        name: Routes.login, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(
        name: Routes.propertyDetails,
        page: () => const PropertyDetailsScreen()),

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
  static const register = '/register';
  static const home = '/home';
  static const propertyDetails = '/property_details';
}
