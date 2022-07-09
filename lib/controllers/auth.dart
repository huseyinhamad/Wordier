// ignore: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../Screens/home_page.dart';
import '../screens/sign_in_page.dart';
import '../utils/firebase_constans.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> firebaseUser;

  @override
  void onReady() async {
    firebaseUser = Rx<User?>(firebaseAuth.currentUser);

    firebaseUser.bindStream(firebaseAuth.userChanges());
    ever(firebaseUser, _handleAuthChanges);
    super.onReady();
  }

  _handleAuthChanges(user) {
    if (user == null) {
      Get.offAll(() => const SignInPage());
    } else {
      Get.offAll(() => const HomePage());
    }
  }

  void register(String email, password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      // ignore: empty_catches
    } catch (firebaseAuthException) {}
  }

  void login(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // ignore: empty_catches
    } catch (firebaseAuthException) {}
  }

  void signOut() async {
    try {
      await firebaseAuth.signOut();
      // ignore: empty_catches
    } catch (firebaseAuthException) {}
  }
}
