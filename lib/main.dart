import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:wordier/controllers/auth.dart';
import 'package:wordier/utils/app_routes.dart';
import 'package:wordier/utils/firebase_constans.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) {
    Get.put(AuthController());
  });

  // ignore: deprecated_member_use
  FlutterNativeSplash.removeAfter(initialization);
  runApp(const MyApp());
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 3));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wordier',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/HomePage",
      getPages: AppRoutes.routes,
    );
  }
}
