import 'dart:async';

import 'package:flutter/material.dart';

import '../../api/api.dart';

import '../../blocs/coupon_status_bloc.dart';

import '../../models/shop_model.dart';

import '../text_style/shop_info.dart';
import '../text_style/visit_state.dart';

class ShopCardWidget extends StatefulWidget {
  ShopCardWidget({
    Key key,
    @required this.shopModel,
    @required this.visitedStream,
    @required this.onPressed,
  }) : super(key: key);

  final ShopModel shopModel;
  final VoidCallback onPressed;
  final Stream<List<ShopModel>> visitedStream;

  @override
  State<StatefulWidget> createState() => ShopCardWidgetState();
}

class ShopCardWidgetState extends State<ShopCardWidget> {
  CouponStatusBloc _visitBloc;

  ///
  /// In order to determine whether this particular shop is
  /// part of the list of visited, we need to inject the stream
  /// that gives us the list of all visited shop to THIS instance
  /// of the BLoC
  ///
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _createVisitBloc();
  }

  ///
  /// As Widgets can be changed by the framework at any time,
  /// we need to make sure that if this happens, we keep on
  /// listening to the stream that notifies us about visited shops
  ///
  @override
  void didUpdateWidget(ShopCardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _disposeBloc();
    _createVisitBloc();
  }

  @override
  void dispose() {
    _disposeBloc();
    super.dispose();
  }

  void _createVisitBloc() {
    _visitBloc = CouponStatusBloc.isVisit(widget.shopModel);

    // Simple pipe from the stream that lists all the favorites into
    // the BLoC that processes THIS particular shop
    _subscription = widget.visitedStream.listen(_visitBloc.inVisitedShops.add);
  }

  void _disposeBloc() {
    _subscription.cancel();
    _visitBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[
      ClipRRect(
        borderRadius: new BorderRadius.circular(4.0),
        child: Image.network(
          'src',
          height: 120.0,
          width: 382.0,
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(height: 8.0),
      Container(
        constraints: BoxConstraints(
          maxHeight: 45.0,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        padding: const EdgeInsets.only(
          bottom: 16.0,
          left: 16.0,
          right: 16.0,
        ),
        child: _buildTextualInfo(widget.shopModel),
      ),
    ];

    //
    // If the shop is part of the visited Shops, put an visited notion to indicate it
    // A better way of doing this, would be to create a dedicated widget for this.
    // This would minimize the rebuild in case the icon would be toggled.
    // In this case, only the button would be rebuilt, not the whole movie card widget.
    //
    children.add(
      StreamBuilder<bool>(
          stream: _visitBloc.outIsVisited,
          initialData: false,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            return Positioned(
              // because the children is inside of the ink,
              // so i can define the position according to the image size,
              top: 130.0,
              right: 350.0,
              child: snapshot.data == true
                  ? VisitState('已造訪 ｜')
                  : VisitState('未造訪 ｜'),
            );
          }),
    );

    return Ink(
      padding: EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0, bottom: 24.0),
      child: InkWell(
        onTap: widget.onPressed,
        child: Card(
          child: Stack(
            fit: StackFit.expand,
            children: children,
          ),
        ),
      ),
    );
  }

  Widget _buildTextualInfo(ShopModel shopModel) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Row(children: <Widget>[
            Expanded(child: ShopInfo(shopModel.shopName)),
            Text(
              '${shopModel.distance} m',
              style: const TextStyle(
                  color: const Color(0xff9b9b9b),
                  fontWeight: FontWeight.w500,
                  fontFamily: "PingFangTC",
                  fontStyle: FontStyle.normal,
                  fontSize: 12.0),
            ),
          ]),
        ),
        SizedBox(width: 9.0),
        Row(
          children: <Widget>[
            Text(
              "%",
              style: const TextStyle(
                  color: const Color(0xffe10813),
                  fontWeight: FontWeight.w700,
                  fontFamily: "ArialRoundedMT",
                  fontStyle: FontStyle.normal,
                  fontSize: 10.0),
            ),
            Text(
              'coupon : ${shopModel.amount}% ',
              style: const TextStyle(
                  color: const Color(0xffe10813),
                  fontWeight: FontWeight.w500,
                  fontFamily: "PingFangTC",
                  fontStyle: FontStyle.normal,
                  fontSize: 12.0),
            ),
            Text(
              "\$",
              style: const TextStyle(
                  color: const Color(0xffe10813),
                  fontWeight: FontWeight.w700,
                  fontFamily: "ArialRoundedMT",
                  fontStyle: FontStyle.normal,
                  fontSize: 7.0),
            ),
            Text(
              'bonus : ${shopModel.rebate.toInt}% ',
              style: const TextStyle(
                  color: const Color(0xffe10813),
                  fontWeight: FontWeight.w500,
                  fontFamily: "PingFangTC",
                  fontStyle: FontStyle.normal,
                  fontSize: 12.0),
            ),
          ],
        ),
      ],
    );
  }
}
