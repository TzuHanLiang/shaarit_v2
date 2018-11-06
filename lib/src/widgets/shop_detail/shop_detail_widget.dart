import 'package:flutter/material.dart';
import 'dart:async';

// model
import '../../models/coupon_model.dart';
import '../../models/shop_model.dart';

// bloc
import '../../blocs/bloc_provider.dart';
import '../../blocs/coupon_status_bloc.dart';

// widget
import 'shop_info.dart';
import 'coupon_intro.dart';
import 'coupon_card_widget.dart';

// Screen
import '../../screens/coupon_details_screen.dart';

class ShopDetailWidget extends StatefulWidget {
  ShopDetailWidget({
    Key key,
    this.shopModel,
    @required this.visitedStream,
  }) : super(key: key);

  final ShopModel shopModel;
  final Stream<List<ShopModel>> visitedStream;

  @override
  State<StatefulWidget> createState() => ShopDetailWidgetState();
}

class ShopDetailWidgetState extends State<ShopDetailWidget> {
  bool expandCouponIntro = false;
  CouponStatusBloc _visitBloc;

  /// In order to determine whether this particular shop is
  /// part of the list of visited shops, we need to inject the stream
  /// that gives us the list of all visited shops to THIS instance
  /// of the BLoC
  StreamSubscription _visitSubscription;
  @override
  void initState() {
    super.initState();
    _createBloc();
  }

  /// As Widgets can be changed by the framework at any time,
  /// we need to make sure that if this happens, we keep on
  /// listening to the stream that notifies us about favorites
  @override
  void didUpdateWidget(ShopDetailWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _disposeBloc();
    _createBloc();
  }

  @override
  void dispose() {
    _disposeBloc();
    super.dispose();
  }

  void _createBloc() {
    _visitBloc = CouponStatusBloc.isVisit(widget.shopModel);
    // Simple pipe from the stream that lists all the visited shops into
    // the BLoC that processes THIS particular shop
    _visitSubscription =
        widget.visitedStream.listen(_visitBloc.inVisitedShops.add);
  }

  void _disposeBloc() {
    _visitSubscription.cancel();
    _visitBloc.dispose();
  }

  Widget build(BuildContext context) {
    CouponStatusBloc couponBloc = BlocProvider.of<CouponStatusBloc>(context);
    List<Widget> children = <Widget>[
      ShopInfo(shop: widget.shopModel),
    ];
    children.add(
      // buildCouponIntro()
      StreamBuilder<bool>(
        stream: _visitBloc.outIsVisited,
        initialData: false,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          snapshot.data
              ? expandCouponIntro
                  ? Column(
                      children: <Widget>[
                        CouponIntro(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              expandCouponIntro = !expandCouponIntro;
                            });
                          },
                          child: Column(
                            children: <Widget>[
                              Text('收起'),
                              Icon(
                                Icons.keyboard_arrow_up,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : InkWell(
                      child: Column(
                        children: <Widget>[
                          Text('展開'),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          )
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          expandCouponIntro = !expandCouponIntro;
                        });
                      },
                    )
              : Column(
                  children: <Widget>[
                    CouponIntro(),
                    Container(
                      child: Column(
                        children: <Widget>[
                          //avater
                          // IconButton
                        ],
                      ),
                    )
                  ],
                );
        },
      ),
    );
    children.add(
      // 回訪次數(shopId)
      StreamBuilder<Map<String, int>>(
        builder:
            (BuildContext context, AsyncSnapshot<Map<String, int>> snapshot) {
          return Column(
            children: <Widget>[
              Container(child: Text('回訪等級')),
            ],
          );
        },
      ),
    );
    children.add(Container(child: Text('我的Coupon')));
    children.add(
      // 跟判斷是否 visit 一樣, 把 total available coupons
      // 塞進判斷 shopId == specific shop id, then return a new list
      StreamBuilder<List<CouponModel>>(
        // stream: outAvailableCoupons,
        builder:
            (BuildContext context, AsyncSnapshot<List<CouponModel>> snapshot) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            sliver: new SliverFixedExtentList(
              itemExtent: 152.0,
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) =>
                    _buildCouponCard(context, couponBloc, index, snapshot.data),
                childCount: snapshot.data == null ? 0 : snapshot.data.length,
              ),
            ),
          );
        },
      ),
    );
    children.add(Container(child: Text('我推薦的')));
    children.add(
      // 同上
      StreamBuilder<List<CouponModel>>(
        // stream: outRecommendCoupons ,
        builder:
            (BuildContext context, AsyncSnapshot<List<CouponModel>> snapshot) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            sliver: new SliverFixedExtentList(
              itemExtent: 152.0,
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) =>
                    _buildCouponCard(context, couponBloc, index, snapshot.data),
                childCount: snapshot.data == null ? 0 : snapshot.data.length,
              ),
            ),
          );
        },
      ),
    );

    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: children,
    );
  }

  _buildCouponCard(BuildContext context, CouponStatusBloc couponBloc, int index,
      List<CouponModel> coupons) {
    final CouponModel coupon =
        (coupons != null && coupons.length > index) ? coupons[index] : null;
    if (coupon == null) {
      return Container(); // 或是像YouTube一樣先顯示灰色的格子們
    }
    return CouponCardWidget(
        key: Key('coupon_${coupon.couponId}'),
        couponModel: coupon,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return CouponDetailsScreen(coupon: coupon);
          }));
        });
  }
}
