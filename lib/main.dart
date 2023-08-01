import 'package:flutter/material.dart';
import 'package:validator_demo/shared_pref.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(label: Text('Enter your name')),
            ),
            TextField(
              controller: passwordController,
              decoration:
                  const InputDecoration(label: Text('Enter your paassword')),
            ),
            const SizedBox(
              height: 45,
            ),
            ElevatedButton(
                onPressed: () {
                  SharedPrefs.setUserName(
                    AppKeys.userName,
                    nameController.text,
                  );
                  SharedPrefs.setBool(AppKeys.isUserLoggedIn, true);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(),
                      )
                    : const Text('Login'))
          ],
        ),
      ),
    );
  }
}

class AppKeys {
  static const String isUserLoggedIn = "isUserLoggedIn";
  static const String userName = "userName";
  static const String lightMode = "lightMode";
  static const String darkMode = "darkMode";
  static const String saveInput = "saveInput";
}
