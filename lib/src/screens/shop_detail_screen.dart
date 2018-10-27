import 'package:flutter/material.dart';
import '../widgets/gradient_appbar_back.dart';
import '../blocs/coupons_provider.dart';
import '../blocs/shops_provider.dart';
import '../models/coupon_model.dart';
import '../models/shop_model.dart';
import '../widgets/shop_detail/shop_detail.dart';
import '../widgets/shop_detail/coupons_list.dart';
import '../widgets/shop_detail/coupon_info.dart';

class ShopsDetailScreen extends StatelessWidget {
  final int shopId;

  ShopsDetailScreen({this.shopId});

  Widget build(BuildContext context) {
    final shopBloc = ShopsProvider.of(context);

    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBarBack(
            title: 'Shop Detail',
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildShopdetail(context, shopBloc),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildShopdetail(context, ShopsBloc shopBloc) {
    final couponBloc = CouponsProvider.of(context);
    return StreamBuilder(
      stream: shopBloc.shopDetail,
      builder: (context, AsyncSnapshot<ShopModel> snapshot) {
        final shopDetail = snapshot.data;
        if (!snapshot.hasData) {
          return Container(child: Text('Loading...'));
        }

        return Column(
          children: <Widget>[
            ShopDetail(shopDetail),
            Container(
              child: shopDetail.visit > 0
                  ? Column(
                      children: <Widget>[
                        Text('${shopDetail.visit}'),
                        buildCouponsListWithShopId(couponBloc),
                      ],
                    )
                  : CouponInfo(),
            ),
          ],
        );
      },
    );
  }

  Widget buildCouponsListWithShopId(CouponsBloc couponBloc) {
    return StreamBuilder(
      stream: couponBloc.couponList,
      builder: (context, AsyncSnapshot<List<CouponModel>> snapshot) {
        final couponsList = snapshot.data[shopId];
        if (!snapshot.hasData) {
          return Container();
        }
        return CouponsListWithShopId(couponsList);
      },
    );
  }
}
