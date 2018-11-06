import 'package:flutter/material.dart';

import '../blocs/bloc_provider.dart';
import '../blocs/coupon_status_bloc.dart';

import '../widgets/gradient_appbar.dart';
import '../widgets/text_style/gesture_hint.dart';
import '../widgets/coupon/coupon_list.dart';

import '../style/colors.dart';

class CouponsScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    CouponStatusBloc couponStatusBloc =
        BlocProvider.of<CouponStatusBloc>(context);
    return DefaultTabController(
      length: 2,
      child: Container(
        child: Column(
          children: <Widget>[
            GradientAppBar('Coupon'),
            TabBar(
              indicatorColor: cherryRed,
              unselectedLabelColor: grey,
              labelColor: cherryRed,
              labelStyle: TextStyle(
                  color: const Color(0xffe10813),
                  fontWeight: FontWeight.w500,
                  fontFamily: "PingFangTC",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
              tabs: <Widget>[
                Tab(text: 'My coupon'),
                Tab(text: 'My Recommadation')
              ],
            ),
            GestureHint(),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  CouponsList(
                    couponStream: couponStatusBloc.outAvailableCoupons,
                  ),
                  CouponsList(
                    couponStream: couponStatusBloc.outRecommendCoupons,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
