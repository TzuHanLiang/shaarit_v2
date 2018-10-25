import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function _onTap;
  final String _label;
  BottomButton(this._label, this._onTap);

  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap(),
      child: new Container(
        // margin: EdgeInsets.only(left: 8.0),
        // width: 60.0,
        constraints: BoxConstraints(maxWidth:85.0),
        height: 16.0,
        child: Text(
          _label,
          style: const TextStyle(
              color: const Color(0xff4a4a4a),
              fontWeight: FontWeight.w400,
              fontFamily: "PingFangTC",
              fontStyle: FontStyle.normal,
              fontSize: 16.0),
        ),
      ),
    );
  }
}
