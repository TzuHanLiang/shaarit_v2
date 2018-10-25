import 'package:flutter/material.dart';
import '../../widgets/buttons/shoplist_top_button.dart';

class ShopTypeButtons extends StatelessWidget {
  Widget build(BuildContext build) {
    return Container(
      // color: Colors.lightBlue,
      margin: EdgeInsets.only(left:16.0, right: 16.0),
      child: Row(
        children: <Widget>[
          ShopListTopButton('餐廳', onTap: () {}),
          ShopListTopButton('美容', onTap: () {}),
          ShopListTopButton('推拿', onTap: () {}),
          ShopListTopButton('桑拿', onTap: () {}),
        ],
      ),
    );
  }
}
