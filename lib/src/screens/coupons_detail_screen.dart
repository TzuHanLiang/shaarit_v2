import 'package:flutter/material.dart';
import '../widgets/gradient_appbar_back.dart';
import '../blocs/coupons_provider.dart';
import '../models/coupon_model.dart';


class CouponsDetailScreen extends StatelessWidget {
  final int couponId;

  CouponsDetailScreen({this.couponId});

  Widget build(BuildContext context) {
    final couponBloc = CouponsProvider.of(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBarBack(
            title: 'Coupon Detail',
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildCoupondetail(context, couponBloc),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCoupondetail(context, CouponsBloc couponBloc) {
    final couponBloc = CouponsProvider.of(context);
    return StreamBuilder(
      stream: couponBloc.couponDetail,
      builder: (context, AsyncSnapshot<CouponModel> snapshot) {
        final couponDetail = snapshot.data;
        if (!snapshot.hasData) {
          return Container(child: Text('Loading...'));
        }
        return Column(
          children: <Widget>[
            //shopInfo...
            Text('${couponDetail.shopName}'),
            Container(
              child: couponDetail.recipientId != null
                  ? buildCouponsGiverLists(couponDetail)
                  : Container(),
            ),
            //couponInfo - how to use
            //navigation buttons
          ],
        );
      },
    );
  }

  Widget buildCouponsGiverLists(CouponModel couponDetail) {
    return Container(
        child: Text('${couponDetail.giver[couponDetail.giver.length - 1]}'));
  }
}
