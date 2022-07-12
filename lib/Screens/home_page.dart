import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wordier/models/word.dart';
import 'package:wordier/utils/firebase_constans.dart';
import 'package:wordier/controllers/auth.dart';
import 'package:wordier/widgets/auth_button.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<List<Word>> fetchWords() async {
  final response = await http
      .get(Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/hello'));

  if (response.statusCode == 200) {
    return [for (final item in jsonDecode(response.body)) Word.fromJson(item)];
  } else {
    throw Exception('Failed to get word');
  }
}

class _HomePageState extends State<HomePage> {
  AuthController authController = AuthController();
  late Future<List<Word>> _word;

  @override
  void initState() {
    super.initState();
    _word = fetchWords();
  }

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
            FutureBuilder<List<Word>>(
              future: _word,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(_word.toString());
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(height: 30),
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
