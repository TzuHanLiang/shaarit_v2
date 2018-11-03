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
    this.data,
  }) : super(key: key);

  final ShopModel data;

  Widget build(BuildContext context) {

    return 
    Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBarBack(
            title: 'Shop Detail',
          ),
          Expanded(
          
              child: ShopDetailWidget(
                shopModel: data,
                visitedStream: BlocProvider.of<CouponStatusBloc>(context).outVisitedShops
              ),
          ),
        ],
      ),
    
    );
  }

  // Widget buildShopdetail(ShopModel data) {


    // final couponBloc = CouponsProvider.of(context);
    // return StreamBuilder(
    //   stream: shopBloc.shopDetail,
    //   builder: (context, AsyncSnapshot<ShopModel> snapshot) {
    //     final shopDetail = snapshot.data;
    //     if (!snapshot.hasData) {
    //       return Container(child: Text('Loading...'));
    //     }

    //     return Column(
    //       children: <Widget>[
    //         ShopDetail(shopDetail),
    //         Container(
    //           child: shopDetail.visit > 0
    //               ? Column(
    //                   children: <Widget>[
    //                     Text('${shopDetail.visit}'),
    //                     buildCouponsListWithShopId(couponBloc),
    //                   ],
    //                 )
    //               : CouponInfo(),
    //         ),
    //       ],
    //     );
    //   },
    // );
  // }

//   Widget buildCouponsListWithShopId(CouponsBloc couponBloc) {
//     return StreamBuilder(
//       stream: couponBloc.couponList,
//       builder: (context, AsyncSnapshot<List<CouponModel>> snapshot) {
//         final couponsList = snapshot.data[shopId];
//         if (!snapshot.hasData) {
//           return Container();
//         }
//         return CouponsListWithShopId(couponsList);
//       },
//     );
  // }
}
