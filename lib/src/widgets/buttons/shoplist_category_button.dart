import 'package:flutter/material.dart';

class ShopListCategoryButton extends StatelessWidget {
  final Function _onTap;
  final String _label;
  ShopListCategoryButton(this._label, this._onTap);

  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap(),
      child: new Container(
        margin: EdgeInsets.only(left:8.0),
        width: 60.0,
        height: 35.0,
        decoration: new BoxDecoration(
          border: new Border.all(color: Color(0xff9b9b9b)),
          borderRadius: new BorderRadius.circular(18.5),
        ),
        child: new Center(
          child: Text(
            _label,
            style: const TextStyle(
                color: const Color(0xff9b9b9b),
                fontWeight: FontWeight.w400,
                fontFamily: "PingFangTC",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
          ),
        ),
      ),
    );
  }
}
