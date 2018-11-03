import 'package:flutter/material.dart';

class ShopInfo extends StatelessWidget {
  final String _text;
  ShopInfo(this._text);

  Widget build(BuildContext context) {
    return Text(
      _text,
      style: const TextStyle(
          color: const Color(0xff000000),
          fontWeight: FontWeight.w500,
          fontFamily: "PingFangTC",
          fontStyle: FontStyle.normal,
          fontSize: 14.0),
    );
  }
}
