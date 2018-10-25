import 'package:flutter/material.dart';
import '../widgets/gradient_appbar.dart';
import '../widgets/coupon/my_coupon.dart';
import '../style/colors.dart';

class MyCouponScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        child: Column(
          children: <Widget>[
            GradientAppBar('Coupon'),
            TabBar(
              indicatorColor: cherryRed,
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
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  MyCoupon(),
                  Container(child: Icon(Icons.settings_input_antenna)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
