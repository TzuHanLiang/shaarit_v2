import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'src/screens/register_screen_1.dart';
// import 'src/screens/login_screen_2.dart';
// import 'src/screens/register_screen_2.dart';
// import 'src/screens/login_screen_1.dart';
// import 'src/screens/login_or_register.dart';
// import 'src/screens/setting_screen.dart';
// import 'src/screens/coupons_screen.dart';
import 'src/screens/shops_screen.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        // body: LoginScreen1(),
        // body: RegisterScreen2(),
        // body: RegisterScreen1(),
        // body: LoginScreen2(),
        // body: SettingScreen(),
        // body: LoginOrRegisterScreen(),
        body: ShopsScreen(),
      ),
    );
  }
}
