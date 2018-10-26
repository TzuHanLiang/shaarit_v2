import 'package:flutter/material.dart';
import '../../models/coupon_model.dart';

class CouponCard extends StatelessWidget {
  // final CouponModel coupon;
  // temperory
  final coupon;
  final int couponIndex;

  CouponCard(this.coupon, this.couponIndex);

  @override
  Widget build(BuildContext context) {
    return  Card(
        color: Colors.red,
        elevation: 6.0,
        margin: EdgeInsets.all(10.0),
        child: Column(
        children: <Widget>[
          Image.asset(
            coupon.image,
            height: 188.0,
            width: 320.0,
            fit: BoxFit.cover,
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 20.0),
            child: Row(
              children: <Widget>[
                Column(children: <Widget>[
                  FlatButton(
                    child: Text(coupon.shopName),
                    onPressed: () {},
                  ),
                  Text('${coupon.shopType}/${coupon.category}'),
                  // Text('被推薦過：${coupon.giver.length} 次'),
                ]),
                Row(
                  children: <Widget>[
                    Text(
                      '${coupon.amount}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 60.0),
                    ),
                    Column(children: <Widget>[
                      Text(
                        '%',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Off',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ])
                  ],
                )
              ],
            ),
          ),
        ]),
      
    );
  }
}
