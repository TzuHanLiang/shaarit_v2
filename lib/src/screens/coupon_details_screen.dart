import 'package:flutter/material.dart';

// widget
import '../widgets/gradient_appbar_back.dart';
import '../widgets/coupon_detail/coupon_detail_widget.dart';

// model
import '../models/coupon_model.dart';

class CouponDetailsScreen extends StatelessWidget {
  CouponDetailsScreen({
    Key key,
    this.coupon,
  }) : super(key: key);
  final CouponModel coupon;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBarBack(
            title: 'Coupon Detail',
          ),
          Expanded(
              child: CouponDetailsWidget(
            couponModel: coupon,
          )),
        ],
      ),
    );
  }
}
