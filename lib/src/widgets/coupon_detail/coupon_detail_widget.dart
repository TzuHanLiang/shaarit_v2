import 'package:flutter/material.dart';
import 'dart:async';

// model
import '../../models/coupon_model.dart';
import '../../models/shop_model.dart';

// bloc
import '../../blocs/bloc_provider.dart';
import '../../blocs/coupon_status_bloc.dart';
import '../../blocs/shop_bloc.dart';
import '../../blocs/user_bloc.dart';

// widget
import 'coupon_info.dart';
import '../buttons/secondary_setting_button.dart';

class CouponDetailsWidget extends StatefulWidget {
  CouponDetailsWidget({
    Key key,
    @required this.couponModel,
  }) : super(key: key);

  final CouponModel couponModel;

  @override
  State<StatefulWidget> createState() => CouponDetailsWidgetState();
}

class CouponDetailsWidgetState extends State<CouponDetailsWidget> {
  ShopBloc _shopBloc;
  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _creatBloc();
  }

  @override
  void didUpdateWidget(CouponDetailsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _disposeBloc();
    _creatBloc();
  }

  void _creatBloc() {
    ///  這裡的概念是跟店家有關的資訊只有shopId是存在coupon卷上的 顯示coupon卷上店家資訊是再利用
    ///  Stream: shopBloc.outShop 取得
    ///  String shopId = widget.couponModel.shopId;
    ///  need to find a way to push shopId to the shopBloc.outShop Stream
    ///  add api in here to fetch shopModel: ShopModel shop = api.get(url${shopId})
    ///  shopBloc.inShop.add(shop);
    ///
    _shopBloc = ShopBloc.shopInfo(widget.couponModel.shopId);

    ///  if (widget.couponModel.record[source] == user){
    ///  _userBloc = UserBloc(widget.couponModel.record[sourceId]);
    ///  }
  }

  void _disposeBloc() {
    _shopBloc.dispose();
  }

  Widget build(BuildContext context) {
    List<Widget> children = <Widget>[
      _buildShopInfo(),
      _buildRecommendMessage(),
      CouponInfo(),
      _buildRecommendHistory(),
      SecondarySettingButton(
        label: '推薦給朋友',

        ///
        /// Navigation to couponDetailsScreen
        ///
        onPressed: () {},
      ),
      SecondarySettingButton(
        label: '在店家抵用Coupon',

        ///
        /// 先導到輸入此次消費金額的畫面
        /// Generate QRcode
        ///
        onPressed: () {},
      ),
      SecondarySettingButton(
        label: '查看店家資訊',

        ///
        /// Navigation to shopDetailsScreen
        ///
        onPressed: () {},
      ),
    ];
    return Column(
      children: children,
    );
  }

  Widget _buildShopInfo() {
    return StreamBuilder<ShopModel>(
        stream: _shopBloc.outShop,
        builder: (BuildContext context, AsyncSnapshot<ShopModel> snapShot) {
          return Column(
            children: <Widget>[
              InkWell(
                child: Image.asset(
                  snapShot.data.image,
                  height: 188.0,
                  width: 320.0,
                  fit: BoxFit.cover,
                ),

                ///
                /// Navigation to shopDetailsScreen
                ///
                onTap: () {},
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0, left: 20.0),
                child: Row(
                  children: <Widget>[
                    Column(children: <Widget>[
                      FlatButton(
                        child: Text(snapShot.data.shopName),

                        ///
                        /// Navigation to shopDetailsScreen
                        ///
                        onPressed: () {},
                      ),
                      Text(
                          '${snapShot.data.shopType}/${snapShot.data.category}'),
                      // Text('被推薦過：${coupon.giver.length} 次'),
                    ]),
                    Row(
                      children: <Widget>[
                        Text(
                          '${snapShot.data.amount}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 60.0),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '%',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Off',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  Widget _buildRecommendMessage() {
    return widget.couponModel.record['message'] != null
        ? StreamBuilder(
            /// need to figure out where and how to fetch user data by providing userId
            // stream: userBloc.outUserInfo,
            builder: (BuildContext context, snapshot) {
              return Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.network('url${snapshot.data.averta}'),
                      Text('${snapshot.data.userName}'),
                    ],
                  ),
                  Text(widget.couponModel.record['message']),
                ],
              );
            },
          )
        : Container(
            child: Text('推薦這張coupon給朋友，按照對方消費金額，我可得到平台 15％ 回饋金'),
          );
  }

  Widget _buildRecommendHistory() {
    /// use list<String> userId to
    /// fetch avatar and build the chain of recommend history
    ///
    return ListView.builder(
      itemCount: widget.couponModel.giver.length,
      itemBuilder: (BuildContext context, int index) {
        return StreamBuilder(
          /// need to figure out where and how to fetch user data by providing userId
          // stream: userBloc.outUserInfo,
          builder: (BuildContext context, snapshot) {
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.network('url${snapshot.data.averta}'),
                    Text('${snapshot.data.userName}'),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
