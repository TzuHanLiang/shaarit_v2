import 'package:flutter/material.dart';
import '../../presentation/shaarit_icons.dart';
// import '../../models/coupon_model.dart';

class RecommandCard extends StatelessWidget {
  // final CouponModel coupon;
  final coupon;
  final int couponIndex;

  RecommandCard(this.coupon, this.couponIndex);

  @override
  Widget build(BuildContext context) {
    return  Card(
        color: Colors.white,
        elevation: 6.0,
        margin: EdgeInsets.all(10.0),
        child: Column(
        children: <Widget>[
          Container(
            // height: 188.0,
            width: 320.0,
            
            
          ),
        ]),
      
    );
  }
}
