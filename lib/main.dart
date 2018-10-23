import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'src/screens/login_screen_2.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        body: LoginScreen2(),
      ),
    );
  }
}
