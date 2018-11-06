import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/gradient_appbar.dart';
import '../widgets/buttons/primary_button.dart';

class GetCouponScreen extends StatefulWidget {
  @override
  _GetCouponScreenState createState() => _GetCouponScreenState();
}

class _GetCouponScreenState extends State<GetCouponScreen> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          GradientAppBar('Get Coupon'),
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
                  Text('靠近對方手機以取得coupon'),
                  Image.network('url'),
                  Text('你也可以..'),
                  PrimaryButton(
                    label: '掃瞄 QR-Code 取得 coupon',
                    onPressed: scan,
                  ),
                  Text(barcode),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode =
          'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}
