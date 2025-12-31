import 'package:get/get.dart';

import '../screens/Auth_modual/sign_up_screen/sign_up_screen.dart';
import '../screens/Auth_modual/sign_in_screen/sing_in_screen.dart';
import '../screens/home_modual/home_screen.dart';

class AppRoutes {

  static String signIn = "/SignInScreen";
  static String signUp = "/SignUpScreen";
  static String home = "/HomeScreen";

  static List<GetPage> routes = [
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: home, page: () => HomeScreen()),
  ];
}