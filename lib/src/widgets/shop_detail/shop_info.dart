import 'package:flutter/material.dart';

import '../../models/shop_model.dart';

class ShopInfo extends StatelessWidget {
  final ShopModel shop;
  ShopInfo({this.shop});
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Image.network(shop.image),
      Text('${shop.shopName}'),
      Text('類別: ${shop.shopType}/${shop.category}'),
      Text('地址: ${shop.address}'),
      Text('地址: ${shop.address}'),
    ]);
  }

}
