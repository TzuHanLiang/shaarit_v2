import 'package:flutter/material.dart';
import '../shop/shop_card.dart';
// import '../text_style/gesture_hint.dart';
// import '../refresh.dart';
// import '../../blocs/shaarit_provider.dart';
// import '../../models/coupon_model.dart';

class Shops extends StatelessWidget {
  Widget build(BuildContext context) {
    // final bloc = ShaaritProvider.of(context);

    return
        // StreamBuilder(
        //   stream: bloc.couponList,
        //   builder: (BuildContext context, AsyncSnapshot<List<CouponModel>> snapshot) {
        //     return
        Container(
      // child: Refresh(   // clearCache = null, need to be fixed
      child: ListView.builder(
        // shrinkWrap: true,
        scrollDirection: Axis.vertical,
        // itemCount: snapshot.data.length,
        itemCount: _shops.length,
        itemBuilder: (BuildContext context, int index) {
          // return CouponCard(_coupons[index], index);
          return ShopCard(_shops[index], index);
          // return CouponCard(snapshot.data[index], index);
        },
      ),
      //     ),
      //   },
      // );
    );
  }
}

//temperory
class Shop {
  final String image;
  final String shopName;
  final String shopType;
  final String category;
  final String address;
  final double distance;
  final double rebate;
  final double amount;
  final bool visit;

  Shop(this.image, this.shopName, this.shopType, this.category, this.address,
      this.distance, this.rebate, this.amount, this.visit);
}

List<Shop> _shops = [
  Shop('assets/images/food.jpg', 'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, false),
  Shop('assets/images/food.jpg', 'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, false),
  Shop('assets/images/food.jpg', 'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, false),
  Shop('assets/images/food.jpg', 'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, false),
  Shop('assets/images/food.jpg', 'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'Lady M', 'restaurant', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, false),
  Shop('assets/images/food.jpg', 'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, false),
  Shop('assets/images/food.jpg', 'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, false),
  Shop('assets/images/food.jpg', 'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, false),
  Shop('assets/images/food.jpg', 'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'W Hotel', 'hotel', 'Classic', 'Taipei', 90.0,
      10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, false),
  Shop('assets/images/food.jpg', 'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, false),
  Shop('assets/images/food.jpg', 'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, false),
  Shop('assets/images/food.jpg', 'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, false),
  Shop('assets/images/food.jpg', 'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'Relax', 'massage', 'Pastry', 'Taipei', 90.0,
      10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, false),
  Shop('assets/images/food.jpg', 'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, false),
  Shop('assets/images/food.jpg', 'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, false),
  Shop('assets/images/food.jpg', 'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, false),
  Shop('assets/images/food.jpg', 'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, true),
  Shop('assets/images/food.jpg', 'L\'OCCITANE', 'beauty', 'Pastry', 'Taipei',
      90.0, 10.0, 20.0, true),
];
