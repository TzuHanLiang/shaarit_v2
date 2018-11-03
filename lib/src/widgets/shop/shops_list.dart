import 'package:flutter/material.dart';
import '../shop/shop_card_widget.dart';
import '../../screens/shop_details_screen.dart';
// import '../text_style/gesture_hint.dart';

import '../../blocs/bloc_provider.dart';
import '../../blocs/shop_bloc.dart';
import '../../blocs/coupon_status_bloc.dart';

import '../../models/shop_model.dart';

class ShopsList extends StatelessWidget {
  Widget build(BuildContext context) {
    ShopBloc shopBloc = BlocProvider.of<ShopBloc>(context);
    CouponStatusBloc couponStatusBloc =
        BlocProvider.of<CouponStatusBloc>(context);
    return Expanded(
        child: StreamBuilder(
      stream: shopBloc.outShopsList,
      builder: (BuildContext context, AsyncSnapshot<List<ShopModel>> snapshot) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data == null ? 0 : snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildShopCard(context, shopBloc, index, snapshot.data,
                  couponStatusBloc.outVisitedShops);
            });
      },
    ));
  }

  Widget _buildShopCard(BuildContext context, ShopBloc shopBloc, int index,
      List<ShopModel> shops, Stream<List<ShopModel>> visitedStream) {

    ///
    /// notify the ShopBloc that we are rendering the ShopModel<index>
    ///
    /// shopBloc.inShopIndex.add(index);
    /// 

    // get the ShopModel data
    final ShopModel shop =
        (shops != null && shops.length > index) ? shops[index] : null;
    if (shop == null) {
      return Container(); // 或是像YouTube一樣先顯示灰色的格子們
    }
    return ShopCardWidget(
      key: Key('shop_${shop.shopId}'),
      shopModel: shop,
      visitedStream: visitedStream,
      onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(
          builder:(context){
            return ShopDetailsScreen(data: shop);
          }
        ));
      }
    );
  }
}
