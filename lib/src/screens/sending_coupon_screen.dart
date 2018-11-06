import 'dart:async';

import 'package:flutter/material.dart';

import '../api/api.dart';

import '../models/coupon_model.dart';

import '../widgets/buttons/primary_button.dart';
import '../widgets/gradient_appbar.dart';

class SendingCouponScreen extends StatelessWidget {
  SendingCouponScreen({
    Key key,
    @required this.couponModel,
  }) : super(key: key);

  final CouponModel couponModel;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar('Sending Coupon'),
          Card(
            margin: EdgeInsets.only(top: 50.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.5),
            ),
            elevation: 4.0,
            child: Container(
              height: 460.0,
              width: 340.0,
              child: Column(
                children: <Widget>[
                  Text('靠近對方手機以傳送coupon'),

                  ///
                  /// 要抓其他有開享享app的手機訊號
                  /// 抓到訊號後直接顯示把user頭像wrap在Inkwell裡面
                  /// ontap帶著抓到訊號導到輸入推薦理由的畫面
                  ///

                
                  Text('你也可以..'),
                  PrimaryButton(
                    label: '輸入對方電話號碼',

                    ///
                    /// 帶著輸入的電話導到輸入推薦理由的畫面
                    ///

                    onPressed: null,
                  ),
                  PrimaryButton(
                    label: '以QR-code傳送coupon',

                    ///
                    /// 導到輸入推薦理由的畫面
                    /// Generate QRCode
                    ///

                    onPressed: null,
                  ),
                ],
              ),
            ),
          ),
          OutlineButton(
            child: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
