import 'package:flutter/material.dart';

import '../widgets/gradient_appbar.dart';
import '../widgets/shop/shopslist_bottomsheet.dart';
import '../widgets/buttons/floating_button.dart';
// import '../widgets/buttons/shoplist_top_button.dart';
import '../widgets/shop/shop_category_buttons.dart';
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

    List<String> selectOptions = ['泰式', '中菜', '日式', '美式', '韓式', '粵菜', '法式', '台菜'];

    return Scaffold(
      body: new Column(
        children: <Widget>[
          GradientAppBar('Shops'),
          SizedBox(height: 16.0),
          ShopTypeButtons(),
          SizedBox(height: 8.0),
          CategoryButtons(selectOptions: selectOptions),
          Flexible(
            child: Shops(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingButton(() => _showModalBottomSheet()),
    );
  }
}
