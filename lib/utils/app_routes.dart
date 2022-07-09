import 'package:get/get.dart';
import 'package:wordier/screens/home_page.dart';
import 'package:wordier/screens/sign_in_page.dart';
import 'package:wordier/screens/sign_up_page.dart';

class AppRoutes {
  AppRoutes._();
  static final routes = [
    GetPage(name: '/HomePage', page: () => const HomePage()),
    GetPage(name: '/SignInPage', page: () => const SignInPage()),
    GetPage(name: '/SignUpPage', page: () => const SignUpPage()),
  ];
}
