import 'package:flutter/material.dart';

import '../widgets/gradient_appbar.dart';
import '../widgets/shopslist_bottomsheet.dart';
import '../widgets/buttons/floating_button.dart';
import '../widgets/buttons/shoplist_top_button.dart';
import '../widgets/shop/shop_type_buttons.dart';
import '../widgets/shop/shops.dart';

class ShopsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    void _showModalBottomSheet() {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return ShopsListBottomSheet();
        },
      );
    }

    List<String> buttonLabel = ['餐廳', '美容', '推拿', '桑拿', '餐廳', '美容', '推拿', '桑拿'];

    return Scaffold(
        body: new Column(
          children: <Widget>[
            GradientAppBar('Shops'),
            SizedBox(height: 16.0),
            ShopTypeButtons(),
            SizedBox(height: 8.0),
            Container(
              // color: Colors.purple[200],
              margin: EdgeInsets.only(left: 16.0),
              height: 35.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(buttonLabel.length, (int index) {
                  return ShopListTopButton(
                    buttonLabel[index],
                    onTap: () {},
                  );
                }),
              ),
            ),
          
            Flexible(
              child: Shops(),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingButton(() => _showModalBottomSheet()));
  }
}
