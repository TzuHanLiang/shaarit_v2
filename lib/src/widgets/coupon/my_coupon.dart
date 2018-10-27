import 'package:flutter/material.dart';
import '../coupon/coupon_card.dart';
// import '../text_style/gesture_hint.dart';
// import '../refresh.dart';
// import '../../blocs/coupons_provider.dart';
// import '../../models/coupon_model.dart';

class MyCoupon extends StatelessWidget {
  Widget build(BuildContext context) {
    // final bloc = CouponsProvider.of(context);

    return Column(
      children: <Widget>[
        // GestureHint(), //移到上一層
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
                return CouponCard(_coupons[index], index);
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


//temperory
class Coupon {
  final int couponId;
  final String refferrer;
  final String image;
  final String shopName;
  final String shopType;
  final String category;
  final double amount;
  final double recommendNumberOfTimes;
  Coupon(this.couponId, this.refferrer, this.image, this.shopName, this.shopType,
      this.category, this.amount, this.recommendNumberOfTimes);
}

List<Coupon> _coupons = [
  Coupon(1, 'Liz Liang', 'assets/images/food.jpg', 'Isinger Coffee', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon(2, 'Liz Liang', 'assets/images/food.jpg', 'Lady M', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon(3, 'Liz Liang', 'assets/images/food.jpg', 'Relax', 'restaurant', 'Pastry',
      8.0, 100.0),
  Coupon(4, 'Liz Liang', 'assets/images/food.jpg', 'W Hotel', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon(5, 'Liz Liang', 'assets/images/food.jpg', 'Lady M', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon(6, 'Liz Liang', 'assets/images/food.jpg', 'Lady M', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon(7, 'Liz Liang', 'assets/images/food.jpg', 'Isinger Coffee', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon(8, 'Liz Liang', 'assets/images/food.jpg', 'Lady M', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon(9, 'Liz Liang', 'assets/images/food.jpg', 'Relax', 'restaurant', 'Pastry',
      8.0, 100.0),
  Coupon(10, 'Liz Liang', 'assets/images/food.jpg', 'W Hotel', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon(11, 'Liz Liang', 'assets/images/food.jpg', 'Lady M', 'restaurant',
      'Pastry', 8.0, 100.0),
  Coupon(12,'Liz Liang', 'assets/images/food.jpg', 'Lady M', 'restaurant',
      'Pastry', 8.0, 100.0),
];
