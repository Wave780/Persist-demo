import 'package:flutter/material.dart';
import 'package:validator_demo/main.dart';
import 'package:validator_demo/shared_pref.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userName;
  String? saveInput;
  String persistedInput = '';
  final inputController = TextEditingController();
  @override
  void initState() {
    init();
    // TODO: implement initState
    super.initState();
  }

  void init() async {
    userName ??= await SharedPrefs.getUserName(AppKeys.userName);
    saveInput ?? await SharedPrefs.getInput(AppKeys.saveInput);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: userName == ""
            ? const Text('Welcome')
            : Text("Welcome Back to $userName"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: inputController,
              decoration: const InputDecoration(hintText: 'Enter Your Age'),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    SharedPrefs.setInput(AppKeys.saveInput,
                        persistedInput = inputController.text);
                  });
                },
                child: Text('Save your Age')),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Age: ',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              persistedInput,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
