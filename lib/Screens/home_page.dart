import 'package:flutter/material.dart';
import 'package:wordier/utils/firebase_constans.dart';
import 'package:wordier/controllers/auth.dart';
import 'package:wordier/widgets/auth_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wordier"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AuthButton(
                onTap: () => {
                      authController.signOut(),
                    },
                text: "Sign-Out"),
          ],
        ),
      ),
    );
  }
}

@override
void dispose() {
  authController.dispose();
}
