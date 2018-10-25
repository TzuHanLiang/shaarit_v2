import 'package:flutter/material.dart';

import 'style/colors.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      theme: buildThemeData(),
      title: 'Shaarit Version 2',
      home: Container(),
    );
  }
}

ThemeData buildThemeData() {
  final baseTheme = ThemeData.light();
  return baseTheme.copyWith(
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
          side: BorderSide(
              color: darkerGrey, style: BorderStyle.none, width: 1.0)),
      height: 44.0,
      minWidth: 160.0,
    ),
    buttonColor: cherryRed,
  );
}
