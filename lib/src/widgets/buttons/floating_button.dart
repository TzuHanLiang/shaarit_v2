import 'package:flutter/material.dart';
import '../../style/colors.dart';
import '../../presentation/shaarit_icons.dart';

class FloatingButton extends StatelessWidget {
  Widget build(context) {
    return Theme(
      child: RaisedButton.icon(
        elevation: 0.0,
        highlightElevation: 0.0,
        disabledColor: white,
        disabledTextColor: black,
        textColor: white,
        onPressed: () {},
        icon: Icon(Shaarit.icfilter),
        label: Text(
          "Sort",
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: "DIN",
              fontStyle: FontStyle.normal,
              fontSize: 14.0),
        ),
      ),
      data: Theme.of(context).copyWith(
        buttonColor: cherryRed,
        buttonTheme: ButtonThemeData(
          height: 43.0,
          minWidth: 120.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21.5),
            side: BorderSide(
              color: lightestGray,
              style: BorderStyle.none,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
