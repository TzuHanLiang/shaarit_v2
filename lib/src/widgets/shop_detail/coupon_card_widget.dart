import 'package:flutter/material.dart';
import '../../models/coupon_model.dart';


class CouponCardWidget extends StatefulWidget{
   CouponCardWidget({
    Key key,
    @required this.couponModel,
    @required this.onPressed,
  });

  final CouponModel couponModel;
  final VoidCallback onPressed;

  @override
  CouponCardWidgetState createState() => CouponCardWidgetState();
}
class CouponCardWidgetState extends State<CouponCardWidget>{
  Widget  build(BuildContext context){
    return Container();
  }
}