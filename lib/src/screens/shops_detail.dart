import 'package:flutter/material.dart';
import '../widgets/gradient_appbar_back.dart';
import '../blocs/coupons_provider.dart';
import '../blocs/shops_provider.dart';
import '../models/coupon_model.dart';
import '../models/shop_model.dart';

class ShopsDetail extends StatelessWidget {
  final int shopId;

  ShopsDetail({this.shopId});

  Widget build(BuildContext context) {
    final cBloc = CouponsProvider.of(context);
    final sBloc = ShopsProvider.of(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBarBack(
            title: 'Shop Detail',
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildShopsdetail(sBloc),
                buildCoupondetail(cBloc),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCoupondetail(CouponsBloc cBloc) {
    return StreamBuilder(
      stream: cBloc.couponList,
      builder: (context, AsyncSnapshot<List<CouponModel>> snapshot) {
        final coupondetail = snapshot.data[shopId];
        if (!snapshot.hasData) {
          return Container(
            child: Text('$shopId'),
            color: Colors.pink[100],
          );
        }
        return Container(
          child: Text(coupondetail.reason),
        );
      },
    );
  }

  Widget buildShopsdetail(ShopsBloc sBloc) {
    return StreamBuilder(
      stream: sBloc.shopsList,
      builder: (context, AsyncSnapshot<List<ShopModel>> snapshot) {
        final shopdetail = snapshot.data[shopId];
        if (!snapshot.hasData) {
          return Container(
            child: Text('$shopId'),
            color: Colors.pink[100],
          );
        }
        return Container(
          child: Text(shopdetail.image),
        );
      },
    );
  }
}
