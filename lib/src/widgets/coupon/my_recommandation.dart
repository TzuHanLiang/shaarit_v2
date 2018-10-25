import 'package:flutter/material.dart';
import '../coupon/coupon_card.dart';
import '../coupon/recommand_card.dart';
import '../text_style/gesture_hint.dart';

// import '../refresh.dart';
// import '../../blocs/shaarit_provider.dart';
// import '../../models/coupon_model.dart';

class MyRecommadation extends StatelessWidget {
  
  Widget build(BuildContext context) {
    // final bloc = ShaaritProvider.of(context);

    return Column(
      children: <Widget>[
        // GestureHint(),
        // StreamBuilder(
        //   stream: bloc.couponList,
        //   builder: (BuildContext context, AsyncSnapshot<List<CouponModel>> snapshot) {
        //     return
        Container(
          height: 376.0,
          margin: EdgeInsets.only(left: 10.0),
          // child: Refresh(   // clearCache = null, need to be fixed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              // itemCount: snapshot.data.length,
              itemCount: _coupons.length,
              itemBuilder: (BuildContext context, int index) {
                return RecommandCard(_coupons[index], index);
                // return CouponCard(snapshot.data[index], index);
              },
            ),
          // ),
        ),
        //   },
        // );
      ],
    );
  }
}

class Coupon {
  final String refferrer;
  final String image;
  final String shopName;
  final String shopType;
  final String category;
  final double amount;
  final double recommendNumberOfTimes;
  Coupon(this.refferrer, this.image, this.shopName, this.shopType,
      this.category, this.amount, this.recommendNumberOfTimes);
}

List<Coupon> _coupons = [
  Coupon('Liz Liang', 'assets/images/food.jpg', 'Isinger Coffee', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon('Liz Liang', 'assets/images/food.jpg', 'Lady M', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon('Liz Liang', 'assets/images/food.jpg', 'Relax', 'restaurant', 'Pastry',
      8.0, 100.0),
  Coupon('Liz Liang', 'assets/images/food.jpg', 'W Hotel', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon('Liz Liang', 'assets/images/food.jpg', 'Lady M', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon('Liz Liang', 'assets/images/food.jpg', 'Lady M', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon('Liz Liang', 'assets/images/food.jpg', 'Isinger Coffee', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon('Liz Liang', 'assets/images/food.jpg', 'Lady M', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon('Liz Liang', 'assets/images/food.jpg', 'Relax', 'restaurant', 'Pastry',
      8.0, 100.0),
  Coupon('Liz Liang', 'assets/images/food.jpg', 'W Hotel', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon('Liz Liang', 'assets/images/food.jpg', 'Lady M', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon('Liz Liang', 'assets/images/food.jpg', 'Lady M', 'restaurant',
      'Pastry', 8.0, 100.0),
];
