import 'package:flutter/material.dart';


class ShopTypeButton extends StatelessWidget {
  final Color buttonColor;
  final String text;
  final Color textColor;
  final Color borderColor; //
  final BorderStyle borderStyle; //
  final VoidCallback onPressed;

  ShopTypeButton({
    @required this.buttonColor,
    @required this.text,
    @required this.textColor,
    @required this.borderColor, //
    @required this.borderStyle, //
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 60.0,
      height: 35.0,
      child: _constructShopTypeButton(),
    );
  }

  Widget _constructShopTypeButton() {
    return RaisedButton(
      elevation: 0.0,
      color: buttonColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: borderColor,
          style: borderStyle,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(18.5),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
          fontFamily: "PingFangTC",
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}
