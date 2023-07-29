const String validationEmail = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const String validationName = r"^[a-z A-Z]+$";
const String validationPassword = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}|:;<>,.?/~]).{8,}$';
const String validationPhone = r"^[0-9]{1,12}$";

class AppStrings {
  static const String onBoardingTitle1 = "Manage Your Properties";
  static const String onBoardingTitle2 = "Communicate with Owners";
  static const String onBoardingTitle3 = "Search for Properties";

  static const String onBoardingSubTitle1 =
      "With our application, you can easily sell, or rent your properties with confidence.";
  static const String onBoardingSubTitle2 =
      "Use our app to easily communicate with property owners and negotiate deals for investing properties.";
  static const String onBoardingSubTitle3 =
      "Find the perfect property to buy or rent using our app's search and filtering options.";
}
