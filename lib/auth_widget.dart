import 'package:declarative_navigation_example/main.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AuthWidgetState();
  }
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  prefsDataSource.setLoggedInState(true);
                },
                child: const Text("LOGIN"))));
  }
}
