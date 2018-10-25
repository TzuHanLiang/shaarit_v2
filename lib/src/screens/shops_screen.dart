import 'package:flutter/material.dart';

import '../widgets/gradient_appbar.dart';
import '../widgets/shopslist_bottomsheet.dart';
import '../widgets/buttons/floating_button.dart';

class ShopListPage extends StatelessWidget {


  Widget build(BuildContext context) {
    void _showModalBottomSheet() {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return ShopsListBottomSheet();
        },
      );
    }

    return Scaffold(
        body: new Column(
          children: <Widget>[
            GradientAppBar('Shops'),
            
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingButton(() => _showModalBottomSheet()));
  }
}
