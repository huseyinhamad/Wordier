import 'package:get/get.dart';
import 'package:wordier/screens/home_page.dart';
import 'package:wordier/screens/sign_in_page.dart';
import 'package:wordier/screens/sign_up_page.dart';

class AppRoutes {
  AppRoutes._();
  static final routes = [
    GetPage(name: '/home', page: () => const HomePage()),
    GetPage(name: '/signin', page: () => const SignInPage()),
    GetPage(name: '/signup', page: () => const SignUpPage()),
  ];
}
