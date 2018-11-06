import 'package:flutter/material.dart';

// bloc
import '../blocs/bloc_provider.dart';
import '../blocs/coupon_status_bloc.dart';

// model
import '../models/shop_model.dart';
// widget
import '../widgets/gradient_appbar_back.dart';
import '../widgets/shop_detail/shop_detail_widget.dart';

class ShopDetailsScreen extends StatelessWidget {
  ShopDetailsScreen({
    Key key,
    this.shop,
  }) : super(key: key);
  final ShopModel shop;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBarBack(
            title: 'Shop Detail',
          ),
          Expanded(
            child: ShopDetailWidget(
                shopModel: shop,
                visitedStream:
                    BlocProvider.of<CouponStatusBloc>(context).outVisitedShops),
          ),
        ],
      ),
    );
  }
}
