import 'package:flutter/material.dart';
import '../../models/shop_model.dart';

class ShopDetail extends StatelessWidget {
  final ShopModel shopDetail;
  ShopDetail(this.shopDetail);
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(shopDetail.image), //not sure...
        Text('${shopDetail.shopName}'),
        Text('類別: ${shopDetail.shopType}/${shopDetail.category}'),
        Text('地址: ${shopDetail.address}')
        //...
      ],
    );
  }
}
