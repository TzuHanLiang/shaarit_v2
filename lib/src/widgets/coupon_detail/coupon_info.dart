import 'package:flutter/material.dart';

class CouponInfo extends StatelessWidget{
  Widget build(BuildContext context){
    return Column(children: <Widget>[
      Text('::::Coupon使用攻略！::::'),
      Text('>自己到店家折抵享用'),
      Text('>分享給朋友：每張Coupon可得1xp'),
      Text('''朋友使用你的Coupon到店家消費：
     可再得5xp，系統再獎勵15%coin！'''),
      Text('::::使用說明！::::'),
      Text('...'),
    ],);
  }
}